.onLoad <- function(libname, pkgname) {

  lib_java_path <- paste0(libname, "/", pkgname, "/java")
  jars <- grep("*.jar", list.files(lib_java_path))
  no_jar <- identical(jars, integer(0))

  if (no_jar) {
    # Compile the jar from src
    compile_jar <- "sbt assembly;"
                                           #TO EDIT#
    cd_path <- paste0("cd ",lib_java_path, "/rBreeze;")
                         ########## TO EDIT ##################
    mv_jar <- "mv target/scala-2.11/rBreeze-assembly-0.1.0.jar ../"

    system(paste(cd_path, compile_jar, mv_jar))
  }

  rscala::.rscalaPackage(pkgname)

}
