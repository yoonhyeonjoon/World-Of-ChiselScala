package grammarForChisel

import chisel3.util.log2Ceil

class Log2Ceil {

  //2를 밑으로하는 log 리턴값에 대한 올림.
  log2Ceil(1)  // returns 0
  log2Ceil(2)  // returns 1
  log2Ceil(3)  // returns 2
  log2Ceil(4)  // returns 2
  log2Ceil(5)  // returns 3
}
