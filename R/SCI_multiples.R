SCI_multiples <- function(dois) {
  library(rvest)
  library(stringr)
  getwd()
  #iterar a través de cada doi en la lista
  for(doi in dois){
    #construir la url
    web <- paste0("https://sci-hub.st/", doi)
    #leer el html de la página
    web_info <- read_html(web, encoding = "UTF-8")
    web_target <- html_nodes(web_info, "#pdf")
    mypdf <- paste0("https://sci-hub.st", html_attr(web_target, name = "src"))
    #descargar el archivo pdf
    if(length(web_target) == 0){
      cat("No se encuentra el pdf para el DOI: ", doi, "\n")
      filename <- paste0("no_se_encuentra_archivo_pdf_",str_replace_all(doi,"/","_"),".pdf")
    }else if(!str_detect(mypdf, "downloads")){
      cat("No se encuentra el pdf para el DOI: ", doi, "\n")
      filename <- paste0("no_se_encuentra_archivo_pdf_",str_replace_all(doi,"/","_"),".pdf")
    }else{
      filename <- paste0(str_replace_all(doi,"/","_"),".pdf")
    }
    download.file(mypdf, filename, mode = "wb",quiet=F)
    next
  }
}
