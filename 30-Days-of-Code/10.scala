object Solution {
  def main(args: Array[String]) = 
    (1 to readLine.toInt).foreach(_ => println(readLine.toInt match {
      case n => (0 to 31).map(i => if ((n & (1 << 31 - i)) > 0) '1' else '0').dropWhile(_ == '0').mkString
    }))
}