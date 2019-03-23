
ViewXL <- function(DataFrame, FilePath, FileName, ViewTempFile = TRUE, mac = FALSE) {
  
  if ( missing(FilePath) ) {
    FilePath <- paste0(tempfile(), ".csv")
    write_csv(DataFrame,paste0(FilePath))
  }else{
    if(missing(FileName)) {
      
      FileName <- readline(cat("--------------- \n PROMPT: \n \n Please provide a csv filename to proceed... \n \n"))
      if(!grepl(".csv", FileName)) FileName <- paste0(FileName, ".csv")
    }
    
    build_path(file.path(FilePath))
    write_csv(DataFrame,paste0(FilePath, FileName))
  }
  
  if(mac & ViewTempFile){
    shell.exec.mac <- function(x){
      # replacement for shell.exe (doesn't exist on Mac). Thanks Christiaan Bothma for picking this up.
      if (exists("shell.exec",where = "package:base"))
        return(base::shell.exec(x))
      comm <- paste("open",x)
      return(system(comm))
    }
    shell.exec.mac(paste0(FilePath))
  }
  
  if (mac == FALSE & ViewTempFile) {
    shell.exec(paste0(FilePath))
  }
  
}