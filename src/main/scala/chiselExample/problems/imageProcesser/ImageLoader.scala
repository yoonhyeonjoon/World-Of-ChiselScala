package chiselExample.problems.imageProcesser

import java.awt.Color
import java.awt.image.BufferedImage
import java.io.File
import javax.imageio.ImageIO
import scala.collection.mutable
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{Await, Future}
import scala.reflect.io

class ImageLoader {
  def extractor(scaleFactor : Int = 1 /*ex : scaleFactor = 2이면 2배 축소*/,
                img: BufferedImage): Seq[Seq[mutable.Buffer[Int]]] = {
    val ww = img.getWidth
    val hh = img.getHeight
    val colorExtracted: Seq[Seq[mutable.Buffer[Int]]] = Seq.fill(3){Seq.fill(hh/scaleFactor){ mutable.Buffer.fill(ww/scaleFactor) {0}}}
    for(yy <- 0 until hh by scaleFactor) {
      for(xx <- 0 until ww by scaleFactor) {
        val color = new Color(img.getRGB(xx,yy), false)
        try {
          colorExtracted.head(yy/scaleFactor)(xx/scaleFactor) = color.getRed
          colorExtracted(1)(yy/scaleFactor)(xx/scaleFactor) = color.getGreen
          colorExtracted(2)(yy/scaleFactor)(xx/scaleFactor) = color.getBlue
        }
        catch {
          case ex: Exception => /*println(ex)*/
        }


      }
    }
    colorExtracted
  }

  def loadImages(folderPath : String,
                 scaleFactor : Int = 1 /*ex : scaleFactor = 2이면 2배 축소*/,
                 response : ((Int, Int), Array[(String, Seq[Seq[mutable.Buffer[Int]]])]) => Unit): Unit = {
    // 단일 이미지 접근에 대한 테스트 예제 주석
    //    // println(Paths.get(".").toAbsolutePath) 현재 접근에 대한 절대 경로를 확인할 수 있습니다
    //    val photo1 = ImageIO.read(new File("src\\main\\scala\\chiselExample\\problems\\imageProcesser\\imageSet\\frame_000_delay-0.04s.gif"))
    //    val extracted = extractor(photo1)
    val dir = io.File(folderPath)
    val getLists = dir.jfile
    var width : Int = 0
    var height : Int = 0
    val imageLoaded: Array[(String, Seq[Seq[mutable.Buffer[Int]]])] = getLists.list().map { aFileName =>
      val aFuture: Future[Seq[Seq[mutable.Buffer[Int]]]] = Future {
        val fullPath = folderPath + "\\" + aFileName
        val readFile = ImageIO.read(new File(fullPath))
        width = readFile.getWidth/scaleFactor
        height = readFile.getHeight/scaleFactor
        extractor(scaleFactor, readFile)
      }

      val get = Await.result(aFuture, Duration.Inf)
      (aFileName, get)
    }

    response((height, width), imageLoaded)
  }
}

object ImageLoader extends App{
  val aFuturable = Future {
    new ImageLoader().loadImages("src/main/scala/chiselExample/problems/imageProcesser/imageSet", response = { (info, response) =>
      response(0)._2(0).foreach{ s =>
        s.foreach{ g =>
          if(g == 255) print(0)
          else print(1)
        }
      }
    })
  }
  Await.result(aFuturable, Duration.Inf)
}