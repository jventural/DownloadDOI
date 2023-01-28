download_articles_by_doi_all <- function(df) {
  library(RCurl)
  library(stringr)
  
  for(i in 1:nrow(df)) {
    doi <- df$doi[i]
    publisher <- df$publisher[i]
    
    if(publisher == "sage") {
      pdf_url <- paste0("https://journals.sagepub.com/doi/pdf/", doi)
    } else if(publisher == "springer") {
      pdf_url <- paste0("https://link.springer.com/content/pdf/", doi, ".pdf")
    } else if(publisher == "taylor") {
      pdf_url <- paste0("https://www.tandfonline.com/doi/pdf/", doi)
    } else if(publisher == "francis") {
      pdf_url <- paste0("https://www.tandfonline.com/doi/pdf/", doi)
    } else {
      stop("Invalid publisher. Choose from 'sage', 'springer', 'taylor', or 'francis'")
    }
    filename <- paste0("path/to/destination/", doi, ".pdf")
    if(!str_detect(pdf_url, "pdf")){
      cat("No se encuentra el pdf para el DOI: ", doi, "\n")
      filename <- paste0("no_se_encuentra_archivo_pdf_",str_replace_all(doi,"/","_"),".pdf")
    }else{
      filename <- paste0(str_replace_all(doi,"/","_"),".pdf")
    }
    download.file(pdf_url, filename, mode = "wb",quiet=F)
  }
}