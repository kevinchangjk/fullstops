import json
import os
import sys
from dataclasses import dataclass
from datetime import datetime, timezone
from typing import Any, Optional

import requests
from dotenv import load_dotenv


NOTION_API_BASE = "https://api.notion.com/v1"
NOTION_VERSION = "2026-03-11"
FX_API_URL = "https://open.er-api.com/v6/latest/USD"
DEFAULT_RATE_PROPERTY = "Rate (to SGD)"
DEFAULT_TIMEOUT_SECONDS = 20


class ConfigError(Exception):
    pass


class FxRateError(Exception):
    pass


class NotionError(Exception):
    pass


@dataclass
class Config:
    notion_token: str
    notion_page_id: str
    notion_rate_property: str
    fx_api_url: str
    timeout_seconds: int


def get_required_env(name: str) -> str:
    value = os.getenv(name, "").strip()
    if not value:
        raise ConfigError(f"Missing required environment variable: {name}")
    return value


def load_config() -> Config:
    # Loads local .env when running locally.
    # In GitHub Actions, secrets are injected as environment variables directly.
    load_dotenv()

    notion_token = get_required_env("NOTION_TOKEN")
    notion_page_id = get_required_env("NOTION_PAGE_ID")
    notion_rate_property = os.getenv("NOTION_RATE_PROPERTY", DEFAULT_RATE_PROPERTY).strip() or DEFAULT_RATE_PROPERTY
    fx_api_url = os.getenv("FX_API_URL", FX_API_URL).strip() or FX_API_URL

    timeout_raw = os.getenv("HTTP_TIMEOUT_SECONDS", str(DEFAULT_TIMEOUT_SECONDS)).strip()
    try:
        timeout_seconds = int(timeout_raw)
    except ValueError as exc:
        raise ConfigError("HTTP_TIMEOUT_SECONDS must be an integer") from exc

    return Config(
        notion_token=notion_token,
        notion_page_id=notion_page_id,
        notion_rate_property=notion_rate_property,
        fx_api_url=fx_api_url,
        timeout_seconds=timeout_seconds,
    )


def fetch_usd_sgd_rate(config: Config) -> float:
    try:
        response = requests.get(config.fx_api_url, timeout=config.timeout_seconds)
        response.raise_for_status()
    except requests.RequestException as exc:
        raise FxRateError(f"Failed to fetch FX rate: {exc}") from exc

    try:
        payload = response.json()
    except ValueError as exc:
        raise FxRateError("FX API did not return valid JSON") from exc

    result = payload.get("result")
    if result != "success":
        error_type = payload.get("error-type", "unknown")
        raise FxRateError(f"FX API returned non-success result: {error_type}")

    rates = payload.get("rates")
    if not isinstance(rates, dict):
        raise FxRateError("FX API response missing 'rates' object")

    raw_rate = rates.get("SGD")
    if raw_rate is None:
        raise FxRateError("FX API response missing SGD rate")

    try:
        rate = float(raw_rate)
    except (TypeError, ValueError) as exc:
        raise FxRateError(f"Invalid SGD rate value: {raw_rate!r}") from exc

    if rate <= 0:
        raise FxRateError(f"Unexpected non-positive SGD rate: {rate}")

    return rate


def patch_notion_rate(config: Config, rate: float) -> dict[str, Any]:
    url = f"{NOTION_API_BASE}/pages/{config.notion_page_id}"
    headers = {
        "Authorization": f"Bearer {config.notion_token}",
        "Content-Type": "application/json",
        "Notion-Version": NOTION_VERSION,
    }
    body = {
        "properties": {
            config.notion_rate_property: {
                "number": rate
            }
        }
    }

    try:
        response = requests.patch(
            url,
            headers=headers,
            json=body,
            timeout=config.timeout_seconds,
        )
    except requests.RequestException as exc:
        raise NotionError(f"Failed to call Notion API: {exc}") from exc

    if response.status_code >= 400:
        try:
            error_payload = response.json()
        except ValueError:
            error_payload = {"raw_text": response.text}

        raise NotionError(
            "Notion API returned an error: "
            f"status={response.status_code}, body={json.dumps(error_payload, ensure_ascii=False)}"
        )

    try:
        return response.json()
    except ValueError as exc:
        raise NotionError("Notion API returned invalid JSON") from exc


def main() -> int:
    try:
        config = load_config()
        rate = fetch_usd_sgd_rate(config)
        notion_response = patch_notion_rate(config, rate)

        print("FX rate update succeeded.")
        print(f"USD/SGD = {rate}")
        print(f"Updated property = {config.notion_rate_property}")
        print(f"Updated page id = {config.notion_page_id}")
        print(f"Timestamp UTC = {datetime.now(timezone.utc).isoformat()}")
        print(f"Notion object = {notion_response.get('object')}")
        return 0

    except (ConfigError, FxRateError, NotionError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 1
    except Exception as exc:
        print(f"UNEXPECTED ERROR: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
