import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.internal.sourceinfo.SourceInfo
import chisel3.util.random.FibonacciLFSR
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp, LazyScope, NexusNode, RenderedEdge, SimpleNodeImp, SinkNode, SourceNode, ValName}
import freechips.rocketchip.macros.ValNameImpl


case class UpwardParam(width: Int)
case class DownwardParam(width: Int)
case class EdgeParam(width: Int)

object AdderNodeImp extends SimpleNodeImp[DownwardParam, UpwardParam, EdgeParam, UInt] {
  def edge(pd: DownwardParam, pu: UpwardParam, p: Parameters, sourceInfo: SourceInfo) = {
    if (pd.width < pu.width) EdgeParam(pd.width) else EdgeParam(pu.width)
  }
  def bundle(e: EdgeParam) = UInt(e.width.W)


  def render(e: EdgeParam) = RenderedEdge("blue", s"width = ${e.width}")
}


object NexusNodeImp extends SimpleNodeImp[DownwardParam, UpwardParam, EdgeParam, UInt] {
  def edge(pd: DownwardParam, pu: UpwardParam, p: Parameters, sourceInfo: SourceInfo) = {

    if (pd.width < pu.width) EdgeParam(pd.width) else EdgeParam(pu.width)
  }
  def bundle(e: EdgeParam) = UInt(e.width.W)

  def render(e: EdgeParam) = RenderedEdge( "#ffff00" /* yellow */, s"width = ${e.width}")
}


class CalculatorNexusNode(
              dFn: Seq[DownwardParam] => DownwardParam,
              uFn: Seq[UpwardParam]   => UpwardParam)(implicit valName: ValName)
  extends NexusNode(NexusNodeImp)(dFn, uFn)


class CalculatorSinkNode(uFn : Seq[UpwardParam])(implicit valName: ValName)
  extends SinkNode(NexusNodeImp)(uFn)

class ControllerNode(widths: Seq[DownwardParam])(implicit valName: ValName)
                extends SourceNode(AdderNodeImp)(widths)

class Controller(width: Int)(implicit p: Parameters) extends LazyModule  with LazyScope{

  val node = new ControllerNode(Seq.fill(2)(DownwardParam(width)))

  lazy val module: LazyModuleImp = new LazyModuleImp(this) {
    val randomAddend: UInt = FibonacciLFSR.maxPeriod(4)
    node.out.foreach { case (addend, _) => addend := randomAddend }
    node.out.foreach { node => dontTouch(node._1) }
  }

  override lazy val desiredName = "Controller"
}


class CheckerNode(width: UpwardParam)(implicit valName: ValName)
                extends SinkNode(AdderNodeImp)(Seq(width))

class AdderNode(dFn: Seq[DownwardParam] => DownwardParam,
                uFn: Seq[UpwardParam] => UpwardParam)(implicit valName: ValName)
                extends NexusNode(AdderNodeImp)(dFn, uFn)

class Calculator()(implicit p: Parameters) extends LazyModule {

  val linkDownwardFun: Seq[DownwardParam] => DownwardParam = { dps: Seq[DownwardParam] =>
    require(dps.forall(dp => dp.width == dps.head.width), "inward, downward adder widths must be equivalent")
    dps.head
  }
  val linkUpwardFun: Seq[UpwardParam] => UpwardParam = { dps: Seq[UpwardParam] =>
    require(dps.forall(dp => dp.width == dps.head.width), "inward, downward adder widths must be equivalent")
    dps.head
  }

  val inNode1 = new CalculatorNexusNode(linkDownwardFun, linkUpwardFun)
  val inNode2 = new CalculatorNexusNode(linkDownwardFun, linkUpwardFun)

  val outNodeO = new CalculatorNexusNode(linkDownwardFun, linkUpwardFun)
  val outNodeA = new CalculatorNexusNode(linkDownwardFun, linkUpwardFun)
  val outNodeB = new CalculatorNexusNode(linkDownwardFun, linkUpwardFun)

  val subModuleA: SubModule = LazyModule(new SubModule)
  val subModuleB: SubModule = LazyModule(new SubModule)
  val adder : Adder = LazyModule(new Adder)

  subModuleA.node := inNode1
  subModuleB.node := inNode2

  adder.node := subModuleA.node
  adder.node := subModuleB.node

  outNodeO := adder.node
  outNodeA := subModuleA.node
  outNodeB := subModuleB.node

//  om {
////    OM.EnglishmanInNewyork.title := s"This title Name is $desiredName"
////    OM.EnglishmanInNewyork.englishMan := Seq("englishmanInNewyork1","englishmanInNewyork2","englishmanInNewyork3")
//  }

  lazy val module: LazyModuleImp = new LazyModuleImp(this) {
    inNode1.in.zip(inNode1.out).foreach { case (in, out) =>
      out._1 := in._1
    }
    inNode2.in.zip(inNode2.out).foreach { case (in, out) =>
      out._1 := in._1
    }
    outNodeO.in.zip(outNodeO.out).foreach { case (in, out) =>
      out._1 := in._1
    }
    outNodeA.in.zip(outNodeA.out).foreach { case (in, out) =>
      out._1 := in._1
    }
    outNodeB.in.zip(outNodeB.out).foreach { case (in, out) =>
      out._1 := in._1
    }
  }
  override lazy val desiredName = "Calculator"
}



