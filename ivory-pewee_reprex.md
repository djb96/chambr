``` r
library(chambr)

dat = read_chamber("~/log_2021-11-27_12.53.29.txt")
#> Warning: One or more parsing issues, see `problems()` for details

head(dat)
#> # A tibble: 6 x 13
#>   time                mode      state   alarms temp_c emi_fa trap_v pump_percent
#>   <dttm>              <chr>     <chr>    <dbl>  <dbl>  <dbl>  <dbl>        <dbl>
#> 1 2021-11-27 12:53:31 semi-auto measur~      0     41   12.4   10.3           41
#> 2 2021-11-27 12:53:32 semi-auto measur~      0     41   25.8   10.3           41
#> 3 2021-11-27 12:53:33 semi-auto measur~      0     41   29.2   10.3           41
#> 4 2021-11-27 12:53:34 semi-auto measur~      0     41   26.6   10.3           41
#> 5 2021-11-27 12:53:35 semi-auto measur~      0     41   32.3   10.4           41
#> 6 2021-11-27 12:53:36 semi-auto measur~      0     41   33.2   10.3           41
#> # ... with 5 more variables: charger_i_uA <dbl>, charger_u_v <dbl>,
#> #   bat_mv <dbl>, conc_fa <dbl>, conc_ugm3 <dbl>

plot_chamber(dat, drop_constant = T)
```

![](https://i.imgur.com/yAfkVuT.png)

<sup>Created on 2022-01-04 by the [reprex package](https://reprex.tidyverse.org) (v2.0.1)</sup>
