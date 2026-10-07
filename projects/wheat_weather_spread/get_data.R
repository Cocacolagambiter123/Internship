# Downloads the KC and Chicago wheat futures prices and the daily records of six Plains weather stations into data/.
dir.create("data", showWarnings = FALSE)

# Pinned to the pysystemtrade commit whose files give the results in README.md
prices <- "https://raw.githubusercontent.com/robcarver17/pysystemtrade/a62269d27707806ba61f516791b71a9cd14cf268/data/futures/multiple_prices_csv/"
for (f in c("REDWHEAT.csv", "WHEAT.csv")) download.file(paste0(prices, f), file.path("data", f))

# Goodland, Dodge City, Concordia and Wichita (Kansas), Gage (Oklahoma), Amarillo (Texas)
stations <- c("USW00023065", "USW00013985", "USW00013984", "USW00003928", "USW00013975", "USW00023047")
weather <- "https://noaa-ghcn-pds.s3.amazonaws.com/csv.gz/by_station/"
for (s in stations) download.file(paste0(weather, s, ".csv.gz"), file.path("data", paste0(s, ".csv.gz")), mode = "wb")
