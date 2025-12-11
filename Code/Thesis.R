library(tidyverse)
library(readr)
library(ggpmisc)
library(psych)
library(readxl)
library(patchwork)
SeniorThesis <- read_csv("plot.csv")
View(SeniorThesis)


plot <- ggplot(SeniorThesis, aes(x = x0000, y = y0000)) + geom_line() + xlab("Energy (eV)") + ylab("Intensity (Arb)")
plot

plot_curve <- SeniorThesis %>% filter(x0000 > 800) %>% select(x0000, y0000) %>% 
ggplot(SeniorThesis, mapping = aes(x = x0000, y = y0000)) + geom_line() + xlab("Energy (eV)") + ylab("Intensity (Arb)")
plot_curve


# Plot for the surface portion of the experiment 
plot_surface <- SeniorThesis %>% filter(x0000 > 800) %>% filter(x0000 < 900) %>% select(x0000, y0000) %>% 
  ggplot(SeniorThesis, mapping = aes(x = x0000, y = y0000)) + geom_line() + xlab("Energy (eV)") + ylab("Intensity (Arb)")
plot_surface

# From the curve, we see that the maximum intensity value lies in the range of 850 to 875 electron-volts  


# Question 1: Can the peaks from the spectrum be interpreted as x-rays generated from the different metals?

#Answer: Yes. Find the energies associated with each peak and correlate this to a x-ray database. 

plot_peaks <- SeniorThesis %>% filter(x0000 > 800) %>% filter(x0000 < 900) %>% select(x0000, y0000) %>% 
ggplot(SeniorThesis, mapping = aes(x = x0000, y = y0000)) + geom_line() + xlab("Energy (eV)") + ylab("Intensity (Arb)") + stat_peaks(aes(x=x0000), colour = "red") + stat_peaks(geom = "text", colour = "red", hjust = 0, vjust = -1) + ylim(0, max(SeniorThesis$y0000)) 
plot_peaks # Labels each peak with red dots with energy values 


# Question 2: What energy contains the peak intensity? - 861.6 electron-volts. 


# Next, lets use the original data set, to summarize the data. 

SeniorThesis_manipulated <- SeniorThesis %>% select(x0000, y0000) %>% 
pivot_longer(col = x0000, names_to = "x", values_to = "Energy") %>% 
pivot_longer(col = y0000, names_to = "y", values_to = "Intensity") %>% filter(Energy > 800) %>% filter(Energy < 900) %>% select(Energy, Intensity)

# Summary table 
describe(SeniorThesis_manipulated)

# NIST Database Comparison. Used to find what is metal verses the transition energy. 

NIST_Database <- read_excel('NIST.xlsx')

# Overlay the Neon NIST data on the plot_peaks plot 
NIST_OVERLAY <- plot_peaks + geom_vline(data=NIST_Database, aes(x = NIST_Database$Theoretical, y = NIST_Database$Experimental), xintercept = NIST_Database$Theoretical - 1.9)
NIST_OVERLAY

# Use the NIST Database for Nickel
NIST_NICKEL <- read_excel('NICKEL.xlsx')

# Overlay the Nickel NIST data on the plot_peaks plot

NIST_OVERLAY_NICKEL <- plot_peaks + geom_vline(data=NIST_NICKEL, aes(x = NIST_NICKEL$Theoretical), xintercept = NIST_NICKEL$Theoretical - 2.4)
NIST_OVERLAY_NICKEL


# Use the NIST Database for Iron and Overlay the Iron NIST data on the plot_peaks plot 

NIST_IRON <- read_excel('NIST_IRON.xlsx')

NIST_OVERLAY_IRON <- plot_peaks + geom_vline(data=NIST_IRON, aes(x = NIST_IRON$Theoretical), xintercept = NIST_IRON$Theoretical + 1.8)
NIST_OVERLAY_IRON



# Truncate data for range 900 to 930

plot_900 <- SeniorThesis %>% filter(x0000 > 900) %>% filter(x0000 < 930) %>% select(x0000, y0000) %>% 
ggplot(SeniorThesis, mapping = aes(x = x0000, y = y0000)) + geom_line() + xlab("Energy (eV)") + ylab("Intensity (Arb)") + stat_peaks(aes(x=x0000), colour = "red") + stat_peaks(geom = "text", colour = "red", hjust = 0, vjust = -1) + ylim(0, max(SeniorThesis$y0000))
plot_900
Curve_2 <- SeniorThesis %>% select(x0000, y0000) %>% 
pivot_longer(col = x0000, names_to = "x", values_to = "Energy") %>% 
pivot_longer(col = y0000, names_to = "y", values_to = "Intensity") %>% filter(Energy > 900) %>% filter(Energy < 930) %>% select(Energy, Intensity)
describe(Curve_2)

# Truncate data for range 800 to 930 

plot_800 <- SeniorThesis %>% filter(x0000 > 800) %>% filter(x0000 < 930) %>% select(x0000, y0000) %>% 
  ggplot(SeniorThesis, mapping = aes(x = x0000, y = y0000)) + geom_line() + xlab("Energy (eV)") + ylab("Intensity (Arb)") + stat_peaks(aes(x=x0000), colour = "red") + stat_peaks(geom = "text", colour = "red", hjust = 0, vjust = -1) + ylim(0, max(SeniorThesis$y0000))
plot_800







# Find the average for the NIST nickel database 

describe(NIST_NICKEL$Theoretical)

# Find the average for the NIST iron database 

describe(NIST_IRON$Theoretical)



