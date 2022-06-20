package grammarForChisel

import chisel3.{Bundle, Flipped, UInt, Vec}
import chisel3.util.{Decoupled, DecoupledIO}

class Vec {

  //Below both Styles are available form  ==> Flipped(Decoupled(Vec(2, UInt(10.W)))) or Vec(2, Flipped(Decoupled(UInt(10.W))))
//  class TestBundle extends Bundle {
//  val inputTest: DecoupledIO[Vec[UInt]] = Flipped(Decoupled(Vec(2, UInt(10.W))))
//  val inputTest2: Vec[DecoupledIO[UInt]] = Vec(2, Flipped(Decoupled(UInt(10.W))))
//  }

  //Vec(200, Reg(UInt(10).W))) 이와 같은 사용은 구현단에서 불가. fill { Reg ( ) } 형태로 사용해야함

}
