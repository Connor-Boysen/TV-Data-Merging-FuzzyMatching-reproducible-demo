# TV Program Matching Demo Using Simulated Data
# Author: Connor Boysen
# Purpose: Reproducible example of fuzzy matching TV program titles
# Created for GitHub portfolio

# Load required libraries
library(dplyr)
library(stringdist)
library(fuzzyjoin)
library(readr)

# ---------------------------------------------
# 1. Simulate sample TV Program reference data
# ---------------------------------------------
tv_program <- tibble(
  NielsenProgramCode = 1:5,
  MonitorPlusProgramCode = paste0("MP", 1:5),
  TVProgTitle = c("SUNDAY NIGHT FOOTBALL", "NBA BASKETBALL", "60 MINUTES", "THE BACHELOR", "THE VOICE"),
  TVProgTypeCode = c("SP", "SP", "NW", "EN", "EN")
)

# Simulate program type code reference
tv_program_type <- tibble(
  TVProgTypeCode = c("SP", "NW", "EN"),
  TVProgTypeDesc = c("SPORTS", "NEWS", "ENTERTAINMENT")
)

# ---------------------------------------------
# 2. Simulate viewership data to be enriched
# ---------------------------------------------
tvimp_data <- tibble(
  program_airing_id = 101:110,
  program = c("Sunday Nite Football", "NBA Game", "60 Minutes", "The Bachelor US", 
              "The Voice USA", "NFL Primetime", "Bachlor", "Snday Night Fotball", 
              "NBA Basketball", "The Voce")
)

# ---------------------------------------------
# 3. Prepare program titles for fuzzy matching
# ---------------------------------------------
tv_program <- tv_program %>%
  mutate(title_clean = tolower(trimws(TVProgTitle)))

tvimp_data <- tvimp_data %>%
  mutate(program_clean = tolower(trimws(program)))

# ---------------------------------------------
# 4. Perform fuzzy matching using stringdist
# ---------------------------------------------
title_matches <- stringdist_left_join(
  tvimp_data,
  tv_program,
  by = c("program_clean" = "title_clean"),
  method = "osa",
  max_dist = 3,
  distance_col = "dist"
)

# Choose best match (lowest distance)
title_matches_best <- title_matches %>%
  group_by(program_airing_id) %>%
  slice_min(order_by = dist, n = 1, with_ties = FALSE) %>%
  ungroup()

# ---------------------------------------------
# 5. Enrich matched data with program type info
# ---------------------------------------------
tvimp_enriched <- title_matches_best %>%
  left_join(tv_program_type, by = "TVProgTypeCode")

# ---------------------------------------------
# 6. Output enriched dataset
# ---------------------------------------------
print(tvimp_enriched)

# Optional: Save to CSV
# write_csv(tvimp_enriched, "tvimp_enriched_demo.csv")
