#' @title Residential Energy Consumption Survey (RECS) (2015) data
#' @description Based on the 2015 RECS microdata with derived variables
#' @format A data frame with 5686 rows and 141 variables:
#' \describe{
#'   \item{\code{DOEID}}{double Unique identifier for each respondent}
#'   \item{\code{REGIONC}}{double Census Region (numeric)}
#'   \item{\code{Region}}{factor Census Region (factor)}
#'   \item{\code{Division}}{factor Census Division}
#'   \item{\code{MSAStatus}}{factor Housing unit in Census Metropolitan Statistical Area or Micropolitan Statistical Area}
#'   \item{\code{Urbanicity}}{factor Census 2010 Urban Type}
#'   \item{\code{HousingUnitType}}{factor Type of housing unit}
#'   \item{\code{YearMade}}{factor Year range when housing unit was built}
#'   \item{\code{SpaceHeatingUsed}}{logical Space heating used}
#'   \item{\code{HeatingBehavior}}{factor Main heating equipment household behavior}
#'   \item{\code{WinterTempDay}}{double Winter temperature when someone is home during the day}
#'   \item{\code{WinterTempAway}}{double Winter temperature when no one is home during the day}
#'   \item{\code{WinterTempNight}}{double Winter temperature at night}
#'   \item{\code{ACUsed}}{logical Air conditioning equipment used}
#'   \item{\code{ACBehavior}}{factor Central air conditioner household behavior}
#'   \item{\code{SummerTempDay}}{double Summer temperature when someone is home during the day}
#'   \item{\code{SummerTempAway}}{double Summer temperature when no one is home during the day}
#'   \item{\code{SummerTempNight}}{double Summer temperature at night}
#'   \item{\code{TOTCSQFT}}{double Total cooled square footage}
#'   \item{\code{TOTHSQFT}}{double Total heated square footage}
#'   \item{\code{TOTSQFT_EN}}{double Total square footage (used for publication)}
#'   \item{\code{TOTUCSQFT}}{double Total uncooled square footage}
#'   \item{\code{TOTUSQFT}}{double Total unheated square footage}
#'   \item{\code{NWEIGHT}}{double Final sample weight}
#'   \item{\code{BRRWT1-BRRWT96}}{double Replicate weight 1 through 96}
#'   \item{\code{CDD30YR}}{double Cooling degree days, 30-year average 1981-2010, base temperature 65F}
#'   \item{\code{CDD65}}{double Cooling degree days in 2015, base temperature 65F}
#'   \item{\code{CDD80}}{double Cooling degree days in 2015, base temperature 80F (used for garage cooling load estimation only)}
#'   \item{\code{ClimateRegion_BA}}{factor Building America Climate Zone}
#'   \item{\code{ClimateRegion_IECC}}{factor IECC Climate Code}
#'   \item{\code{HDD30YR}}{double Heating degree days, 30-year average 1981-2010, base temperature 65F}
#'   \item{\code{HDD65}}{double Heating degree days in 2015, base temperature 65F}
#'   \item{\code{HDD50}}{double Heating degree days in 2015, base temperature 50F (used for garage heating load estimation only)}
#'   \item{\code{GNDHDD65}}{double Heating degree days of ground temperature in 2015, base temperature 65F}
#'   \item{\code{BTUEL}}{double Total site electricity usage, in thousand Btu, 2015}
#'   \item{\code{DOLLAREL}}{double Total electricity cost, in dollars, 2015}
#'   \item{\code{BTUNG}}{double Total natural gas usage, in thousand Btu, 2015}
#'   \item{\code{DOLLARNG}}{double Total natural gas cost, in dollars, 2015}
#'   \item{\code{BTULP}}{double Total propane usage, in thousand Btu, 2015}
#'   \item{\code{DOLLARLP}}{double Total cost of propane, in dollars, 2015}
#'   \item{\code{BTUFO}}{double Total fuel oil/kerosene usage, in thousand Btu, 2015}
#'   \item{\code{DOLLARFO}}{double Total cost of fuel oil/kerosene, in dollars, 2015}
#'   \item{\code{TOTALBTU}}{double Total usage, in thousand Btu, 2015}
#'   \item{\code{TOTALDOL}}{double Total cost, in dollars, 2015 }
#'   \item{\code{BTUWOOD}}{double Total cordwood usage, in thousand Btu, 2015 (Wood consumption is not included in TOTALBTU or TOTALDOL)}
#'   \item{\code{BTUPELLET}}{double Total wood pellet usage, in thousand Btu, 2015 (Wood consumption is not included in TOTALBTU or TOTALDOL)}
#'}
#' @source \url{https://www.eia.gov/consumption/residential/data/2015/index.php?view=microdata}
"recs_2015"

