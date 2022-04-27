package functional



object ClockHelper {

  object Tester{
    import Chisel.fromBooleanToLiteral
    import chisel3.Bool
    import chisel3.tester.testableData

    def SubClockCycling(standardClock:Int, ratio:Int = 1, subClock : =>Bool) = {
      if(standardClock % ratio >= (ratio/2)) subClock.poke(true.B)
      else subClock.poke(false.B)
    }


  }


}
