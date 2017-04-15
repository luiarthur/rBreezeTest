.onLoad <- function(libname, pkgname) {
  lib_java_path <- paste0(libname, "/", pkgname, "/java")
  jars <- grep("*.jar", list.files())
  no_jar <- identical(jars, integer(0))
  if (no_jar) {
    # Compile the jar from src
    system(paste0(".",lib_java_path,"/genJar"))
  }
  rscala::.rscalaPackage(pkgname)
}
