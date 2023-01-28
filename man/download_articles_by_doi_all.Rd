\name{download_articles_by_doi_all}
\alias{DownloadDOI}
\title{Download articles by DOI}

\description{
This package provides a function to download articles in PDF format through their DOI.
}

\usage{
download_articles_by_doi_all(x)
}

\arguments{
\item{x}{a dataframe}

}


\examples{
df <- data.frame(
doi =
c("10.1007/s12124-021-09632-w",
"10.1007/s13178-021-00629-z",
"10.1007/s12124-022-09716-1",
"10.1080/00140139.2022.2100927",
"10.1177/21582440221148628"),
publisher =
c("springer",
"springer",
"springer",
"taylor",
"sage"))
download_articles_by_doi_all(df)
}


