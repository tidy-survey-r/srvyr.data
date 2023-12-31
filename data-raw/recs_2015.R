## ----setup, include=FALSE--------------------------------------------------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----loadpackages----------------------------------------------------------------------------------------------------------------------------------------------------
library(tidyverse) #data manipulation
library(haven) #data import
library(tidylog) #informative logging messages
library(osfr)


## ----derivedata------------------------------------------------------------------------------------------------------------------------------------------------------
recs_file_osf_det <- osf_retrieve_node("https://osf.io/z5c3m/") %>%
  osf_ls_files(path="RECS_2015", pattern="csv") %>%
  osf_download(conflicts="overwrite", path=here::here("data-raw"))

recs_in <- read_csv(pull(recs_file_osf_det, local_path))

unlink(pull(recs_file_osf_det, local_path))

recs <- recs_in %>%
  select(DOEID, REGIONC, DIVISION, METROMICRO, UATYP10, TYPEHUQ, YEARMADERANGE, HEATHOME, EQUIPMUSE, TEMPHOME, TEMPGONE, TEMPNITE, AIRCOND, USECENAC, TEMPHOMEAC, TEMPGONEAC, TEMPNITEAC, TOTCSQFT, TOTHSQFT, TOTSQFT_EN, TOTUCSQFT, TOTUSQFT, NWEIGHT, starts_with("BRRWT"), CDD30YR, CDD65, CDD80, CLIMATE_REGION_PUB, IECC_CLIMATE_PUB, HDD30YR, HDD65, HDD50, GNDHDD65, BTUEL, DOLLAREL, BTUNG, DOLLARNG, BTULP, DOLLARLP, BTUFO, DOLLARFO, TOTALBTU, TOTALDOL, BTUWOOD=WOODBTU, BTUPELLET=PELLETBTU ) %>%
  mutate(
    Region=parse_factor(
      case_when(
        REGIONC==1~"Northeast",
        REGIONC==2~"Midwest",
        REGIONC==3~"South",
        REGIONC==4~"West",
      ), levels=c("Northeast", "Midwest", "South", "West")),
    Division=parse_factor(
      case_when(
        DIVISION==1~"New England",
        DIVISION==2~"Middle Atlantic",
        DIVISION==3~"East North Central",
        DIVISION==4~"West North Central",
        DIVISION==5~"South Atlantic",
        DIVISION==6~"East South Central",
        DIVISION==7~"West South Central",
        DIVISION==8~"Mountain North",
        DIVISION==9~"Mountain South",
        DIVISION==10~"Pacific",
      ), levels=c("New England", "Middle Atlantic", "East North Central", "West North Central", "South Atlantic", "East South Central", "West South Central", "Mountain North", "Mountain South", "Pacific")),
    MSAStatus=fct_recode(METROMICRO, "Metropolitan Statistical Area"="METRO", "Micropolitan Statistical Area"="MICRO", "None"="NONE"),
    Urbanicity=parse_factor(
      case_when(
        UATYP10=="U"~"Urban Area",
        UATYP10=="C"~"Urban Cluster",
        UATYP10=="R"~"Rural"
      ),
      levels=c("Urban Area", "Urban Cluster", "Rural")
    ),
    HousingUnitType=parse_factor(
      case_when(
        TYPEHUQ==1~"Mobile home",
        TYPEHUQ==2~"Single-family detached",
        TYPEHUQ==3~"Single-family attached",
        TYPEHUQ==4~"Apartment: 2-4 Units",
        TYPEHUQ==5~"Apartment: 5 or more units",
      ), levels=c("Mobile home", "Single-family detached", "Single-family attached", "Apartment: 2-4 Units", "Apartment: 5 or more units")),
    YearMade=parse_factor(
      case_when(
        YEARMADERANGE==1~"Before 1950",
        YEARMADERANGE==2~"1950-1959",
        YEARMADERANGE==3~"1960-1969",
        YEARMADERANGE==4~"1970-1979",
        YEARMADERANGE==5~"1980-1989",
        YEARMADERANGE==6~"1990-1999",
        YEARMADERANGE==7~"2000-2009",
        YEARMADERANGE==8~"2010-2015",
      ),
      levels=c("Before 1950", "1950-1959", "1960-1969", "1970-1979", "1980-1989", "1990-1999", "2000-2009", "2010-2015"),
      ordered = TRUE
    ),
    SpaceHeatingUsed=as.logical(HEATHOME),
    HeatingBehavior=parse_factor(
      case_when(
        EQUIPMUSE==1~"Set one temp and leave it",
        EQUIPMUSE==2~"Manually adjust at night/no one home",
        EQUIPMUSE==3~"Program thermostat to change at certain times",
        EQUIPMUSE==4~"Turn on or off as needed",
        EQUIPMUSE==5~"No control",
        EQUIPMUSE==9~"Other",
        EQUIPMUSE==-9~NA_character_),
      levels=c("Set one temp and leave it", "Manually adjust at night/no one home", "Program thermostat to change at certain times", "Turn on or off as needed", "No control", "Other")
    ),
    WinterTempDay=if_else(TEMPHOME>0, TEMPHOME, NA_real_),
    WinterTempAway=if_else(TEMPGONE>0, TEMPGONE, NA_real_),
    WinterTempNight=if_else(TEMPNITE>0, TEMPNITE, NA_real_),
    ACUsed=as.logical(AIRCOND),
    ACBehavior=parse_factor(
      case_when(
        USECENAC==1~"Set one temp and leave it",
        USECENAC==2~"Manually adjust at night/no one home",
        USECENAC==3~"Program thermostat to change at certain times",
        USECENAC==4~"Turn on or off as needed",
        USECENAC==5~"No control",
        USECENAC==-9~NA_character_),
      levels=c("Set one temp and leave it", "Manually adjust at night/no one home", "Program thermostat to change at certain times", "Turn on or off as needed", "No control")
    ),
    SummerTempDay=if_else(TEMPHOMEAC>0, TEMPHOMEAC, NA_real_),
    SummerTempAway=if_else(TEMPGONEAC>0, TEMPGONEAC, NA_real_),
    SummerTempNight=if_else(TEMPNITEAC>0, TEMPNITEAC, NA_real_),
    ClimateRegion_BA=parse_factor(CLIMATE_REGION_PUB),
    ClimateRegion_IECC=factor(IECC_CLIMATE_PUB)

  )



