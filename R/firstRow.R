#' Extract First Row
#'
#' This function extracts the first row for each patient from
#' a longform dataset, assuming patient identifiers are located
#' in the first column of the dataset.
#' @param ds longform dataset with patient ID in first column
#' @keywords
#' @export
#' @examples
#' firstRow()

firstRow <- function(ds){
  pxList <- unique(ds[,1])
  dsnew <- list()
  for(i in 1:length(pxList)){
    ## extract all rows with Ith patient
    tmp <- ds[which(ds[,1] == pxList[i]),]
    ## add 1st row to list of new rows
    dsnew[[i]] <- tmp[1,]
  }
  ## return list as data.frame
  return(do.call("rbind", dsnew))
}