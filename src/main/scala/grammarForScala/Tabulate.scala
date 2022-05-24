package grammarForScala

class Tabulate {

}

object Tabulate extends App{

  val l = 0 until 5
  val ff2 = Seq.tabulate(4)(i => i)
  val ff3 = Seq.tabulate(4)(_*2).toVector

  println(ff2)
  println(ff3)

}