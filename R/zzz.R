.onLoad <- function(libname, pkgname) {
  lib_java_path <- paste0(libname, "/", pkgname, "/java")
  no_jar <- identical(list.files(lib_java_path), character(0))
  if (no_jar) {
    # Compile the jar from src
    system(paste0(".",lib_java_path,"/genJar"))
  }
  rscala::.rscalaPackage(pkgname)
}
