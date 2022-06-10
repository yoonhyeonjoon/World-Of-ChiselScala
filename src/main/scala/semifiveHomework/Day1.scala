import chisel3._
import chisel3.stage._

//Mode, Operand_1, Operand_2라는 3개의 argument를 받는다
class MyCalc(opt : Int) extends Module {
    val io = IO(new Bundle {
        val mode = Input(UInt(2.W))
        val in1 = Input(UInt(opt.W))
        val in2 = Input(UInt(opt.W))
        val result = Output(UInt(opt.W))
        val carry = Output(UInt(1.W))
    })

    val wire = Wire(UInt((opt+1).W))
    when (io.mode===0.U) //add  // 0이 아닌 0.U를 쓰는 이유: mode 비트는 chisel level에서 parameterized 된 것 이므로 chisel type으로 써줘야함. 그냥 0이라고 쓰면 Scala type임.
    {
        wire := io.in1 + io.in2
    }
    .elsewhen (io.mode===1.U) //sub
    {
        wire := io.in1 - io.in2
    }
    .elsewhen (io.mode===2.U) //mul
    {
        wire := io.in1 * io.in2
    }
    .otherwise //div
    {
        wire := io.in1 / io.in2
    }

    io.result := wire
    io.carry := wire(opt)
}

println(getVerilogString(new MyCalc(8)))