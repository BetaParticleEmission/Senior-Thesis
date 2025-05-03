# Senior Thesis: X-Ray Spectroscopy Analysis

**Author:** Isaac Norris  
**Degree:** B.S. Physics, Clemson University  
**Instructor:** Dr. Sosolik
**Date:** May 2024

---

## 📖 Abstract

This senior thesis presents a comprehensive workflow for analyzing X-ray spectroscopy data to detmermine if characteristic x-rays are generated from Ne X collision with Faraday Cup surface. Using a combination of **R** for data visualization and wrangling and **Microsoft Excel** for data collection, the project demonstrates rigorous data cleaning, transformation, visualization, and analysis. The NIST x-ray emission database is used to find if the energies differences between orbitals match that found in the plots. 

---

## 🏷️ Table of Contents

1. [Introduction & Motivation](#introduction--motivation)  
2. [Data & Tools](#data--tools)  
3. [Methodology](#methodology) 
4. [Results & Discussion](#results--discussion)  

---

## 🔎 Introduction & Motivation

X-ray spectroscopy is a cornerstone technique for non-destructive elemental analysis in materials science, geology, and environmental studies. The goal of this thesis is to:

- Develop an understanding of characteristic x-rays from raw spectral readings
- Use peak detection and quantify emission line intensities
- Overylay plots with data collected from NIST databases to identify correlation
- Use equations and external references to jusify the findings

---

## 🛠️ Data & Tools

- **Raw Data:**  
  - `.csv` exports from the spectrometer containing energy (keV) vs. counts.  
- **Primary Tools:**  
  - **R (≥ 4.0.0):**  
    - Data wrangling (`tidyverse`)  
    - Visualization (`ggplot2`)  
  - **Microsoft Excel (≥ 2016):**  
    - Cleaned data review  
    - Export peaks data
    - Collect NIST database data for overlay

---

## ⚙️ Methodology

1. **Data Import & Cleaning**  
   - Load raw `.csv` with R  
   - Truncate the data to only allow a specific x range
   - Isolate the the data points that correlate to the x-ray peaks

2. **Peak Detection**  
   - Use stat_peaks() to identify the peaks with colored dots
   - Tabulate peak locations and heights

3. **Visualization**  
   - Plot spectra with annotated peaks  
   - Overlay the NIST database data with associated peaks to find correlation

4. **Reporting**
   - Correlate findings with known equations
   - Provide references within the industry to support the findings
   - Create clean html file or pdf whichever is desirable 

---

## 💡 Results & Discussion

The results showed prevalence towards neon and nickel transitions. The lines seemed to coincided to coincide with experimental results. The prominent high intensity lines are characteristic of $k_{\alpha}$ for neon. The nickel database lines also seem to overlap with some transitions and could potentially represent the lines for L to M transitions for nickel. The L-edge transitions associated with neon falls lower in energy in the original spectrum. Any experimental errors in the results could be due to the recording of data for the x-rays. For example, there could be x-rays that may not hit the detector that come from the metals in the surface due to the distance and angle. This would be considered a hidden variable in the experiment. To conclude, there is some confidence that the x-rays produced came from neon transitions, and some possibly of nickel x-rays. 

