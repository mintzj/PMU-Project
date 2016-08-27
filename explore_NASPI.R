# NASPI Dataset exploration ---------------------------
#' 
#'  Two datasets, concerning oscillations were obtained from the NASPI website:
#'  https://www.naspi.org/site/Module/Meeting/Forms/General.aspx?m__ID=MEETING&meetingid=347
#' 
#'  Both are tests for contractors to demonstrate the ability to detect oscillations in the grid,
#'  containing PMU data.  It will be a useful first step to see if we can read and visualise 
#'  these datasets in R. 
#'  
#-------------------------------------------------------------------------------------------------#

# Libraries:

#  install.packages("lubridate")

library(dplyr)
library(ggplot2)
library(lubridate)


# Directory you have stored the files in
local_dataset <- "Z:/Project/ECS PMU/Ercot Workshop/Oscillation Detection/"
workshop_filenames <- list("NASPI-2014-Workshop-Oscillation-Case1", "Oscillation-Case2")

# Load datasets
workshop1 <- read.csv(paste(local_dataset, workshop_filenames[[1]], ".csv", sep = ""))
workshop2 <- read.csv(paste(local_dataset, workshop_filenames[[2]], ".csv", sep = ""))

ggplot(data = workshop2, mapping = aes(x = Time, y = BUS01_VPM)) + geom_line() + lims(y = c(237,240))
ggplot(data = workshop2, mapping = aes(x = Time, y = BUS01_VPA)) + geom_line() #+ lims(y = c(237,240))
ggplot(data = workshop2, mapping = aes(x = Time, y = Line_BUS01_BUS03_IPM)) + geom_line() + lims(y = c(500,600))
ggplot(data = workshop2, mapping = aes(x = Time, y = Line_BUS01_GEN01_IPM)) + geom_line() + lims(y = c(85,125))

