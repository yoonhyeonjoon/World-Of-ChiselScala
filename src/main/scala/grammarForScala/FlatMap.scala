package grammarForScala

class FlatMap {



}

object FlatMap extends App{

  val l = 0 until 5
  // Seq.fill(2)(3)
  val fff = l map { i => Seq.fill(i)(2*i) }
  println(fff)
  println(l flatMap { i => Seq.fill(i)(2*i) })

}
