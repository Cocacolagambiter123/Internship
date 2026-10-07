# Daily close of every contract (YYYYMM) in a pysystemtrade multiple-prices file: the day's last hourly intraday
# price where the file has one, otherwise its 23:00 end-of-day row. intraday = FALSE keeps only the end-of-day rows.
closes <- function(file, intraday = TRUE) {
  p <- read.csv(file)
  if (!intraday) p <- p[substr(p$DATETIME, 12, 13) == "23", ]
  x <- data.frame(time = rep(p$DATETIME, 3),
                  contract = c(p$CARRY_CONTRACT, p$PRICE_CONTRACT, p$FORWARD_CONTRACT) %/% 100,
                  price = c(p$CARRY, p$PRICE, p$FORWARD))
  x <- x[!is.na(x$price), ]
  x$date <- as.Date(substr(x$time, 1, 10))
  x <- x[order(x$date, substr(x$time, 12, 13) != "23", x$time), ]
  x[!duplicated(x[c("date", "contract")], fromLast = TRUE), c("date", "contract", "price")]
}
