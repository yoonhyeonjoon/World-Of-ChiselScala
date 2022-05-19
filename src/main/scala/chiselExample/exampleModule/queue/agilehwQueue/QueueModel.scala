package chiselExample.exampleModule.queue.agilehwQueue


class QueueModel(numEntries: Int) {
  val mq = scala.collection.mutable.Queue[Int]()
  var deqReady = false

  def attemptEnq(elem: Int) {
    if (enqReady()) mq += elem
  }

  // call first within a cycle
  // improve with Option & None
  def attemptDeq() = if (deqReady) mq.dequeue() else -1

  def enqReady() = mq.size < numEntries || (mq.size == numEntries && deqReady)
  def deqValid() = mq.nonEmpty
}