#' @title Residential Energy Consumption Survey (RECS) (2020) data
#' @description Based on the 2020 RECS microdata with derived variables
#' @format A data frame with 18496 rows and 100 variables:
#' \describe{
#'   \item{\code{DOEID}}{double Unique identifier for each respondent}
#'   \item{\code{ClimateRegion_BA}}{factor Building America Climate Zone}
#'   \item{\code{Urbanicity}}{factor 2010 Census Urban Type Code}
#'   \item{\code{Region}}{factor Census Region (factor)}
#'   \item{\code{REGIONC}}{character Census Region (character)}
#'   \item{\code{Division}}{factor Census Division, Mountain Division is divided into North and South for RECS purposes}
#'   \item{\code{STATE_FIPS}}{character State Federal Information Processing System Code}
#'   \item{\code{state_postal}}{factor State Postal Code}
#'   \item{\code{state_name}}{factor State Name}
#'   \item{\code{HDD65}}{double Heating degree days in 2020, base temperature 65F; Derived from the weighted temperatures of nearby weather stations}
#'   \item{\code{CDD65}}{double Cooling degree days in 2020, base temperature 65F; Derived from the weighted temperatures of nearby weather stations}
#'   \item{\code{HDD30YR}}{double Heating degree days, 30-year average 1981-2010, base temperature 65F; Taken from nearest weather station, inoculated with random errors}
#'   \item{\code{CDD30YR}}{double Cooling degree days, 30-year average 1981-2010, base temperature 65F; Taken from nearest weather station, inoculated with random errors}
#'   \item{\code{HousingUnitType}}{factor Type of housing unit}
#'   \item{\code{YearMade}}{factor Range when housing unit was built}
#'   \item{\code{TOTSQFT_EN}}{double Total energy-consuming area (square footage) of the housing unit. Includes all main living areas; all basements; heated, cooled, or finished attics; and heating or cooled garages. For single-family housing units this is derived using the respondent-reported square footage (SQFTEST) and adjusted using the "include" variables (e.g., SQFTINCB), where applicable. For apartments and mobile homes this is the respondent-reported square footage. A derived variable rounded to the nearest 10}
#'   \item{\code{TOTHSQFT}}{double Square footage of the housing unit that is heated by space heating equipment. A derived variable rounded to the nearest 10}
#'   \item{\code{TOTCSQFT}}{double Square footage of the housing unit that is cooled by air-conditioning equipment or evaporative cooler, a derived variable rounded to the nearest 10}
#'   \item{\code{SpaceHeatingUsed}}{logical Space heating equipment used}
#'   \item{\code{ACUsed}}{logical Air conditioning equipment used}
#'   \item{\code{HeatingBehavior}}{factor Winter temperature control method}
#'   \item{\code{WinterTempDay}}{double Winter thermostat setting or temperature in home when someone is home during the day}
#'   \item{\code{WinterTempAway}}{double Winter thermostat setting or temperature in home when no one is home during the day}
#'   \item{\code{WinterTempNight}}{double Winter thermostat setting or temperature in home at night}
#'   \item{\code{ACBehavior}}{factor Summer temperature control method}
#'   \item{\code{SummerTempDay}}{double Summer thermostat setting or temperature in home when someone is home during the day}
#'   \item{\code{SummerTempAway}}{double Summer thermostat setting or temperature in home when no one is home during the day}
#'   \item{\code{SummerTempNight}}{double Summer thermostat setting or temperature in home at night}
#'   \item{\code{NWEIGHT}}{double Final Analysis Weight}
#'   \item{\code{NWEIGHT1-NWEIGHT60}}{double Final Analysis Weight for replicate 1-60}
#'   \item{\code{BTUEL}}{double Total electricity use, in thousand Btu, 2020, including self-generation of solar power}
#'   \item{\code{DOLLAREL}}{double Total electricity cost, in dollars, 2020}
#'   \item{\code{BTUNG}}{double Total natural gas use, in thousand Btu, 2020}
#'   \item{\code{DOLLARNG}}{double Total natural gas cost, in dollars, 2020}
#'   \item{\code{BTULP}}{double Total propane use, in thousand Btu, 2020}
#'   \item{\code{DOLLARLP}}{double Total propane cost, in dollars, 2020}
#'   \item{\code{BTUFO}}{double Total fuel oil/kerosene use, in thousand Btu, 2020}
#'   \item{\code{DOLLARFO}}{double Total fuel oil/kerosene cost, in dollars, 2020}
#'   \item{\code{BTUWOOD}}{double Total wood use, in thousand Btu, 2020}
#'   \item{\code{TOTALBTU}}{double Total usage including electricity, natural gas, propane, and fuel oil, in thousand Btu, 2020}
#'   \item{\code{TOTALDOL}}{double Total cost including electricity, natural gas, propane, and fuel oil, in dollars, 2020}
#'}
#' @source \url{https://www.eia.gov/consumption/residential/data/2020/index.php?view=microdata}
"recs_2020"

