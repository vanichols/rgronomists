
# rgronomists

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of rgronomists is to provide easy access to agriculture-related
data.

## Installation

You can install the developmental version of rgronomists from
[github](https://CRAN.R-project.org) with:

``` r
devtools::install_github("vanichols/rgronomists")
```

## Examples

You can get easy access to weather data the is available on the [Iowa
Mesonet’s NWS Cooperative Network
Page](https://mesonet.agron.iastate.edu/COOP/)

``` r
library(rgronomists)
head(wea_ames_30yrs)
#>   station station_name   lat   lon        day doy high low precip merra_srad
#> 1  IA0200   AMES-8-WSW 42.03 -93.8 1990-01-01   1   31   8  1e-04   9.052971
#> 2  IA0200   AMES-8-WSW 42.03 -93.8 1990-01-02   2   46  15  0e+00   8.913604
#> 3  IA0200   AMES-8-WSW 42.03 -93.8 1990-01-03   3   45  25  0e+00   5.822147
#> 4  IA0200   AMES-8-WSW 42.03 -93.8 1990-01-04   4   40  20  1e-04   9.170444
#> 5  IA0200   AMES-8-WSW 42.03 -93.8 1990-01-05   5   44  13  0e+00   8.864169
#> 6  IA0200   AMES-8-WSW 42.03 -93.8 1990-01-06   6   40  14  0e+00   9.075016
```
