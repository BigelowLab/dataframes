packages = c("dplyr", "data.table","tidytable", "nycflights13", "sf")
installed = installed.packages()
for (package in packages){
  if (!package %in% rownames(installed)){
    install.packages(package)
  }
  suppressPackageStartupMessages({
    library(package, character.only = TRUE)
  })
}

#' Read in the `flights` data as a user-specified type
#' of data frame
#' 
#' @param type chr, the type of table to return
#' @return a data frame of the specified type
read_flights = function(type = c("data.frame",
                                 "tibble",
                                 "data.table",
                                 "tidytable")[1]){
  switch(tolower(type[1]),
         "data.frame" = as.data.frame(flights),
         "tibble" = dplyr::as_tibble(flights),
         "data.table" = data.table::as.data.table(flights),
         "tidytable" = tidytable::as_tidytable(flights))
}
