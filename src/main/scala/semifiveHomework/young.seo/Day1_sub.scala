object Solution {
    def solution(absolutes: Vector[Int], signs: Vector[Boolean]): Int = {
        
        val a = absolutes.zip(signs).map { x =>
            if (x._2)   x._1
            else       -x._1
        }
        println(a.sum)
        
        a.fold(0){case (x, y) => x + y}
        
    }
}
