# Content of Will_McGowan_CV_General.pdf. Text is ReportLab paragraph markup: <b>, <i>, and &lt; for "<".
CV = {
  "name": "WILL McGOWAN",
  "contact": "Glasgow, UK | +44 7562 299 515 | mcgowanwill366@gmail.com",
  "sections": [
    {"title": "EDUCATION", "entries": [
      {"left": "<b>University of Strathclyde</b>, Glasgow", "right": "Sep 2023 – Jun 2027 (expected)",
       "rows": ["<i>BA (Hons) Economics</i>"],
       "bullets": ["Average grade to date: 2:1, including 90% in first-year Finance",
                   "Second-highest mark (78%) in a group project for Advanced Corporate Finance and Financial Markets",
                   "<b>Relevant Modules:</b> Applied Econometrics; Treasury Management and Derivatives; Industrial Economics"],
       "subs": [
         {"left": "<b>Dissertation</b> | <i>MATLAB</i>", "right": "In progress, due 2027",
          "rows": ["<i>“Who Hedges the Barrel? Sovereign Oil Hedging and Petro-Currency Reactions to OPEC News”</i>"],
          "bullets": ["Testing whether a petro-currency’s oil beta shrinks, kinks or turns one-sided when its government hedges oil: Norway’s krone conversions (vs unhedged Canada), Russia’s 2017–22 budget rule and Mexico’s put hedge",
                      "Building an original dataset from Norges Bank and the Russian and Mexican finance ministries, and testing it with event studies and difference-in-differences around each rule change",
                      "Testing whether what remains is tradable after costs, judged by Sharpe ratio and a White reality check"]},
         {"left": "<b>Empirical CAPM Test</b>", "right": "<i>MATLAB</i>",
          "bullets": ["Tested whether the CAPM explains returns on 694 anomaly portfolios across 54 countries: it failed for 31% of portfolios individually and jointly in 48 of 53 countries, with momentum and value the most persistent"]},
         {"left": "<b>Monte Carlo Option Pricing Engine</b>", "right": "<i>MATLAB</i>",
          "bullets": ["Built a vectorised Monte Carlo engine pricing European and Asian options under risk-neutral GBM, benchmarked against Black-Scholes and the closed-form geometric-Asian price",
                      "Cut the arithmetic-Asian standard error by 97% at 100,000 paths with a geometric-Asian control variate"]},
         {"left": "<b>Corn-Soybean Cointegration</b> | <i>group project</i>", "right": "<i>R</i>",
          "bullets": ["Found corn and soybean prices cointegrated (quarterly, 1990–2022; Engle-Granger and Johansen tests); in the error-correction model both prices adjust back to equilibrium (soybean coefficient −0.29, p&nbsp;&lt;&nbsp;0.001)"]},
       ]},
      {"left": "<b>Belfast Royal Academy</b>, Belfast", "right": "Jun 2023",
       "bullets": ["A-levels: Mathematics (A), Economics (A), Computer Science (B)"]},
    ]},
    {"title": "WORK EXPERIENCE", "entries": [
      {"left": "<b>Le Set</b>, Glasgow | <i>Head Mixologist</i>", "right": "Sep 2026 – Present",
       "bullets": ["Designed the 11-drink menu for a new 200-cover restaurant and cocktail lounge, including 4 original cocktails",
                   "Wrote batch specifications for 5 pre-batched cocktails and trained around 15 staff to serve them consistently"]},
      {"left": "<b>KONG</b>, Glasgow | <i>Mixologist and Front of House</i>", "right": "Oct 2024 – Jun 2026",
       "bullets": ["Analysed sales patterns to refine upselling prompts, raising average customer spend by an estimated 25%",
                   "Trained new staff on drink specifications, POS and licensing rules; reconciled cash and card takings each shift"]},
    ]},
    {"title": "LEADERSHIP AND ACTIVITIES", "entries": [
      {"left": "<b>Strathclyde Agricapital Society</b> | <i>Co-Founder and Treasurer</i>", "right": "Sep 2025 – Present",
       "bullets": ["Co-founded the university’s first agri-finance society, grew it to 126 members and led weekly research sessions on deals such as Olam Agri’s USD&nbsp;1.24bn stake sale to SALIC",
                   "Built a wheat calendar-spread strategy in R from futures curve structure and CFTC managed-money positioning; weekly backtest (Apr 2025 – Oct 2026): Sharpe 0.76 before costs and 0.28 after, maximum drawdown 3.1%"]},
      {"left": "<b>Strathclyde Poker Society</b> | <i>Vice-President, then President</i>", "right": "Sep 2025 – Apr 2026",
       "bullets": ["Ran weekly tournaments for around 60 players on £600 a semester, reconciling every buy-in and prize pool"]},
    ]},
    {"title": "ADDITIONAL INFORMATION", "paras": [
      "<b>Technical:</b> R, MATLAB, Excel, Git",
      "<b>Interests:</b> chess, 14th at the Irish U19 Chess Championships (2023) and won 21 of 22 games in a simultaneous exhibition against players averaging 1860 FIDE; powerlifting, Northern Ireland U19 champion (2023)",
    ]},
  ],
}
