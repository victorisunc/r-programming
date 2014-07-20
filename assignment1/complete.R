complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  ids <- id
  id <- c()
  nobs <- c()
  for (i in ids) {
    filename <- paste(c(formatC(i, width = 3, format = "d", flag = "0"), ".csv"), collapse = '')
    location <- paste(c(directory, "/", filename), collapse = '')
    data <- read.csv(location)
    #complete_cases <- subset(data, !is.na(data$nitrate) & !is.na(data$sulfate))
    nobs <- c(nobs, nrow(na.omit(data)))
    id <- c(id, i)
  }
  
  data.frame(id, nobs)
}