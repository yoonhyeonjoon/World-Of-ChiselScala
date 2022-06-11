object Solution {
    def solution(absolutes: Vector[Int], signs: Vector[Boolean]): Int = {

        var total_adder : Int = 0

        for ( i <- 0 to signs.length -1 ){
            if( signs(i) )
                total_adder += absolutes(i)
            else
                total_adder -= absolutes(i)
        }

        return total_adder
    }
}