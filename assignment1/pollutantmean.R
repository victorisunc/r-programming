pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  result <- c()
  for (i in id) {
    filename <- paste(c(formatC(i, width = 3, format = "d", flag = "0"), ".csv"), collapse = '')
    location <- paste(c(directory, "/", filename), collapse = '')
    file <- read.csv(location)
    complete_data_by_pollutant <- file[pollutant]
    na_excluded_by_pollutant <- complete_data_by_pollutant[!is.na(complete_data_by_pollutant)]
    result <- c(result, na_excluded_by_pollutant)
  }
  round(mean(result), 3)
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
}