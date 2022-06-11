object Solution {
    def isHappy(n: Int): Boolean = {

        var happy: Int = n

        while(happy>=10){

            var temp: Int = happy
            happy = 0

            do{

                happy += (temp % 10) * (temp % 10)
                temp = temp / 10

            }while(temp>=10)

        }

        if(happy==1) return true
        else         return false


    }
}