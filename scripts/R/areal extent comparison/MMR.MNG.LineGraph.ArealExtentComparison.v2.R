# Script Description --------------------
# This R script generates line graphs to visualise estimates of net areal extents of
# mangroves at specific time-points in Myanmar and its sub-national units reported 
# from published studies.
#
# Script By:      Jose Don T De Alban
# Date Created:   15 Jan 2019
# Last Modified:  04 Nov 2019

# Set Working Directory -------------------
setwd("/Users/dondealban/Dropbox/Research/myanmar/3 mmr land cover transitions/mangroves/areal extent/")

# Load Libraries --------------------------
library(plyr)
library(dplyr)
library(ggplot2)
library(egg)

# Read Input Data -------------------------
dfAREAL <- read.csv(file="R_MMR MNG Net Areal Extent Comparison.csv", header=TRUE, sep=",")

# Reorganise Data -------------------------
RefID <- c("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U")
Reference <- c("This study",
               "Blasco & Aizpuru, 2002",
               "Blasco et al., 2001",
               "Bunting et al., 2018",
               "Connette et al., 2016",
               "De Alban et al., 2018",
               "Estoque et al., 2018",
               "FAO, 2010",
               "Gaw et al., 2018",
               "Giri et al., 2008",
               "Giri et al., 2011",
               "Hamilton & Casey, 2016 [MFW]",
               "Hamilton & Casey, 2016 [BIOME]",
               "IUCN, 1983",
               "Maung, 2012",
               "Oo, 2002",
               "Richards & Friess, 2015",
               "Spalding et al., 1997",
               "Webb et al., 2014",
               "Weber et al., 2014",
               "Zockler et al., 2013")
lookup <- as.data.frame(cbind(Reference,RefID), stringsAsFactors=TRUE)

# Match time interval with year in new column based on lookup table 
dfAREAL <- join(dfAREAL, lookup, by='Reference') # Need plyr package

# Subset Data -----------------------------
dfSUB1 <- dfAREAL %>% filter(Study_Area %in% "Myanmar")
dfSUB2 <- dfAREAL %>% filter(Study_Area %in% c("Ayeyarwady","Rakhine","Tanintharyi"))
dfSUB3 <- dfAREAL %>% filter(Study_Area %in% c("Bago","Mon","Yangon"))

# Subset from Subset: Single-Year Studies
dfSUBSUB1 <- dfSUB1 %>% filter(RefID %in% "B" | RefID %in% "C" | RefID %in% "D" | RefID %in% "H" | 
                               RefID %in% "K" | RefID %in% "N" | RefID %in% "R")
dfSUBSUB2 <- dfSUB2 %>% filter(RefID %in% "E" | RefID %in% "H" | RefID %in% "U")

# Define Plots ----------------------------

# Plot #1: Myanmar
plot1 <- ggplot() + geom_line(data=dfSUB1, aes(x=Time_Point, y=Areal_Extent_Km2, color=RefID), stat="identity")
plot1 <- plot1 + geom_point(data=dfSUBSUB1, aes(x=Time_Point, y=Areal_Extent_Km2, color=RefID), stat="identity")
plot1 <- plot1 + facet_wrap(~Study_Area)
text1 <- data.frame(
  label = c("A","B,C","D","G","H","J","K","L","M","N","P","Q","R"),
  Study_Area = c("Myanmar"),
  x = c( 1996,2002,2010,2000,2009,1975,2001.5,2000,2000,1983,1954,2000,1997),
  y = c(13230,7500,5500,6668,4450,8515,5600,2700,4150,5250,2346,5025,3900)
)
plot1 <- plot1 + geom_text(data=text1, aes(x=x, y=y, label=label), size=2.5, nudge_x=-0.75, nudge_y=100)
plot1 <- plot1 + theme_gray()
plot1 <- plot1 + theme(legend.position="none", axis.title.x=element_blank()) + labs(y=" ")

# Plot #2: Extensive mangrove regions
plot2 <- ggplot() + geom_line(data=dfSUB2, aes(x=Time_Point, y=Areal_Extent_Km2, color=RefID), stat="identity")
plot2 <- plot2 + geom_point(data=dfSUBSUB2, aes(x=Time_Point, y=Areal_Extent_Km2, color=RefID), stat="identity")
plot2 <- plot2 + facet_wrap(~Study_Area, nrow=1)
text2 <- data.frame(
  label = c("A","A","A","F","G","G","G","I","O","O","O","S","T","T","T","E","H","U"),
  Study_Area = c("Ayeyarwady","Rakhine","Tanintharyi","Tanintharyi","Ayeyarwady","Rakhine","Tanintharyi",
                 "Tanintharyi","Ayeyarwady","Rakhine","Tanintharyi","Ayeyarwady","Ayeyarwady","Rakhine",
                 "Tanintharyi","Tanintharyi","Ayeyarwady","Ayeyarwady"),
  x = c(1996,1996,1996,1995,2000,2000,2000,1989,1980,1980,1980,1978,2000,2000,2000,2016,2005,2001),
  y = c(4290,3440,4220,3511,1740,2048,2774,2588,2964,1675,1951,2623,818,1734,2075,2550,950,1250)
)
plot2 <- plot2 + geom_text(data=text2, aes(x=x, y=y, label=label), size=2.5, nudge_x=-1, nudge_y=100)
plot2 <- plot2 + theme_gray()
plot2 <- plot2 + theme(legend.position="none", axis.title.x=element_blank()) + labs(y="Areal Extent (sq.km)")

# Plot #3: Non-extensive mangrove regions
plot3 <- ggplot() + geom_line(data=dfSUB3, aes(x=Time_Point, y=Areal_Extent_Km2, color=RefID), stat="identity")
plot3 <- plot3 + facet_wrap(~Study_Area, nrow=1)
text3 <- data.frame(
  label = c("A","A","A","G","G"),
  Study_Area = c("Bago","Mon","Yangon","Mon","Yangon"),
  x = c(1996,1996,1996,2000,2000),
  y = c(240,850,205,81,25)
)
plot3 <- plot3 + geom_text(data=text3, aes(x=x, y=y, label=label), size=2.5, nudge_x=-0.75, nudge_y=10)
plot3 <- plot3 + theme_gray()
plot3 <- plot3 + theme(legend.position="none") + labs(x="Year", y=" ")

# Expose ggplot2 Layouts ------------------
plotlayout <- lapply(list(plot1, plot2, plot3), expose_layout, FALSE, FALSE)
grid.arrange(
  grobs = plotlayout,
  widths = c(1),
  layout_matrix = rbind(c(1),
                        c(2),
                        c(3))
)

# Generate Plots --------------------------
mergeplot <- ggarrange(plot1, plot2, plot3)

# Save Output Plots -----------------------
ggsave(mergeplot, file="Linegraph-Areal-Extent-Comparison-Mangroves-MergePlot-White.pdf", width=19.89, height=15, units="cm", dpi=300)
ggsave(mergeplot, file="Linegraph-Areal-Extent-Comparison-Mangroves-MergePlot-Gray.pdf", width=19.89, height=15, units="cm", dpi=300)
