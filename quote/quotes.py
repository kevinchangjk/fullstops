#! /usr/bin/python
import json
import textwrap
import subprocess
import random

f = open('/Users/kevin/ripples/fullstops/quote/quotes.json','r')
data = json.load(f)
f.close()
tput = str(subprocess.check_output(['tput','cols']))
width = int(tput.split("\'")[1].split("\\")[0]) - 4
c = random.randrange(len(data))

wrapped = textwrap.wrap(data[c]['text'],width)
wrapped = ["  "+x for x in wrapped]
print()
print(*wrapped,sep="\n")
print()
print("    -",data[c]['author'])
print()
