# Shows why closes() prefers intraday prices: the KC file's end-of-day rows run a trading day behind Chicago in 2009-2020.
source("closes.R")
ch <- closes("data/WHEAT.csv")
cat("Correlation of KC's daily price change with Chicago's, same contract\n")
cat(sprintf("%-22s %-10s %9s %16s\n", "KC price used", "years", "same day", "Chicago day before"))
for (intraday in c(FALSE, TRUE)) {
  a <- merge(closes("data/REDWHEAT.csv", intraday), ch, by = c("date", "contract"))
  a <- a[order(a$contract, a$date), ]
  a$kc <- ave(a$price.x, a$contract, FUN = function(v) c(NA, diff(v)))
  a$ch <- ave(a$price.y, a$contract, FUN = function(v) c(NA, diff(v)))
  a$ch_before <- ave(a$ch, a$contract, FUN = function(v) c(NA, head(v, -1)))
  for (y in list(1996:2008, 2009:2020)) {
    k <- format(a$date, "%Y") %in% y
    cat(sprintf("%-22s %-10s %9.2f %16.2f\n", if (intraday) "last intraday price" else "end-of-day row",
                paste(range(y), collapse = "-"), cor(a$kc[k], a$ch[k], use = "complete.obs"),
                cor(a$kc[k], a$ch_before[k], use = "complete.obs")))
  }
}