class SubModuleNode(dFn: Seq[DownwardParam] => DownwardParam,
                uFn: Seq[UpwardParam] => UpwardParam)(implicit valName: ValName)
  extends NexusNode(AdderNodeImp)(dFn, uFn)


class SubModuleSinkNode(uFn : Seq[UpwardParam])(implicit valName: ValName)
  extends SinkNode(NexusNodeImp)(uFn)

class AdderModuleSinkNode(uFn : Seq[UpwardParam])(implicit valName: ValName)
  extends SinkNode(NexusNodeImp)(uFn)

class ObsoltedSubModule()(implicit p: Parameters) extends LazyModule {
  //new CalculatorSinkNode(Seq(UpwardParam(8)))
  val node = new SubModuleSinkNode(Seq(UpwardParam(8)))

  lazy val module: LazyModuleImp = new LazyModuleImp(this) {
        require(node.in.nonEmpty)
        node.out.head._1 := node.in.map(_._1).reduce(_ + _) //Seq Çü½ÄÀÌÁö¸¸, ½ÇÁ¦ µé¾î¿À´Â °ªÀº 1°³ÀÓ
  }
}

class SubModule(implicit p: Parameters) extends LazyModule {

  val node = new SubModuleNode (
    { dps: Seq[DownwardParam] =>
      require(dps.forall(dp => dp.width == dps.head.width), "inward, downward adder widths must be equivalent")
      dps.head
    },
    { ups: Seq[UpwardParam] =>
      require(ups.forall(up => up.width == ups.head.width), "outward, upward adder widths must be equivalent")
      ups.head
    }
  )

//  om {
//    OM.AddressBlock.name := "Logical Part : SubModule is added for my example"
//  }

  lazy val module: LazyModuleImp = new LazyModuleImp(this) {

//    om {
////      OM.EnglishmanInNewyork.englishMan := "englishmanInNewyork"
//      OM.AddressBlock.name := "Physical Part : SubModule is added for my example"
//      OM.LazyModule.edgeDataBindings
//    }

    node.in.zip(node.out).foreach { case (in, out) =>
      out._1 := in._1
    }
  }

  override lazy val desiredName = "SubModule"
}



class Adder(implicit p: Parameters) extends LazyModule {

  val node = new SubModuleNode (
    { dps: Seq[DownwardParam] =>
      require(dps.forall(dp => dp.width == dps.head.width), "inward, downward adder widths must be equivalent")
      dps.head
    },
    { ups: Seq[UpwardParam] =>
      require(ups.forall(up => up.width == ups.head.width), "outward, upward adder widths must be equivalent")
      ups.head
    }
  )

  lazy val module: LazyModuleImp = new LazyModuleImp(this) {
    require(node.in.size >= 2)
    node.out.head._1 := node.in.map(_._1).reduce(_ + _)
  }

  override lazy val desiredName = "Adder"
}


class Checker(width: Int, numOperands: Int)(implicit p: Parameters) extends LazyModule {
  val nodeSeq: Seq[CheckerNode] = Seq.fill(numOperands) {new CheckerNode(UpwardParam(width)) }
  val nodeSum = new CheckerNode(UpwardParam(width))

  lazy val module = new LazyModuleImp(this) {

    val io = IO(new Bundle {
      val error: Bool = Output(Bool())
    })
    io.error := nodeSum.in.head._1 =/= nodeSeq.map(_.in.head._1).reduce(_ + _)
  }

  override lazy val desiredName = "AdderMonitor_hereUp"
}

/** top-level connector */
class ComplexAdderTestHarness()(implicit p: Parameters) extends LazyModule{

  def childFinder(module: LazyModule):Unit ={
    val children = module.getChildren
//    module.om{
////      OM.hierarchyInfoTest.myTestChildren := Seq()
//    }
    children.foreach{ aChild =>
//      aChild.parents.head.om {
////        OM.hierarchyInfoTest.myTestChildren.append(aChild.om.id)
//      }
//      aChild.om{
////        OM.hierarchyInfoTest.myTestParent := module.om.id
//      }
      childFinder(aChild)
    }
  }

  val controller: Controller = LazyModule(new Controller(width = 8))
  val calculator: Calculator = LazyModule(new Calculator())
  val checker: Checker = LazyModule(new Checker(width = 4, numOperands = 2))

  checker.nodeSum := calculator.outNodeO
  checker.nodeSeq(0) := calculator.outNodeA
  checker.nodeSeq(1) := calculator.outNodeB

  calculator.inNode1 := controller.node
  calculator.inNode2 := controller.node

  lazy val module: LazyModuleImp = new LazyModuleImp(this) {

    childFinder(wrapper)

//    om {
//      //OM.EnglishmanInNewyork.englishMan := "englishmanInNewyork"
//      OM.AddressBlock.name := "Physical Part : SubModule is added for my example"
//      OM.LazyModule.edgeDataBindings
////      OM.hierarchyInfoTest.myTestParent := om.id
//    }

//    when(checker.module.io.error) {
//      printf("something went wrong")
//    }
  }

  override lazy val desiredName = "ComplexAdderTestHarness"
}



object ComplexAdderRunner extends App{

  case class TestCase(width: Int)
  val test22 = ValNameImpl("hello")

  val xxxx =1

}