## ----checkvars-------------------------------------------------------------------------------------------------------------------------------------------------------
recs %>% count(Region, REGIONC)
recs %>% count(Division, DIVISION)
recs %>% count(MSAStatus, METROMICRO)
recs %>% count(Urbanicity, UATYP10)
recs %>% count(HousingUnitType, TYPEHUQ)
recs %>% count(YearMade, YEARMADERANGE)
recs %>% count(SpaceHeatingUsed, HEATHOME)
recs %>% count(HeatingBehavior, EQUIPMUSE)
recs %>% count(ACUsed, AIRCOND)
recs %>% count(ACBehavior, USECENAC)
recs %>% count(ClimateRegion_BA, CLIMATE_REGION_PUB)
recs %>% count(ClimateRegion_IECC, IECC_CLIMATE_PUB)



## ----savedat---------------------------------------------------------------------------------------------------------------------------------------------------------
recs_2015 <- recs %>%
  select(DOEID, REGIONC, Region, Division, MSAStatus, Urbanicity, HousingUnitType, YearMade, SpaceHeatingUsed, HeatingBehavior, WinterTempDay, WinterTempAway, WinterTempNight, ACUsed, ACBehavior, SummerTempDay, SummerTempAway, SummerTempNight, TOTCSQFT, TOTHSQFT, TOTSQFT_EN, TOTUCSQFT, TOTUSQFT, NWEIGHT, starts_with("BRRWT"), CDD30YR, CDD65, CDD80, ClimateRegion_BA, ClimateRegion_IECC, HDD30YR, HDD65, HDD50, GNDHDD65, BTUEL, DOLLAREL, BTUNG, DOLLARNG, BTULP, DOLLARLP, BTUFO, DOLLARFO, TOTALBTU, TOTALDOL, BTUWOOD, BTUPELLET)

summary(recs_2015)

usethis::use_data(recs_2015)
