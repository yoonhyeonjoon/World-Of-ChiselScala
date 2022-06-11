package semifiveHomework.`dias.lee`

object Solution {

  println(1)

  def solution(absolutes: Vector[Int], signs: Vector[Boolean]):Int = {

    val a = absolutes.zip(signs).map { x =>
      if(x._2)  x._1
      else  -x._1
    }
      
    a.sum

  }


}
