# NASPI Dataset exploration ---------------------------
#' 
#'  Two datasets, concerning oscillations were originally obtained from the NASPI website:
#'  https://www.naspi.org/site/Module/Meeting/Forms/General.aspx?m__ID=MEETING&meetingid=347
#'  
#'  These files originated with in a 2014 PNNL workshop:  "NASPI Oscillation Detection and Voltage 
#'  Stability Tools Technical Workshop - Houston, TX".  More details including related video here:
#'  https://www.naspi.org/node/440
#'  
#'  The test datasets for the workshop are no longer hosted by PNNL and have been added to this
#'  repository, as Oscillation_Detection.zip and Voltage_Stability.zip
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
local_dataset <- "./Datasets/"
workshop_filenames <- list("NASPI-2014-Workshop-Oscillation-Case1", "NASPI-2014-Workshop-Oscillation-Case2")

# Load datasets
workshop1 <- read.csv(paste0(local_dataset, workshop_filenames[[1]], ".csv"))
workshop2 <- read.csv(paste0(local_dataset, workshop_filenames[[2]], ".csv"))

ggplot(data = workshop2, mapping = aes(x = Time, y = BUS01_VPM)) + geom_line() + lims(y = c(237,240))
ggplot(data = workshop2, mapping = aes(x = Time, y = BUS01_VPA)) + geom_line() #+ lims(y = c(237,240))
ggplot(data = workshop2, mapping = aes(x = Time, y = Line_BUS01_BUS03_IPM)) + geom_line() + lims(y = c(500,600))
ggplot(data = workshop2, mapping = aes(x = Time, y = Line_BUS01_GEN01_IPM)) + geom_line() + lims(y = c(85,125))

