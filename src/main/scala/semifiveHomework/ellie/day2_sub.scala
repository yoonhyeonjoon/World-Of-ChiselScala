object Solution {
  def solution(absolutes: Vector[Int], signs: Vector[Boolean]): Int = {

    val arr = absolutes.zip(signs).map{
      case(num,sign) =>
        if(sign) num
        else -num
    }.sum
    return arr
  }
}