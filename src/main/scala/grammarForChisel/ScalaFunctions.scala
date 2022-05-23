package grammarForChisel

object ScalaFunctions extends App {

  val exampleSeq = Seq(1,2,3,4,5,6,7,8,9,10)
  val mapBits = exampleSeq map { _ + 1 }
  val reduceBits = exampleSeq reduce { (a, b) => a * b }
  val reduceBits2 = exampleSeq reduce { _ * _  } //1*2*3*....10
  //  val emptyBits = exampleSeq map { !_ }

  val ff = 1
  val gg = 1
}
