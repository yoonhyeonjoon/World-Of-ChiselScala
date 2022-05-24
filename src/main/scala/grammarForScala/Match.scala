package grammarForScala

class Match{

  abstract class Vehicle

  case class helicopter(color: String, driver: String) extends Vehicle

  case class submarine(color: String, driver: String) extends Vehicle


  val movers = Seq(helicopter("grey", "Marta"), helicopter("blue", "Laura"), submarine("yellow", "Paul"))

  movers foreach {//v => v match {
    case h: helicopter => println(s"${h.color} helicopter")
    case s: submarine => println(s"${s.color} submarine")
  }//}

  movers foreach { //_ match {
    case helicopter("blue", driver) => println(s"$driver has a blue helicopter")
    case s: submarine if (s.color != "yellow") => println(s"${s.driver}'s ${s.color} submarine")
    case _ => println("didn't match")
  }//}
}
