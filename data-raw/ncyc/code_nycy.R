library(tidyverse)
library(readxl)
library(janitor)
library(lubridate)



yrs <- as.character(seq(2013, 2018))
dat <- read_excel("data-raw/ncyc/NCYC_corn-yield-winners-2013-2019.xlsx", sheet = "2019")


for ( i in (1: (length(yrs) - 1)) ) {

  myyr <- yrs[i]
  dat.tmp <- read_excel("data-raw/ncyc/NCYC_corn-yield-winners-2013-2019.xlsx", sheet = myyr)

  bind_rows(dat, dat.tmp)

  i <- i + 1

  }


ncyc_raw <- dat %>%
  clean_names() %>%
  mutate(date_planted = as_date(date_planted),
         date_harvested = as_date(date_harvested))



ncyc_rawsimp <-
  ncyc_raw %>%
  select(national_rank,
         state_rank,
         yield,
         field_state,
         class,
         till_maturity_days,
         date_planted,
         date_harvested,
         planting_rate,
         row_spacing,
         nitrogen,
         phosphorus,
         potash,
         trace_element,
         manure,
         harvester_make,
         total_acres,
         acres_harvested, total_bushels_harvested, bushels_per_acres,
         acres_harvested_recheck, total_bushels_harvested_recheck, bushels_per_acres_recheck)

ncyc_raw %>% write_csv("data-raw/ncyc/nycy_raw.csv")
use_data(ncyc_raw, overwrite = T)

ncyc_simp %>% write_csv("data-raw/ncyc/nycy_simp.csv")
use_data(ncyc_simp, overwrite = T)
