# Content of Will_McGowan_CV_Asset_Management_Research.pdf. Text is ReportLab paragraph markup: <b>, <i>, and &lt; for "<".
CV = {
  "name": "WILL McGOWAN",
  "contact": "Glasgow, UK | +44 7562 299 515 | mcgowanwill366@gmail.com",
  "sections": [
    {"title": "EDUCATION", "entries": [
      {"left": "<b>University of Strathclyde</b>, Glasgow", "right": "Sep 2023 – Jun 2027 (expected)",
       "rows": ["<i>BA (Hons) Economics</i>"],
       "bullets": ["Average grade to date: 2:1, including 90% in first-year Finance",
                   "Second-highest mark (78%) in a group project for Advanced Corporate Finance and Financial Markets",
                   "<b>Relevant Modules:</b> Portfolio Management and Security Analysis, Applied Econometrics, Industrial Economics"],
       "subs": [
         {"left": "<b>Dissertation</b> | <i>MATLAB</i>", "right": "In progress, due 2027",
          "rows": ["<i>“Who Hedges the Barrel? Sovereign Oil Hedging and Petro-Currency Reactions to OPEC News”</i>"],
          "bullets": ["Testing whether sovereign oil hedges reshape a currency’s reaction to OPEC news: smaller under Norway’s krone conversions (vs unhedged Canada), kinked under Russia’s budget rule, one-sided under Mexico’s puts",
                      "Building an original dataset of each country’s rules from central bank and finance ministry records, with predictions fixed in advance and the dollar’s own moves stripped out",
                      "Testing whether what remains is tradable after costs, judged by Sharpe ratio and a White reality check"]},
         {"left": "<b>Empirical CAPM Test</b>", "right": "<i>MATLAB</i>",
          "bullets": ["Tested the CAPM on 694 anomaly portfolios in 54 countries (JKP global factor data) with Newey-West t-tests and the GRS joint test, rejecting it jointly in 48 of 53 countries",
                      "Asked how many alphas luck alone would produce (about 35 of 694) before trusting any: 123 of 215 survive a multiple-testing correction, led by momentum (35 of 54 countries) and value, while size looks like luck"]},
         {"left": "<b>Monte Carlo Option Pricing Engine</b>", "right": "<i>MATLAB</i>",
          "bullets": ["Priced European and Asian options by simulation, benchmarked against Black-Scholes; a geometric-Asian control variate cut the arithmetic-Asian standard error by 97%, equivalent to 1,276 times as many paths"]},
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
       "bullets": ["Co-founded the university’s first agri-finance society, grew it to 126 members, published weekly notes and led sessions on why buyers want each asset and what they pay, as in Olam Agri’s USD&nbsp;1.24bn stake sale to SALIC",
                   "Built a wheat calendar-spread strategy in R from futures curve structure and CFTC positioning and judged it after costs: Sharpe 0.76 before, 0.28 after (maximum drawdown 3.1%), so turnover erodes an edge fast"]},
      {"left": "<b>Strathclyde Poker Society</b> | <i>Vice-President, then President</i>", "right": "Sep 2025 – Apr 2026",
       "bullets": ["Ran weekly tournaments for about 60 players on a £600 budget per semester, reconciling buy-ins and prizes",
                   "Taught new members to use the Kelly criterion to estimate how many buy-ins their win rate, variance and risk level call for, with a buffer in case the edge is overestimated"]},
    ]},
    {"title": "ADDITIONAL INFORMATION", "paras": [
      "<b>Technical:</b> R, MATLAB, Excel, Git",
      "<b>Chess:</b> 14th at the 2023 Irish U19 Championships; played 22 opponents at once (average 1860 FIDE) and won 21",
      "<b>Powerlifting:</b> Northern Ireland U19 champion (2023)",
    ]},
  ],
}
