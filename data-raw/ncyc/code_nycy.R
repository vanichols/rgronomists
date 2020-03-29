library(tidyverse)
library(readxl)
library(janitor)
library(lubridate)


# notes:
# 2013-2015 they had T/F for recheck column, in 2016 they switched, I assumed 'First Check' was equiv to F


# 2013 --------------------------------------------------------------------

dat13 <- read_excel("data-raw/ncyc/NCYC_corn-yield-winners-2013-2019.xlsx", sheet = "2013") %>%
  clean_names() %>%
  mutate(recheck = ifelse(recheck == T, "First Check", "Recheck")) %>%
  rename(yield = final_yield)

#--michigan has an untrue value in date_planted, others in date_harvested, fix at end
dat13 %>%
  clean_names() %>%
  select(contains("date")) %>%
  rowid_to_column() %>%
  filter(is.na(date_harvested))



# 2014 --------------------------------------------------------------------

dat14 <- read_excel("data-raw/ncyc/NCYC_corn-yield-winners-2013-2019.xlsx", sheet = "2014") %>%
  clean_names() %>%
  mutate(recheck = ifelse(recheck == T, "First Check", "Recheck")) %>%
  rename(yield = final_yield)



# 2015 --------------------------------------------------------------------


dat15 <- read_excel("data-raw/ncyc/NCYC_corn-yield-winners-2013-2019.xlsx", sheet = "2015") %>%
  clean_names() %>%
  mutate(recheck = ifelse(recheck == T, "First Check", "Recheck")) %>%
  rename(yield = final_yield)


dat15 %>%
  select(recheck)


# 2016 --------------------------------------------------------------------

# don't worry about warnings
dat16 <- read_excel("data-raw/ncyc/NCYC_corn-yield-winners-2013-2019.xlsx", sheet = "2016") %>%
  clean_names() %>%
  rename(yield = final_yield)



# 2017 --------------------------------------------------------------------


dat17 <- read_excel("data-raw/ncyc/NCYC_corn-yield-winners-2013-2019.xlsx", sheet = "2017") %>%
  clean_names()


# 2018 --------------------------------------------------------------------


dat18 <- read_excel("data-raw/ncyc/NCYC_corn-yield-winners-2013-2019.xlsx", sheet = "2018") %>%
  clean_names()


# 2019 --------------------------------------------------------------------


dat19 <- read_excel("data-raw/ncyc/NCYC_corn-yield-winners-2013-2019.xlsx", sheet = "2019") %>%
  clean_names()


# bind em -----------------------------------------------------------------


ncyc_raw <-
  bind_rows(dat13, dat14, dat15, dat16, dat17, dat18, dat19) %>%
  mutate(year = year(date_planted)) %>%
  #--just fill value from the same state
  group_by(year, field_state) %>%
  fill(date_planted, date_harvested) %>%
  arrange(year, field_state, state_rank) %>%
  mutate(date_planted = as_date(date_planted),
         date_harvested = as_date(date_harvested)) %>%
  select(year, everything())

ncyc_simp <-
  ncyc_raw %>%
  # why is there a 2012 SC?
  filter(year > 2012) %>%
  select(year,
         national_rank,
         state_rank,
         yield,
         field_state,
         class,
         till_maturity_days,
         date_planted,
         date_harvested,
         planting_rate,
         row_spacing,
         irrigated,
         nitrogen,
         phosphorus,
         potash,
         trace_element,
         manure,
         harvester_make,
         total_acres,
         acres_harvested, total_bushels_harvested, bushels_per_acres,
         acres_harvested_recheck, total_bushels_harvested_recheck, bushels_per_acres_recheck)

library(ggforce)
ncyc_simp %>%
  ggplot(aes(as.factor(year), yield)) +
  geom_sina(aes(color = irrigated))

ncyc_simp %>%
  filter(state_rank == "1") %>%
  ggplot(aes(reorder(field_state, yield, median), yield)) +
  geom_sina(aes(color = irrigated))

ncyc_simp %>%
  filter(state_rank == "1") %>%
  ggplot(aes(reorder(field_state, yield, median), yield)) +
  geom_jitter(aes(color = irrigated))


ncyc_simp %>% write_csv("data-raw/ncyc/ncyc_simp.csv")
use_data(ncyc_simp, overwrite = T)

ncyc_raw %>% write_csv("data-raw/ncyc/ncyc_raw.csv")
use_data(ncyc_raw, overwrite = T)
