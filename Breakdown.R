library(dplyr)
library(readxl)
library(tidyr)
library(writexl)

ifg_df <- read_excel("variable_all_runs_2023_202312.v.2.xlsx", sheet = "variable_all_runs")

ifrs_group <- data.frame(col1 = unique(ifg_df$ifrs_group_code))

df_separate <- ifrs_group %>%
  separate(col1, into = c(
    "Type",
    "Reserving Class",
    "ST/LT",
    "Cohort Year",
    "Profitability Tag",
    "Currency Code",
    "Major Class Code",
    "Contract Type Code",
    "Profit Center T-Code",
    "Distribution Channel T-Code",
    "Category Code",
    "Partner Name"
  ), sep = "#")

df_separate <- df_separate %>%
  mutate(ifrs_group_code = paste0(Type,"#",`Reserving Class`,"#",`ST/LT`,"#",`Cohort Year`,"#",`Profitability Tag`,"#",`Currency Code`,"#",
                                  `Major Class Code`,"#",`Contract Type Code`,"#",`Profit Center T-Code`,"#",`Distribution Channel T-Code`,"#",
                                  `Category Code`,"#",`Partner Name`))

write_xlsx(df_separate,"Breakdown_ifrs_group_code.xlsx")