#' @title American National Election Studies (ANES) (2020) data
#' @description Based on the 2020 ANES data with derived variables and subset to people who completed both pre and post-election interviews
#' @format A data frame with 7453 rows and 63 variables:
#' \describe{
#'   \item{\code{V200001}}{double 2020 Case ID}
#'   \item{\code{CaseID}}{double 2020 Case ID}
#'   \item{\code{V200002}}{double Mode of interview: pre-election interview}
#'   \item{\code{InterviewMode}}{factor Mode of interview: pre-election interview}
#'   \item{\code{V200010b}}{double Full sample post-election weight}
#'   \item{\code{Weight}}{double Full sample post-election weight}
#'   \item{\code{V200010c}}{double Full sample variance unit}
#'   \item{\code{VarUnit}}{factor Full sample variance unit}
#'   \item{\code{V200010d}}{double Full sample variance stratum}
#'   \item{\code{Stratum}}{factor Full sample variance stratum}
#'   \item{\code{V201006}}{double PRE: How interested in following campaigns}
#'   \item{\code{CampaignInterest}}{factor PRE: How interested in following campaigns}
#'   \item{\code{V201024}}{double PRE: In what manner did R vote}
#'   \item{\code{V201025x}}{double PRE: SUMMARY: Registration and early vote status}
#'   \item{\code{V201029}}{double PRE: For whom did R vote for President}
#'   \item{\code{V201101}}{double PRE: Did R vote for President in 2016 [revised]}
#'   \item{\code{V201102}}{double PRE: Did R vote for President in 2016}
#'   \item{\code{VotedPres2016}}{factor PRE: Did R vote for President in 2016}
#'   \item{\code{V201103}}{double PRE: Recall of last (2016) Presidential vote choice}
#'   \item{\code{VotedPres2016_selection}}{factor PRE: Recall of last (2016) Presidential vote choice}
#'   \item{\code{V201228}}{double PRE: Party ID: Does R think of self as Democrat, Republican, or Independent}
#'   \item{\code{V201229}}{double PRE: Party Identification strong - Democrat Republican}
#'   \item{\code{V201230}}{double PRE: No Party Identification - closer to Democratic Party or Republican Party}
#'   \item{\code{V201231x}}{double PRE: SUMMARY: Party ID}
#'   \item{\code{PartyID}}{factor PRE: SUMMARY: Party ID}
#'   \item{\code{V201233}}{double PRE: How often trust government in Washington to do what is right [revised]}
#'   \item{\code{TrustGovernment}}{factor PRE: How often trust government in Washington to do what is right [revised]}
#'   \item{\code{V201237}}{double PRE: How often can people be trusted}
#'   \item{\code{TrustPeople}}{factor PRE: How often can people be trusted}
#'   \item{\code{V201507x}}{double PRE: SUMMARY: Respondent age}
#'   \item{\code{Age}}{double PRE: SUMMARY: Respondent age}
#'   \item{\code{AgeGroup}}{factor PRE: SUMMARY: Respondent age (categorized)}
#'   \item{\code{V201510}}{double PRE: Highest level of Education}
#'   \item{\code{Education}}{factor PRE: Highest level of Education}
#'   \item{\code{V201546}}{double PRE: R: Are you Spanish, Hispanic, or Latino}
#'   \item{\code{V201547a}}{double RESTRICTED: PRE: Race of R: White [mention]}
#'   \item{\code{V201547b}}{double RESTRICTED: PRE: Race of R: Black or African-American [mention]}
#'   \item{\code{V201547c}}{double RESTRICTED: PRE: Race of R: Asian [mention]}
#'   \item{\code{V201547d}}{double RESTRICTED: PRE: Race of R: Native Hawaiian or Pacific Islander [mention]}
#'   \item{\code{V201547e}}{double RESTRICTED: PRE: Race of R: Native American or Alaska Native [mention]}
#'   \item{\code{V201547z}}{double RESTRICTED: PRE: Race of R: other specify}
#'   \item{\code{V201549x}}{double PRE: SUMMARY: R self-identified race/ethnicity}
#'   \item{\code{RaceEth}}{factor PRE: SUMMARY: R self-identified race/ethnicity}
#'   \item{\code{V201600}}{double PRE: What is your (R) sex? [revised]}
#'   \item{\code{Gender}}{factor PRE: What is your (R) sex? [revised]}
#'   \item{\code{V201607}}{double RESTRICTED: PRE: Total income amount - revised}
#'   \item{\code{V201610}}{double RESTRICTED: PRE: Income amt missing - categories lt 20K}
#'   \item{\code{V201611}}{double RESTRICTED: PRE: Income amt missing - categories 20-40K}
#'   \item{\code{V201613}}{double RESTRICTED: PRE: Income amt missing - categories 40-70K}
#'   \item{\code{V201615}}{double RESTRICTED: PRE: Income amt missing - categories 70-100K}
#'   \item{\code{V201616}}{double RESTRICTED: PRE: Income amt missing - categories 100+K}
#'   \item{\code{V201617x}}{double PRE: SUMMARY: Total (family) income}
#'   \item{\code{Income}}{factor PRE: SUMMARY: Total (family) income (21 categories)}
#'   \item{\code{Income7}}{factor PRE: SUMMARY: Total (family) income (7 categories)}
#'   \item{\code{V202051}}{double POST: R registered to vote (post-election)}
#'   \item{\code{V202066}}{double POST: Did R vote in November 2020 election}
#'   \item{\code{V202072}}{double POST: Did R vote for President}
#'   \item{\code{VotedPres2020}}{factor POST: Did R vote for President}
#'   \item{\code{V202073}}{double POST: For whom did R vote for President}
#'   \item{\code{V202109x}}{double PRE-POST: SUMMARY: Voter turnout in 2020}
#'   \item{\code{V202110x}}{double PRE-POST: SUMMARY: 2020 Presidential vote}
#'   \item{\code{VotedPres2020_selection}}{factor PRE-POST: SUMMARY: 2020 Presidential vote}
#'   \item{\code{EarlyVote2020}}{factor Indicator of early voting in 2020}
#'}
#' @source \url{https://electionstudies.org/data-center/2020-time-series-study/}
"anes_2020"
