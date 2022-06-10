import chisel3._
import chisel3.util._
import chisel3.tester._
import chisel3.tester.RawTester.test

class Calculator(n: Int) extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(2.W))
    val a   = Input(SInt(n.W))
    val b   = Input(SInt(n.W))
    val c   = Output(SInt(n.W))
  })
  val add = io.a +& io.b
  val minus = io.a -& io.b
  val mul = io.a * io.b
  val div = io.a / io.b

  when( io.x === 0.U ){ io.c := add }
    .elsewhen( io.x === 1.U ){ io.c := minus }
    .elsewhen( io.x === 2.U ){ io.c := mul }
    .otherwise { io.c := div }
}

object temp extends App{
  println(getVerilogString(new Calculator(3)))
}
/*object temp {
  def main(args : Array[String]) = {
    println(getVerilogString(new MyXOR))
  }
}*/
