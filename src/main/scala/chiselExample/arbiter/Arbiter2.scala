package chiselExample.arbiter

import chisel3._
import chisel3.util._

class MyArb(numPorts: Int, n: Int) extends Module {
  val io = IO(new Bundle {
    val req = Flipped(Vec(numPorts, Decoupled(UInt(n.W))))
    val out = Decoupled(UInt(n.W))
  })
  require (numPorts > 0)
  val inValids = Wire(Vec(numPorts, Bool()))
  val inBits   = Wire(Vec(numPorts, UInt(n.W)))
  val chosenOH = PriorityEncoderOH(inValids)
  for (p <- 0 until numPorts) {
    io.req(p).ready := chosenOH(p) && io.out.fire
    inValids(p) := io.req(p).valid
    inBits(p) := io.req(p).bits
  }
  io.out.valid := inValids.asUInt.orR
  io.out.bits := Mux1H(chosenOH, inBits)
}

class MyArb2(numPorts: Int, n: Int) extends Module {
  val io = IO(new Bundle {
    val req = Flipped(Vec(numPorts, Decoupled(UInt(n.W))))
    val out = Decoupled(UInt(n.W))
  })
  require (numPorts > 0)
  val inValids = io.req map { _.valid }
  //     io.out.valid := VecInit(inValids).asUInt.orR
  io.out.valid := inValids reduce { _ || _ }
  val chosenOH = PriorityEncoderOH(inValids)
  io.out.bits := Mux1H(chosenOH, io.req map { _.bits })
  io.req.zip(chosenOH) foreach { case (i, c) => i.ready := c && io.out.fire}

}