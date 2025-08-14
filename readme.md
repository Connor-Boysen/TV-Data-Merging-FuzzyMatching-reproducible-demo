# TV Program Matching Demo

## Author
Connor Boysen

## Overview
This repository contains a reproducible demo of fuzzy string matching between two datasets using R. It simulates a real-world data cleaning task: matching inconsistent program names across different TV data sources and enriching the viewership dataset with program metadata.

## Goals
- Demonstrate fuzzy matching techniques using `stringdist` and `fuzzyjoin`.
- Show how to clean and prepare messy real-world data.
- Enrich a target dataset with metadata (e.g., program type).
- Highlight efficient, scalable workflows for data reconciliation.

## Features
- Simulates sample TV program reference and viewership data.
- Cleans and standardizes string inputs.
- Uses optimal string alignment (OSA) method for matching.
- Selects best matches by minimum string distance.
- Joins matched records with genre classifications.

## Technologies Used
- **R** (dplyr, stringdist, fuzzyjoin, readr)
- Simulated tabular data

## Instructions
1. Clone or download the repo.
2. Open `tv_matching_demo.R` in RStudio.
3. Run the script step-by-step to:
   - Simulate sample datasets
   - Fuzzy match program names
   - Join metadata to matched programs
4. Optionally export the final enriched dataset as CSV.

## Applications
This project demonstrates techniques useful for:
- Data reconciliation between mismatched systems
- ETL pipelines for media and marketing data
- Fuzzy matching for analytics projects

## Output Example
The final enriched dataset includes:
- Original airing data
- Best-matched program title
- Program type code and description

## Contact
If you have questions about this project or would like to collaborate, feel free to reach out!

---
> This project is part of a professional data science portfolio for Connor Boysen.

