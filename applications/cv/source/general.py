# Content of Will_McGowan_CV_General.pdf. Text is ReportLab paragraph markup: <b>, <i>, and &lt; for "<".
CV = {
  "name": "WILL McGOWAN",
  "contact": "Glasgow, UK | +44 7562 299 515 | mcgowanwill366@gmail.com",
  "sections": [
    {"title": "EDUCATION", "entries": [
      {"left": "<b>University of Strathclyde</b>, Glasgow", "right": "Sep 2023 - Jun 2027 (expected)",
       "rows": ["<i>BA (Hons) Economics</i>"],
       "bullets": ["Average grade to date: 2:1",
                   "<b>Relevant Modules:</b> Applied Econometrics; Treasury Management and Derivatives; Industrial Economics"],
       "subs": [
         {"left": "<b>Dissertation</b> | <i>MATLAB</i>", "right": "In progress, due 2027",
          "rows": ["<i>“Does the News Pay? Forecasting European Gas Volatility with MIDAS, Storage and Text Data”</i>"],
          "bullets": ["Testing whether news attention improves forecasts of TTF gas price volatility with mixed-frequency (MIDAS) models built on daily storage, market and news data, including an original Google Trends attention index",
                      "Benchmarking out-of-sample against HAR and AR models with Diebold-Mariano tests across pre-crisis, crisis and post-crisis periods, and measuring economic value through the Sharpe ratio of a volatility-targeted TTF futures strategy"]},
         {"left": "<b>Empirical CAPM Test</b>", "right": "<i>MATLAB</i>",
          "bullets": ["Tested CAPM on 694 anomaly portfolios across 54 countries (JKP global factor data): zero alpha rejected for 31% at 5% and jointly (GRS) in 48 of 53 countries, with momentum and value the most persistent"]},
         {"left": "<b>Monte Carlo Option Pricing Engine</b>", "right": "<i>MATLAB</i>",
          "bullets": ["Built a vectorised Monte Carlo engine pricing European and Asian options under risk-neutral GBM, benchmarked against Black-Scholes and the closed-form geometric-Asian price",
                      "Reduced the standard error of arithmetic-Asian estimates by 97% vs plain Monte Carlo at N = 100,000 using a geometric-Asian control variate"]},
         {"left": "<b>Corn-Soybean Cointegration</b> | <i>group project</i>", "right": "<i>R</i>",
          "bullets": ["Found one cointegrating relationship between corn and soybean prices (quarterly, 1990-2022) with Engle-Granger and Johansen tests; the error-correction model showed both prices adjusting back to equilibrium (soybean coefficient -0.29, p &lt; 0.001)"]},
       ]},
      {"left": "<b>Belfast Royal Academy</b>, Belfast", "right": "Jun 2023",
       "bullets": ["A-levels: Mathematics (A), Economics (A), Computer Science (B)"]},
    ]},
    {"title": "WORK EXPERIENCE", "entries": [
      {"left": "<b>Le Set</b>, Glasgow | <i>Head Mixologist</i>", "right": "Sep 2026 - Present",
       "bullets": ["Created 4 original house cocktails and wrote the specifications for the 7 classics on the menu of a new 200-cover restaurant and cocktail lounge, opened Sep 2026",
                   "Wrote batch specifications for 5 prebatched cocktails and trained around 15 bar staff to prepare and serve them consistently"]},
      {"left": "<b>KONG</b>, Glasgow | <i>Mixologist and Front of House</i>", "right": "Oct 2024 - Jun 2026",
       "bullets": ["Analysed sales patterns to refine upselling prompts, raising average customer spend by an estimated 25%",
                   "Reconciled cash and card takings at the end of each shift and trained new staff on drink specifications, POS workflows and licensing compliance"]},
    ]},
    {"title": "LEADERSHIP AND ACTIVITIES", "entries": [
      {"left": "<b>Strathclyde Agricapital Society</b> | <i>Co-Founder and Treasurer</i>", "right": "Sep 2025 - Present",
       "bullets": ["Co-founded the university's first agri-finance society, grew membership to 126 and led weekly research sessions on deals such as Olam Agri's USD 1.24bn stake sale to SALIC",
                   "Built a wheat calendar-spread strategy in R from futures curve structure and CFTC managed-money positioning; weekly backtest (Apr 2025 - Oct 2026): Sharpe 0.76 before costs and 0.28 after, maximum drawdown 3.1%"]},
      {"left": "<b>Strathclyde Poker Society</b> | <i>Vice-President, then President</i>", "right": "Sep 2025 - Apr 2026",
       "bullets": ["Ran weekly tournaments for around 60 players on a £600-per-semester budget, reconciling every buy-in and prize pool"]},
    ]},
    {"title": "ADDITIONAL INFORMATION", "paras": [
      "<b>Technical:</b> R, MATLAB, Excel, Git",
      "<b>Interests:</b> chess, 14th at the Irish U19 Chess Championships (2023) and won 21 of 22 games in a simultaneous exhibition against players averaging 1860 FIDE; powerlifting, Northern Ireland U19 champion (2023)",
    ]},
  ],
}
