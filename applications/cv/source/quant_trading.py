# Content of Will_McGowan_CV_Quant_Trading.pdf. Text is ReportLab paragraph markup: <b>, <i>, and &lt; for "<".
CV = {
  "name": "WILL McGOWAN",
  "contact": "Glasgow, UK | +44 7562 299 515 | mcgowanwill366@gmail.com",
  "sections": [
    {"title": "EDUCATION", "entries": [
      {"left": "<b>University of Strathclyde</b>, Glasgow", "right": "Sep 2023 – Jun 2027 (expected)",
       "rows": ["<i>BA (Hons) Economics</i>"],
       "bullets": ["Average grade to date: 2:1, including 90% in first-year Finance",
                   "<b>Relevant Modules:</b> Applied Econometrics, Treasury Management and Derivatives, Advanced Microeconomics"],
       "subs": [
         {"left": "<b>Dissertation</b> | <i>MATLAB</i>", "right": "In progress, due 2027",
          "rows": ["<i>“Who Hedges the Barrel? Sovereign Oil Hedging and Petro-Currency Reactions to OPEC News”</i>"],
          "bullets": ["Testing whether sovereign hedges reshape a petro-currency’s oil beta: smaller under Norway’s krone conversions (vs unhedged Canada), kinked at Russia’s budget-rule cut-off, one-sided under Mexico’s puts",
                      "Measuring each currency’s move on OPEC announcement days since 1983, with difference-in-differences around rule changes and the dollar’s own move stripped out",
                      "Testing a pre-registered trading rule on any residual beta after costs, with a White reality check and Kelly sizing"]},
       ]},
      {"left": "<b>Belfast Royal Academy</b>, Belfast", "right": "Jun 2023",
       "bullets": ["A-levels: Mathematics (A), Economics (A), Computer Science (B)"]},
    ]},
    {"title": "PROJECTS", "entries": [
      {"left": "<b>Plains Heat and the KC-Chicago Wheat Spread</b>", "right": "<i>R</i>",
       "bullets": ["Tested whether Plains heatwaves move Kansas City wheat futures against Chicago, using 27 summers of NOAA weather data and the off-season as a placebo: heat explained 0.3% of weekly moves",
                   "Found a one-day timestamp error in the price data that would have faked a lead-lag signal; with it fixed, a trading rule set in advance showed no edge out of sample (2010–23)"]},
      {"left": "<b>Delta-Hedging Simulator</b>", "right": "<i>MATLAB</i>",
       "bullets": ["Simulated delta-hedging a short call on 50,000 paths: hedging four times as often halved the hedging error, and 0.1–0.5% trading costs moved the best frequency from daily to weekly",
                   "Tested a no-trade band around delta instead of a fixed timetable: on fresh paths the best band cut RMS P&amp;L by 6% vs the best timetable at 0.1% costs, and by 2% at 0.5%"]},
      {"left": "<b>Monte Carlo Option Pricing Engine</b>", "right": "<i>MATLAB</i>",
       "bullets": ["Priced an arithmetic Asian call by Monte Carlo, validated against two closed-form prices; a geometric-Asian control variate cut the variance 1,276-fold (97% off the standard error)",
                   "Mapped where the control variate weakens over 8 volatilities and 6 strikes: at the money its gain falls from 4,569x to 71x as volatility rises from 10% to 80%, and to 52x at worst out of the money"]},
      {"left": "<b>Empirical CAPM Test</b>", "right": "<i>MATLAB</i>",
       "bullets": ["Tested the CAPM on 694 anomaly portfolios in 54 countries (JKP data): alpha significant in 31% at 5%, over six times the rate expected by chance; GRS rejected in 48 of 53 countries",
                   "Corrected for running 694 tests at once: 123 of the 215 significant alphas survive Benjamini-Hochberg and 84 clear |t|&nbsp;&gt;&nbsp;3; momentum holds up best, while size’s hits are no more than luck predicts"]},
    ]},
    {"title": "WORK EXPERIENCE", "entries": [
      {"left": "<b>Le Set</b>, Glasgow | <i>Head Mixologist</i>", "right": "Sep 2026 – Present",
       "bullets": ["Wrote a new 200-cover venue’s 11-drink menu, including 4 original cocktails; trained around 15 bar staff"]},
      {"left": "<b>KONG</b>, Glasgow | <i>Mixologist and Front of House</i>", "right": "Oct 2024 – Jun 2026",
       "bullets": ["Analysed sales patterns to refine upselling prompts, raising average customer spend by an estimated 25%"]},
    ]},
    {"title": "LEADERSHIP AND ACTIVITIES", "entries": [
      {"left": "<b>Strathclyde Agricapital Society</b> | <i>Co-Founder and Treasurer</i>", "right": "Sep 2025 – Present",
       "bullets": ["Co-founded Strathclyde’s first agri-finance society, grew it to 126 members and published weekly research notes"]},
      {"left": "<b>Strathclyde Poker Society</b> | <i>Vice-President, then President</i>", "right": "Sep 2025 – Apr 2026",
       "bullets": ["Ran weekly tournaments for around 60 players on £600 a semester, reconciling every buy-in and prize pool"]},
    ]},
    {"title": "ADDITIONAL INFORMATION", "paras": [
      "<b>Technical:</b> R, MATLAB, Excel, Git",
      "<b>Interests:</b> Poker, over £40,000 in lifetime cash-game profit, using the Kelly criterion to choose stakes and size the bankroll (minimum 50 buy-ins); Chess, 14th at the Irish U19 Chess Championships (2023) and won 21 of 22 games in a simultaneous exhibition against players averaging 1860 FIDE; Powerlifting, Northern Ireland U19 champion (2023)",
    ]},
  ],
}
