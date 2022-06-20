package chiselExample.arbiter

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util.Cat
import chiselExample.mouduleTester.ValidReceiver
import layered.stage.ElkStage
import runOption.ComplexRunner.generating

class ConvUIntToOH(inWidth: Int) extends Module {

  private val outWidth = 1 << inWidth

  val io = IO(new Bundle {
    val in  = Input(UInt(inWidth.W))
    val out = Output(UInt(outWidth.W))
  })

  require (inWidth > 0)

// 예:
//  Cat("b101".U, "b11".U)  // equivalent to "b101 11".U
//  Cat(Seq("b101".U, "b11".U))  // equivalent to "b101 11".U

  def helper(index: Int): UInt = {
    if (index < outWidth-1) Cat(helper(index+1), io.in === index.U)
    else io.in === index.U
  }

  io.out := helper(0)
  //     io.out := UIntToOH(io.in)  // Standard library implementation
  //     printf("%d -> %b\n", io.in, io.out)

}

object ConvUIntToOH extends App {

    generating(new ConvUIntToOH(3))
}