#' Historical weather data (1990-2019) in Ames, Iowa
#'
#' A dataset with weather data for Ames Iowa as downloaded from the Iowa Mesonet NWSCoop network.
#'
#' @format A data frame with 10,957 rows and 10 variables:
#' \describe{
#'   \item{station}{a unique 6 digit station code, alpha-numeric}
#'   \item{station_name}{a unique name assigned to each station code that may be more informative, alpha-numeric}
#'   \item{lat}{latitude, N}
#'   \item{lon}{longitude, W}
#'   \item{day}{date of measurement, ymd}
#'   \item{doy}{day of year, numeric}
#'   \item{high}{highest recorded temperature on that date, F}
#'   \item{low}{lowest recorded temperature on that date, F}
#'   \item{precip}{total precipitation for that date (rain equivalent), inches}
#'   \item{merra_srad}{total radiation for that date, MJ per m2}
#'   ...
#' }
#' @source \url{https://mesonet.agron.iastate.edu/request/coop/fe.phtml}
"wea_ames_30yrs"

#' 2019 weather data in Ames, Iowa
#'
#' A dataset with weather data for Ames Iowa as downloaded from the Iowa Mesonet NWSCoop network.
#'
#' @format A data frame with 365 rows and 10 variables:
#' \describe{
#'   \item{station}{a unique 6 digit station code, alpha-numeric}
#'   \item{station_name}{a unique name assigned to each station code that may be more informative, alpha-numeric}
#'   \item{lat}{latitude, N}
#'   \item{lon}{longitude, W}
#'   \item{day}{date of measurement, ymd}
#'   \item{doy}{day of year, numeric}
#'   \item{high}{highest recorded temperature on that date, F}
#'   \item{low}{lowest recorded temperature on that date, F}
#'   \item{precip}{total precipitation for that date (rain equivalent), inches}
#'   \item{merra_srad}{total radiation for that date, MJ per m2}
#'   ...
#' }
#' @source \url{https://mesonet.agron.iastate.edu/request/coop/fe.phtml}
"wea_ames_2019"

#' Historical weather data (1990-2019) in Ames, Burlington, and Sioux City Iowa
#'
#' A dataset with weather data for three sites in Iowa as downloaded from the Iowa Mesonet NWSCoop network.
#'
#' @format A data frame with 21,914 rows and 10 variables:
#' \describe{
#'   \item{station}{a unique 6 digit station code, alpha-numeric}
#'   \item{station_name}{a unique name assigned to each station code that may be more informative, alpha-numeric}
#'   \item{lat}{latitude, N}
#'   \item{lon}{longitude, W}
#'   \item{day}{date of measurement, ymd}
#'   \item{doy}{day of year, numeric}
#'   \item{high}{highest recorded temperature on that date, F}
#'   \item{low}{lowest recorded temperature on that date, F}
#'   \item{precip}{total precipitation for that date (rain equivalent), inches}
#'   \item{merra_srad}{total radiation for that date, MJ per m2}
#'   ...
#' }
#' @source \url{https://mesonet.agron.iastate.edu/request/coop/fe.phtml}
"wea_3sites_30yrs"
