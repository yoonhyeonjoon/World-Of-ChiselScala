package grammarForScala

object Fill extends App {
  println(Seq.fill(10)(-1))
  println(Seq.fill(2, 3, 4)(-1))
}

//result

//List(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1)

//List(
//  List(
//        List(-1, -1, -1, -1), List(-1, -1, -1, -1), List(-1, -1, -1, -1)
//  ),
//  List(
//        List(-1, -1, -1, -1), List(-1, -1, -1, -1), List(-1, -1, -1, -1)
//  )
//)