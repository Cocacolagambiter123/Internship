# Tests whether heat on the southern Plains moves Kansas City wheat against Chicago wheat, and whether a trader
# who reads the weather stations could profit from it after costs.
source("closes.R")
heat_c <- 34      # degrees C; above this Kansas wheat yields fall (Tack, Barkley and Nalley, 2015)
season <- 5:6     # months in which the week ends: heading and grain fill of winter wheat
placebo <- 7:8    # after harvest, when Plains heat should no longer matter for wheat
train <- 1996:2009
test <- 2010:2023
cost <- 1.25      # cents/bushel per week traded: a 0.25c tick of slippage on each leg in and out, plus commission

# Change in one contract's price from the previous Friday's close to this Friday's
change <- function(x, week, contract) {
  price <- function(f) x$price[match(paste(contract, f), paste(x$contract, x$date))]
  price(week) - price(week - 7)
}

# OLS slopes with White heteroskedasticity-robust t-statistics, and R-squared
ols <- function(y, X) {
  X <- cbind(1, X)
  XXi <- solve(crossprod(X))
  b <- XXi %*% crossprod(X, y)
  e <- as.vector(y - X %*% b)
  se <- sqrt(diag(XXi %*% crossprod(X * e) %*% XXi))
  list(b = b[-1], t = (b / se)[-1], r2 = 1 - sum(e^2) / sum((y - mean(y))^2))
}

kc <- closes("data/REDWHEAT.csv")
ch <- closes("data/WHEAT.csv")
w <- data.frame(week = seq(as.Date("1996-01-05"), as.Date("2023-12-29"), by = 7))
w$year <- as.integer(format(w$week, "%Y"))
w$month <- as.integer(format(w$week, "%m"))
w <- w[w$month %in% c(season, placebo), ]
jul <- change(kc, w$week, 100 * w$year + 7)
sep <- change(kc, w$week, 100 * w$year + 9)
# KC leg: July while it is in the data and before July begins, then September; Chicago leg: always September
w$ds <- ifelse(w$month <= 6 & !is.na(jul), jul, sep) - change(ch, w$week, 100 * w$year + 9)
w <- w[!is.na(w$ds), ]

wx <- do.call(rbind, lapply(Sys.glob("data/USW*.csv.gz"), read.csv, header = FALSE))
wx <- wx[wx$V3 == "TMAX" & wx$V6 == "", ]   # V4 is the day's maximum in tenths of a degree, V6 the quality flag
hot <- tapply(wx$V4 >= 10 * heat_c, as.Date(as.character(wx$V2), "%Y%m%d"), mean)
day <- as.Date(names(hot))
# A day's maximum comes after the 1:20pm close, so a Friday's heat counts towards the following week
heat <- tapply(hot, day + 1 + (4 - as.POSIXlt(day)$wday) %% 7, sum)   # heat days per station, Friday to Thursday
w$h <- as.vector(heat[as.character(w$week)])
w$h_last <- as.vector(heat[as.character(w$week - 7)])
w$h_next <- as.vector(heat[as.character(w$week + 7)])

cat("Weekly change in KC minus Chicago (cents/bushel) on heat days per station, robust t in brackets\n")
cat(sprintf("%-8s %5s %10s %8s %10s %14s %14s %14s %5s\n", "weeks", "n", "mean heat", "sd heat", "sd spread",
            "next week", "this week", "last week", "R2"))
for (p in list(season, placebo)) {
  k <- w$month %in% p
  r <- ols(w$ds[k], cbind(w$h_next, w$h, w$h_last)[k, ])
  cat(sprintf("%-8s %5d %10.2f %8.2f %10.1f", paste(month.abb[range(p)], collapse = "-"), sum(k), mean(w$h[k]), sd(w$h[k]),
              sd(w$ds[k])),
      sprintf("%7.2f (%4.1f)", r$b, r$t), sprintf("%4.1f%%\n", 100 * r$r2))
}

s <- w[w$month %in% season, ]
thr <- quantile(s$h_last[s$year %in% train], 0.75)   # set from training-period weather, never from returns
rules <- list("last week's heat (rule)" = s$h_last >= thr,
              "every week" = rep(TRUE, nrow(s)),
              "this week's heat (foresight)" = s$h >= thr)
cat(sprintf("\nLong 1 KC, short 1 Chicago for one May-June week when heat >= %.2f days, net of %.2f c/bu a week\n", thr, cost))
cat(sprintf("%-28s  %-31s  %s\n", "", "1996-2009", "2010-2023"))
cat(sprintf("%-28s", "signal"), rep(sprintf("  %5s %6s %5s %4s %7s", "weeks", "c/bu", "t", "hit", "$"), 2), "\n", sep = "")
for (r in names(rules)) {
  cat(sprintf("%-28s", r))
  for (y in list(train, test)) {
    pnl <- s$ds[rules[[r]] & s$year %in% y] - cost
    cat(sprintf("  %5d %6.2f %5.2f %3.0f%% %7.0f", length(pnl), mean(pnl), mean(pnl) / sd(pnl) * sqrt(length(pnl)),
                100 * mean(pnl > 0), 50 * sum(pnl)))
  }
  cat("\n")
}

big <- head(s[order(-abs(s$ds)), ], 5)
cat("\nLargest May-June weekly moves in KC minus Chicago\n")
cat(sprintf("week ending %s  %6.2f c/bu  heat %.1f days\n", big$week, big$ds, big$h), sep = "")

png("heat_vs_spread.png", width = 800, height = 550)
plot(s$h, s$ds, pch = 19, col = rgb(0, 0, 0, 0.4), xlab = "heat days per station in the week (maximum of 34C or more)",
     ylab = "weekly change in KC minus Chicago wheat (cents/bushel)",
     main = "Plains heat and the KC-Chicago wheat spread, May-June weeks 1996-2023")
abline(lm(ds ~ h, data = s), lwd = 2)
text(big$h[1], big$ds[1], format(big$week[1], "week ending %d %B %Y"), pos = 4, cex = 0.9)
invisible(dev.off())
