package grammarForScala

class Tabulate {

}

object Tabulate extends App{

  val l = 0 until 5
  val tabulateCall1 = Seq.tabulate(4)(i => i)
  val tabulateCall2 = Seq.tabulate(4)(_*2).toVector

  println(tabulateCall1)
  println(tabulateCall2)

}