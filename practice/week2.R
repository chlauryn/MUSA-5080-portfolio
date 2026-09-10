library(tidyverse)
library(tidycensus)
library(dplyr)

data <- get_acs(geography = "county",
                variables = c("B19013_001","B01003_001"),
                state = "PA",
                year = 2023,
                survey = "acs5",
                output = "wide"
)

head(data)





pa_income <- get_acs(geography = "county",
                     variables = "B19013_001",
                     state = "PA",
                     year = 2023,
                     survey = "acs5",
                     output = "wide")





## Setup

library(tidyverse)
library(tidycensus)



  ## Choosing what to measure

my_state <- "NJ"        # two-letter abbreviation, in quotes
my_variable <- "B25077_001"     # the variable code, in quotes


## Pulling the data


county_data <- get_acs(
  geography = "county",
  variables = "B25077_001",
  state = "NJ",
  year = 2023,
  survey = "acs5",
  output = "wide"
)

county_data <- county_data |>
  mutate(moe_pct = B25077_001M / B25077_001E * 100)

county_data |>
  arrange(desc(moe_pct)) |> `
  head(10)

library(ggplot2)

ggplot(county_data, aes(x = moe_pct)) +
  geom_histogram()


install.packages("classInt")  # only need to do this once
library(classInt)
jenks <- classInt::classIntervals(
  county_data$moe_pct,
  n = 2,
  style = "jenks"
)

jenks$brks
