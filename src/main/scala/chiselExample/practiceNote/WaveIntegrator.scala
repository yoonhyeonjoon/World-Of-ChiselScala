package chiselExample.practiceNote

import chisel3._


class VolumeIntegrator() extends Module {


  class VolumeIntegratorBundle extends Bundle {
    val in: DecoupledIO[Vec[UInt]] = Flipped(Decoupled(Vec(domainParams.inputNumber, UInt(domainParams.outputBits.W)))) //input size depends on outputNumber
    val out: Vec[UInt] = Output(Vec(domainParams.outputNumber, UInt(domainParams.inputBits.W))) //counting number depends on inputNumber.
  }

  val io = IO(new DomainChangerBundle)

  /**해당 위치에서 구현**/

}