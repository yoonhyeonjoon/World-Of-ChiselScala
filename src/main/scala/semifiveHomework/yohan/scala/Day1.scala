package semifiveHomework.yohan.scala

object SolutionDay1 {
    def isHappy(n: Int): Boolean = {

        var now_input : Int = n

        while (now_input >= 10){

          var im_input : Int = now_input
          now_input = 0

          do {
            now_input += (im_input%10) * (im_input%10)
            im_input = im_input/10
          }while (im_input >= 10)
        }

        if(now_input == 1.toInt) return true
        else return false
    }
}