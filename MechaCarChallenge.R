### Deliverable 1 ###

# 1. Load dplyr package
library("dplyr")

# 2. Import and read MechaCar_mpg.csv file a dataframe 
mechaCar <- read.csv(file = 'MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

# 3. Perform linear regression using the lm() function
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar)

# 4. Use the summary() fucntion to determine p-value and r-squared value
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar))

### Deliverable 2 ###

# 1. Load Suspension_Coil.csv
mechaSuspension <- read.csv(file ='Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

# 2. Create total_summary dataframe using the summarize() function to get mean, median, variance, and standard deviation of the PSI column
total_summary <- mechaSuspension %>% summarize(mean_psi = mean(PSI),
                                               median_psi = median(PSI),
                                               variance_psi = var(PSI),
                                               sd_psi = sd(PSI), .groups = "keep")

# 3. Create lot_summary: mean, median, variance, and standard deviation
lot_summary <- mechaSuspension %>% group_by(Manufacturing_Lot)%>% summarize(mean_psi = mean(PSI),
                                                                            median_psi = median(PSI),
                                                                            variance_psi = var(PSI),
                                                                            sd_psi = sd(PSI), .groups = "keep")

### Deliverable 3 ###

# 1. Use the t.test() fuction to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.
t.test(mechaSuspension$PSI, mu = 1500)

# 2. Use the t.test() 3 more times for each manufacturing lot
mLot1 <- subset(mechaSuspension, Manufacturing_Lot == "Lot1")
mLot2 <- subset(mechaSuspension, Manufacturing_Lot == "Lot2")
mLot3 <- subset(mechaSuspension, Manufacturing_Lot == "Lot3")

t.test(mLot1$PSI, mu = 1500)
t.test(mLot2$PSI, mu = 1500)
t.test(mLot3$PSI, mu = 1500)


