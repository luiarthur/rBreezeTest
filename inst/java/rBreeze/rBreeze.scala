object rBreeze {
  import breeze.linalg.{DenseMatrix,inv}

  def timer[R](block: => R): R = {  
    val t0 = System.nanoTime()
    val result = block
    val t1 = System.nanoTime()
    println("Elapsed time: " + (t1 - t0) / 1E9 + "s")
    result
  }

  val n = 100
  val m = DenseMatrix.tabulate(n,n){ 
    (i,j) => scala.util.Random.nextGaussian
  }
  val m2 = m.t * m

  var dummy = inv(m2)
  def repeat(its:Int):Unit =
    if (its > 0) {
      dummy = inv(m2)
      repeat(its-1)
    }
}
