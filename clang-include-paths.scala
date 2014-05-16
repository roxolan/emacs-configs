#! /bin/bash
exec scala -savecompiled -feature "$0" "$@"
!#

import scala.sys.process._

"echo" #| "clang++ -v -E -x c++ -" run new ProcessIO(_.close(), _.close(), in =>
  scala.io.Source.fromInputStream(in).getLines.toList
	.takeWhile(!_.contains("End of search list")).reverse
	.takeWhile(!_.contains("#include <...> search starts here:"))
	.foreach(x => println("\\(framework directory\\)".r.replaceAllIn(x, ""))))
