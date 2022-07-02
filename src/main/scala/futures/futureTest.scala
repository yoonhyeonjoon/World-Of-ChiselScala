package futures



object futureTest extends App {

  def function4(var1 : String, var2 : String, var3 : String)(function : (String,String, String) => (String, String)) ={
    function(var1, var2, var3)
  }


  def function2(f: (String, String) => (Boolean)) ={
    f("innerD", "innerE")
  }

  def function1(var1 : String, var2 : String, var3 : String, function : (String,String, String) => (String, String)) ={
    function(var1, var2, var3)
  }

  /**함수형 패러다임 폼 **/
  def functionalParadigm(var1 : String, var2 : String, var3 : String)(function : (String,String, String) => (String, String)) ={
    val ff = function(var1, var2, var3)
    ff._1 + ff._2
  }

  val getResult = functionalParadigm("string1", "string2", "string3"){ (a, b, c) => (a + b, (a.length * c.length).toString) }

  /**비동기형 클로져 폼 **/
  def closureParadigm(var1 : String, var2 : String, var3 : String)(function : (String,String, String) => Unit) = {
    function(var1, var2, var3)
  }

  closureParadigm("string1", "string2", "string3"){ (responseA, responseB, responseC) =>

    /**Do your task here lambda**/

  }


  val aFunction = functionalParadigm("string1", "string2", "string3") _
  aFunction((a, b, c) => (a + b, c))

//  functionalParadigm("string1", "string2", "string3")(function = (a, b, c) => function2((a, b) => true))




  function2( (a,b) => {
    true
  })


}


class futureTest {



}
