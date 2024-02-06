const fs = require("fs");
const quotes = require("./res.json");
const ogSize = quotes.length;

function swap(items, leftIndex, rightIndex) {
  var temp = items[leftIndex];
  items[leftIndex] = items[rightIndex];
  items[rightIndex] = temp;
}
function partition(items, left, right) {
  var pivot = items[Math.floor((right + left) / 2)], //middle element
    i = left, //left pointer
    j = right; //right pointer
  while (i <= j) {
    while (items[i].author < pivot.author) {
      i++;
    }
    while (items[j].author > pivot.author) {
      j--;
    }
    if (i <= j) {
      swap(items, i, j); //sawpping two elements
      i++;
      j--;
    }
  }
  return i;
}

function quickSort(items, left, right) {
  var index;
  if (items.length > 1) {
    index = partition(items, left, right); //index returned from partition
    if (left < index - 1) {
      //more elements on the left side of the pivot
      quickSort(items, left, index - 1);
    }
    if (index < right) {
      //more elements on the riht side of the pivot
      quickSort(items, index, right);
    }
  }
  return items;
}
// first call to quick sort
var res = quickSort(quotes, 0, quotes.length - 1);

const data = JSON.stringify(res, null, 2);

fs.writeFile("res.json", data, (err) => {
  if (err) {
    throw err;
  }
  console.log(res.length);
});
