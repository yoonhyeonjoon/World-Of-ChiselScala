//package semifiveHomework.dias.pro2
//
//import chisel3._
//import chisel3.util._
//import chisel3.stage._
//
//
//class WaveHigh(inwidth: Int, volume: Int, maxtime: Int) extends Module {
//  val io = IO(new Bundle {
//    val in = Flipped(Irrevocable(Vec(inwidth, UInt(inwidth.W))))
//    val out = Irrevocable(UInt(inwidth.W))
//  })
//
//  io.out.valid := io.in.valid
//  io.in.ready := io.out.ready
//  io.in.bits := io.out.bits
//
//  val reg = RegNext(Vec(volume, UInt(10.W)))
//
//  val wavewait :: waveIn :: wavecheck :: Nil = Enum(3)
//  val state = RegInit(wavewait)
//
//  def counter(e: Bool): UInt = {
//    val count = RegInit(0.U(log2Ceil(maxtime+1).W))
//    count := Mux(e, Mux(count < maxtime.U, count + 1.U, 0.U), count)
//    count
//  }
//
//  val count: UInt = counter(true.B)
//
//  //FSM
//  when(state === wavewait){
//    state := waveIn
//  }.elsewhen(state === waveIn){
//    state := Mux(count === volume.U, wavecheck, waveIn)
//  }.otherwise{
//    io.out.valid := io.in.valid
//    io.in.ready := io.out.ready
//  }
//
//  //register shift
//  when(state === waveIn || state === wavecheck){
//    val k = io.in.bits.map{ x => x }
//    //reg(0) := k.reduce{(a,b) => a +& b}
//    reg.zipWithIndex.foreach{ case(reg, idx) => when (idx.U === 0.U)
//    { reg(idx) := k.reduce{(a,b) => a +& b} }.otherwise { reg(idx+1) := reg(idx) }}
//  }
//
//
//  when(state === 0){
//    val sum = reg.map{ x => x }
//    io.out.bits := sum.reduce{(a,b) => a +&b} / (volume * inwidth).U
//  }
//
//
//}
//object test4223 extends App{
//  (new ChiselStage).emitVerilog(new WaveHigh(3,4,10))
//}
