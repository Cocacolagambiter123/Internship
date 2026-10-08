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
          "bullets": ["Testing three predictions fixed in advance: sovereign hedges should reshape oil betas like options, smaller under Norway’s krone conversions, kinked at Russia’s budget-rule cut-off, one-sided under Mexico’s puts",
                      "Measuring each currency’s move on OPEC announcement days since 1983, net of the dollar’s own move, with unhedged Canada as a control and difference-in-differences around Russia’s rule changes",
                      "Testing a pre-registered trading rule on any residual beta after costs, with a White reality check and Kelly sizing"]},
       ]},
      {"left": "<b>Belfast Royal Academy</b>, Belfast", "right": "Jun 2023",
       "bullets": ["A-levels: Mathematics (A), Economics (A), Computer Science (B)"]},
    ]},
    {"title": "PROJECTS", "entries": [
      {"left": "<b>Plains Heat and the KC-Chicago Wheat Spread</b>", "right": "<i>R</i>",
       "bullets": ["Tested whether Plains heatwaves move Kansas City wheat against Chicago, using the spread so shared news cancels, 27 summers of NOAA data and the off-season as a placebo: heat explained 0.3% of weekly moves",
                   "Distrusted a too-good lead-lag signal (0.74 correlation with Chicago’s previous day, 0.25 same day) and traced it to a one-day timestamp error; with it fixed, a rule set in advance had no edge out of sample (2010–23)"]},
      {"left": "<b>Delta-Hedging Simulator</b>", "right": "<i>MATLAB</i>",
       "bullets": ["Simulated delta-hedging a short call on 50,000 paths, first checking it against theory (hedging four times as often halved the error, as 1/√N predicts), then found 0.1–0.5% costs push the best frequency from daily to weekly",
                   "Reasoned that a timetable wastes trades when the hedge has barely drifted, so tested a no-trade band around delta: on fresh paths the best band cut RMS P&amp;L by 6% vs the best timetable at 0.1% costs, and 2% at 0.5%"]},
      {"left": "<b>Monte Carlo Option Pricing Engine</b>", "right": "<i>MATLAB</i>",
       "bullets": ["Priced an arithmetic Asian call by Monte Carlo, validated against two closed-form prices; chose a geometric-Asian control variate because the two payoffs move together (ρ&nbsp;=&nbsp;0.9996), cutting the variance 1,276-fold",
                   "Mapped where the control variate weakens over 8 volatilities and 6 strikes, and why: at the money its gain falls roughly as 1/σ², from 4,569x to 71x as volatility rises from 10% to 80%, and to 52x at worst out of the money"]},
      {"left": "<b>Empirical CAPM Test</b>", "right": "<i>MATLAB</i>",
       "bullets": ["Tested the CAPM on 694 anomaly portfolios in 54 countries (JKP data): 215 alphas (31%) were significant at 5%, over six times the 35 luck alone would produce; GRS rejected it in 48 of 53 countries",
                   "Corrected for running 694 tests at once: 123 survive Benjamini-Hochberg, 84 clear |t|&nbsp;&gt;&nbsp;3 and 22 Bonferroni, nearly all positive where flukes would split by sign; momentum holds up best, size looks like luck"]},
    ]},
    {"title": "WORK EXPERIENCE", "entries": [
      {"left": "<b>Le Set</b>, Glasgow | <i>Head Mixologist</i>", "right": "Sep 2026 – Present",
       "bullets": ["Designed a new 200-cover venue’s 11-drink menu, including 4 original cocktails; trained around 15 bar staff"]},
      {"left": "<b>KONG</b>, Glasgow | <i>Mixologist and Front of House</i>", "right": "Oct 2024 – Jun 2026",
       "bullets": ["Analysed sales patterns to refine upselling prompts, raising average customer spend by an estimated 25%"]},
    ]},
    {"title": "LEADERSHIP AND ACTIVITIES", "entries": [
      {"left": "<b>Strathclyde Agricapital Society</b> | <i>Co-Founder and Treasurer</i>", "right": "Sep 2025 – Present",
       "bullets": ["Co-founded Strathclyde’s first agri-finance society, grew it to 126 members and published weekly research notes"]},
      {"left": "<b>Strathclyde Poker Society</b> | <i>Vice-President, then President</i>", "right": "Sep 2025 – Apr 2026",
       "bullets": ["Ran weekly tournaments for about 60 players on a £600 budget per semester, reconciling buy-ins and prizes",
                   "Having played 12 tables at once myself, taught new members to use the Kelly criterion to estimate how many buy-ins their win rate, variance and risk level call for, with a buffer in case the edge is overestimated"]},
    ]},
    {"title": "ADDITIONAL INFORMATION", "paras": [
      "<b>Technical:</b> R, MATLAB, Excel, Git",
      "<b>Chess:</b> 14th at the 2023 Irish U19 Championships; gave a 22-board simul (average 1860 FIDE) and won 21 games",
      "<b>Powerlifting:</b> Northern Ireland U19 champion (2023)",
    ]},
  ],
}
