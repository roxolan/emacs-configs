#! /bin/bash
exec scala -savecompiled -feature "$0" "$@"
!#

import scala.sys.process._
import scala.collection.mutable.ArrayBuffer

val lines = ArrayBuffer[String]()

"echo" #| "clang++ -v -E -x c++ -" ! ProcessLogger(_ => Unit, lines += _)

val filtered = lines.takeWhile(!_.contains("End of search list")).reverse
  .takeWhile(!_.contains("#include <...> search starts here:"))

filtered.map(x => println("\\(framework directory\\)".r.replaceAllIn(x, "")))
