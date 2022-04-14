//package mouduleTester.exampleModule
//
//import Chisel.log2Ceil
//import chisel3._
//
//class withoutModule(maxVal: Int, en: Bool) {
//  val count = RegInit(0.U(log2Ceil(maxVal+1).W))
//  when (en) {
//    when (count < maxVal.U) {
//
//    } .otherwise {
//      count := 0.U
//    }
//  }
//}
//
//object withoutModule {
//  def apply(maxVal: Int, en: Bool) = {
//    val mc = new withoutModule(maxVal, en)
//    mc.count
//
//  }
//}
//
