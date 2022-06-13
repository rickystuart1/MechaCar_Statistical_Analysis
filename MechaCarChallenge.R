# Mecha Car Challenge
# Load packages
library(dplyr)
library(tidyverse)

# Deliverable 1: Linear Regression to Predict MPG
# Import and read MechaCar_mpg data
mechaCarData <- read.csv('Resources/MechaCar_mpg.csv')
head(mechaCarData)

# Linear Regression Model
lr_model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCarData)

# Generate Summary Statistics
summary(lr_model)

# Deliverable 2: Create Visualization for the Trip analysis
# Import and read Suspension_coil data
suspensionCoilData <- read.csv('Resources/Suspension_Coil.csv')
head(suspensionCoilData)

# Create dataframe for PSI Summary Statistics
total_summary <- suspensionCoilData %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = "keep")

# Crate dataframe for PSI grouped by Manufacturing lot
lot_summary <- suspensionCoilData %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = "keep")

# Deliverable 3: T-Tests on Suspension Coils
# Create t-test for all lots 
t.test(suspensionCoilData$PSI, mu = 1500) 

# Create t-test for each lot
# Lot 1
t.test(subset(suspensionCoilData, Manufacturing_Lot == 'Lot1')$PSI, mu = 1500) 

# Lot 2
t.test(subset(suspensionCoilData, Manufacturing_Lot == 'Lot2')$PSI, mu = 1500) 

# Lot 3
t.test(subset(suspensionCoilData, Manufacturing_Lot == 'Lot3')$PSI, mu = 1500)
