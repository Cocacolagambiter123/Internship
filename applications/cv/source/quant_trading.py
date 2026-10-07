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
      {"left": "<b>Plains Heat and the KC-Chicago Wheat Spread</b>", "right": "<i>R</i>",
       "bullets": ["Tested whether Plains heatwaves move Kansas City wheat futures against Chicago, using 27 summers of NOAA weather data and the off-season as a placebo: heat explained 0.3% of weekly moves",
                   "Found a one-day timestamp error in the price data that would have faked a lead-lag signal; with it fixed, a trading rule set in advance showed no edge out of sample (2010-23)"]},
      {"left": "<b>Delta-Hedging Simulator</b>", "right": "<i>MATLAB</i>",
       "bullets": ["Simulated delta-hedging a short call on 50,000 paths: hedging four times as often halved the hedging error, and 0.1-0.5% trading costs moved the best frequency from daily to weekly",
                   "Tested rehedging only when the hedge drifts a set band from delta: on fresh paths it cut RMS P&amp;L by 6% against the best timetable at 0.1% costs, shrinking to 2% at 0.5%"]},
      {"left": "<b>Monte Carlo Option Pricing Engine</b>", "right": "<i>MATLAB</i>",
       "bullets": ["Priced an arithmetic Asian call by Monte Carlo, checked against two closed-form prices; a geometric-Asian control variate cut the variance 1,276-fold (97% off the standard error)",
                   "Mapped where the method stops working over 8 volatilities and 6 strikes: at the money the gain falls from 4,569x to 71x as volatility rises from 10% to 80%"]},
      {"left": "<b>Empirical CAPM Test</b>", "right": "<i>MATLAB</i>",
       "bullets": ["Tested the CAPM on 694 anomaly portfolios in 54 countries (JKP data): alpha significant in 31% at 5%, over six times the rate expected by chance; GRS rejected in 48 of 53 countries",
                   "Corrected for running 694 tests at once: 123 of the 215 significant alphas survive Benjamini-Hochberg and 84 clear |t| &gt; 3; momentum holds up best, size vanishes"]},
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
      "<b>Technical:</b> R, MATLAB, Excel, Git",
      "<b>Interests:</b> poker, over £40,000 in lifetime cash-game profit, using the Kelly criterion to pick buy-in levels and manage bankroll (minimum 50 buy-ins); chess, 14th at the Irish U19 Chess Championships (2023) and won 21 of 22 games in a simultaneous exhibition against players averaging 1860 FIDE; powerlifting, Northern Ireland U19 champion (2023)",
    ]},
  ],
}
