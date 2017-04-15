# rBreezeTest

This demo repo is an R package generated using [devtools][1] and which depends
on the R package [Rscala][2] and the Scala package [Breeze][3].

R is a commonly used programming language and statistical tool used by 
statisticians. The language is interpreted and consequently slow at times
when doing a large amount of computation. This is remedied by re-writing slower
parts in C / C++ to get more performant code.

Scala is a relatively new JVM-based general-purpose programming language. It
accommodates both functional and object-oriented programming paradigms well.
Libraries are easily extensible and can even make use of other java libraries.
One such Scala library is Breeze, a numerical processing library. It includes
support for linear algebra which makes use of (optimised) native libraries,
**and** can fall back to java code when no native libraries can be found. Scala
is reasonably fast (usually 2-3 times slower than C++) but can usually be more
concise.

Rscala is an R package which provides a bi-directional interface between R 
and Scala (with callbacks). The package also enables pre-compiled jars to
be accessible in R. There is currently no functionality to compile source code
to generate jars. This is reasonable as the defining feature of JVM based
code is that it can be compiled once and run anywhere with a JVM. However, some
of Scala's compiled jars tend to be large, especially when they depend on Breeze. 
Consequently, at times one may still prefer to compile source code on the 
destination platform.

In this page, I demonstrate how to create an R package which depends on Rscala
and the Scala package Breeze (which generates jars that can be over 50 MB). 

Some good references for developing R packages are

- [Making first R package][4]
- [Simple Roxygen2 generated package][6]
- [`.onLoad`][5]

# System Requirements
Scala and SBT are the only other required software (besides R).
Follow the link below to learn how to install SBT. It's simply a matter of 
downloading some scripts and adding them to the search path 
(on unix-based systems). Scala can be installed through the Rscala package.
Though Scala can likewise be easily installed.

- [SBT install][7]

# Required R packages
Three packages are required -- `roxygen2`, `rscala` and `devtools`.

```R
install.packages("roxygen2")

install.packages("devtools")
library(devtools)
install_github("hadley/devtools") # a newer / improved version

install.packages("rscala")
### Install Scala if needed
# scalaInstall()
```

Note that `scalaInstall()` installs Scala into `~/.rscala`.

What remains is to 

- Generate package skeleton
- Add Scala project source into `inst/java/scalaProjectName`
- create an `zzz.R` file with an `.onLoad` function
- create a wrapper function for the Scala code
- `roxygenise` the package to provide documentation
- Push the repo onto Github
- install using `devtools::install_github`
- test the code


[1]: https://github.com/hadley/devtools
[2]: https://dahl-git.byu.edu/dahl/rscala/
[3]: https://github.com/scalanlp/breeze
[4]: http://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html
[5]: http://r-pkgs.had.co.nz/r.html
[6]: https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/
[7]: http://www.scala-sbt.org/release/docs/Setup.html
