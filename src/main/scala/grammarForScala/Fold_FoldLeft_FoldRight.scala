package grammarForScala

object Fold_FoldLeft_FoldRight extends App
{
  val tab1 = Seq.tabulate(4)(_*2)
  val vec1 = Seq.tabulate(4)(_*2).toVector

  println(vec1)
  println(vec1.last)

  var tab2 = tab1.foldRight(tab1.last){_ + _}
  var tab21 = tab1.foldRight(tab1.last) {
    case (prev:Int, current:Int) =>
      println(s"prev = ${prev} : current = ${current}")
      prev + current*2
    /** 출력 예시 : foldRight는 오른쪽부터 시작
      prev = 6 : current = 6
      prev = 4 : current = 18
      prev = 2 : current = 40
      prev = 0 : current = 82 */
  }

  println()


  val vec3 = vec1.foldLeft(0) {
    case (prev:Int, current:Int) =>
      println(s"prev = ${prev} : current = ${current}")
      prev + current*2
      /** 출력 예시 : foldLeft는 왼쪽부터 시작
      prev = 0 : current = 0
      prev = 0 : current = 2
      prev = 4 : current = 4
      prev = 12 : current = 6 */
  }


  println(s"tab2 : 6 + 6 + 4 + 2 = result : ${tab2}")
  println(s"vec3 : (0 : initial) + 0 + 2 + 4 + 6 + 12 : result ${vec3}")

}