# Script Description --------------------
# This script creates a stacked area graph of multi-temporal land cover data, particularly
# the land cover maps produced using combined Landsat+SAR data (optical Landsat 5 TM/8 OLI;
# L-band SAR JERS-1/ALOS-PALSAR-1/ALOS-PALSAR-2) at three time-points: 1996,2007,2016 for
# Myanmar. The land cover maps consist of 9 categories including: bare ground, built-up,
# forest, mangrove, oil palm, rice paddy, rubber, shrubland, water (from an original 10
# classes minus ice/snow)
#
# Script By:      Jose Don T De Alban
# Date Created:   20 Nov 2017
# Last Modified:  09 Jul 2019


# Set Working Directory -----------------
setwd("/Users/dondealban/Dropbox/Research/myanmar/3 mmr land cover transitions/mangroves/stacked area/1_ayeyarwady")

# Load Libraries and Data ---------------
library(reshape2)
library(tidyverse)

# Read csv files in the directory and store as a list
filenames <- list.files()

# Function to read data
readdata <- function(filename) {
  df <- read.csv(filename, sep="\t")
  vec <- df[, 3]           # Read column with percentage values
  names(vec) <- df[, 1]    # Read column with class codes
  return(vec)
}

# Combine as class codes and percentage values in a matrix
temp <- do.call(rbind, lapply(filenames, readdata))
colnames(temp) <- c("1","2","3","4","5","6","7","8","9")

# Add years as another column
row.names(temp) <- c("1996","2007","2016")

# Convert wide format data frame into long format data frame
data <- melt(temp, id.vars="years", variable.name="class", value.name="percentage")
colnames(data) <- c("Years","Class","Percentage")

# Create Stacked Area Graphs ------------

plot <- ggplot() + geom_area(aes(x=Years, y=Percentage, fill=factor(Class,
                   labels=c("Bare Ground",
                            "Built-up",
                            "Forest",
                            "Mangrove",
                            "Oil Palm Mature",
                            "Rice Paddy",
                            "Rubber Mature",
                            "Shrub/Orchard",
                            "Water Body"))), 
                   data=data)
plot <- plot + labs(title="Net Land Cover Transitions: Ayeyarwady Region", x="Year", y="Percentage of Landscape", fill="Land Cover Category")
plot <- plot + guides(fill=guide_legend(ncol=1))
plot <- plot + theme_bw()
plot <- plot + scale_fill_manual(values=c("#ffff66","#ff0000","#246a24","#6666ff","#ff8000",
                                          "#a65400","#ff00ff","#ccff66","#66ccff"))
plot <- plot + scale_x_continuous(breaks=c(1996,2007,2016))
plot <- plot + theme(legend.position="none")

ggsave(plot, file="StackedArea-01-Ayeyarwady.pdf", width=16, height=15, units="cm", dpi=300)
