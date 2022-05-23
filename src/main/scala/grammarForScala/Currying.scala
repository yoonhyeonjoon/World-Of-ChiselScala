package grammarForScala

class Currying {

  def sum(a: Int, b: Int) = a + b

  def plusX(x: Int)(b: Int) = x + b

  val f = plusX(1)_
  f(2)

  plusX(1)(2)

  Seq(0,1,2,3,4) map plusX(10)

}
