# Content of Will_McGowan_CV_Quant_Trading.pdf. Text is ReportLab paragraph markup: <b>, <i>, and &lt; for "<".
CV = {
  "name": "WILL McGOWAN",
  "contact": "Glasgow, UK | +44 7562 299 515 | mcgowanwill366@gmail.com",
  "sections": [
    {"title": "EDUCATION", "entries": [
      {"left": "<b>University of Strathclyde</b>, Glasgow", "right": "Sep 2023 - Jun 2027 (expected)",
       "rows": ["<i>BA (Hons) Economics</i>"],
       "bullets": ["Average grade to date: 2:1",
                   "<b>Relevant Modules:</b> Applied Econometrics; Treasury Management and Derivatives; Advanced Microeconomics"],
       "subs": [
         {"left": "<b>Dissertation</b> | <i>MATLAB</i>", "right": "In progress, due 2027",
          "rows": ["<i>“Does the News Pay? Forecasting European Gas Volatility with MIDAS, Storage and Text Data”</i>"],
          "bullets": ["Testing whether news attention improves forecasts of TTF gas price volatility with mixed-frequency (MIDAS) models built on daily storage, market and news data, including an original Google Trends attention index",
                      "Benchmarking out-of-sample against HAR and AR models with Diebold-Mariano tests before, during and after the crisis, and measuring economic value through the Sharpe ratio of a volatility-targeted TTF futures strategy"]},
       ]},
      {"left": "<b>Belfast Royal Academy</b>, Belfast", "right": "Jun 2023",
       "bullets": ["A-levels: Mathematics (A), Economics (A), Computer Science (B)"]},
    ]},
    {"title": "PROJECTS", "entries": [
      {"left": "<b>Wheat Calendar-Spread Strategy</b> | <i>Agricapital Society</i>", "right": "<i>R</i>",
       "bullets": ["Built a wheat calendar-spread strategy from futures curve structure and contrarian CFTC managed-money positioning, with every parameter fixed before testing to avoid overfitting",
                   "Weekly backtest (Apr 2025 - Oct 2026): Sharpe 0.76 before costs and 0.28 after, maximum drawdown 3.1%; identified turnover of about 50x notional a year as the main drag on returns"]},
      {"left": "<b>Delta-Hedging Simulator</b>", "right": "<i>MATLAB</i>",
       "bullets": ["Simulated selling a three-month call option and delta-hedging it on 50,000 price paths; hedging four times as often halved the hedging error, in line with theory",
                   "Showed that selling at the wrong volatility earns the Black-Scholes price difference on average, and that with 0.5% trading costs weekly hedging beats daily"]},
      {"left": "<b>Monte Carlo Option Pricing Engine</b>", "right": "<i>MATLAB</i>",
       "bullets": ["Built a vectorised Monte Carlo engine pricing European and Asian options under risk-neutral GBM, benchmarked against Black-Scholes and the closed-form geometric-Asian price",
                   "Cut the standard error of arithmetic-Asian estimates by about 97% at N = 100,000 using a geometric-Asian control variate alongside antithetic variates, equivalent to roughly 1,300 times as many plain Monte Carlo paths"]},
      {"left": "<b>Empirical CAPM Test</b>", "right": "<i>MATLAB</i>",
       "bullets": ["Tested CAPM on 704 anomaly portfolios across 56 countries (JKP global factor data), regressing each on its local market excess return",
                   "Rejected zero alpha for 32% of portfolios at the 5% level (32.7% with Newey-West errors), over six times the rate expected by chance, and jointly via GRS in 48 of 52 countries",
                   "Momentum alphas were significant in 37 of 55 countries, size in only 4 of 56"]},
    ]},
    {"title": "WORK EXPERIENCE", "entries": [
      {"left": "<b>Le Set</b>, Glasgow | <i>Head Mixologist</i>", "right": "Sep 2026 - Present",
       "bullets": ["Wrote a new 200-cover venue's 11-drink menu, including 4 original cocktails; trained around 15 bar staff"]},
      {"left": "<b>KONG</b>, Glasgow | <i>Mixologist and Front of House</i>", "right": "Oct 2024 - Jun 2026",
       "bullets": ["Analysed sales patterns to refine upselling prompts, raising average customer spend by an estimated 25%; reconciled cash and card takings at the end of each shift"]},
    ]},
    {"title": "LEADERSHIP AND ACTIVITIES", "entries": [
      {"left": "<b>Strathclyde Agricapital Society</b> | <i>Co-Founder and Treasurer</i>", "right": "Sep 2025 - Present",
       "bullets": ["Co-founded Strathclyde's first agri-finance society, grew it to 126 members and published weekly research notes"]},
      {"left": "<b>Strathclyde Poker Society</b> | <i>Vice-President, then President</i>", "right": "Sep 2025 - Apr 2026",
       "bullets": ["Ran weekly tournaments for around 60 players on £600 a semester, reconciling every buy-in and prize pool"]},
    ]},
    {"title": "ADDITIONAL INFORMATION", "paras": [
      "<b>Technical:</b> R, MATLAB, Python, Excel, Git",
      "<b>Interests:</b> poker, over £40,000 in lifetime cash-game profit, using the Kelly criterion to pick buy-in levels and manage bankroll (minimum 50 buy-ins); chess, 14th at the Irish U19 Chess Championships (2023) and won 21 of 22 games in a simultaneous exhibition against players averaging 1860 FIDE; powerlifting, Northern Ireland U19 champion (2023)",
    ]},
  ],
}
