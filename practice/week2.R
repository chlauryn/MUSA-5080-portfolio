library(tidyverse)
library(tidycensus)

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


nj_house <- get_acs(
  geography = "county",
  variables = my_variable,
  state = my_state,
  year = 2023,
  survey = "acs5",
  output = "wide"
)

