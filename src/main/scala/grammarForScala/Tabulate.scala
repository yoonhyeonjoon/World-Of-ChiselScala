package grammarForScala

class Tabulate {
  val ff2 = Seq.tabulate(4)(i => i)
  val ff3 = Seq.tabulate(4)(_*2)
}
