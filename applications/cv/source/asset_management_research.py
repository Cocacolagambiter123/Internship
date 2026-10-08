# Content of Will_McGowan_CV_Asset_Management_Research.pdf. Text is ReportLab paragraph markup: <b>, <i>, and &lt; for "<".
CV = {
  "name": "WILL McGOWAN",
  "contact": "Glasgow, UK | +44 7562 299 515 | mcgowanwill366@gmail.com",
  "sections": [
    {"title": "EDUCATION", "entries": [
      {"left": "<b>University of Strathclyde</b>, Glasgow", "right": "Sep 2023 – Jun 2027 (expected)",
       "rows": ["<i>BA (Hons) Economics</i>"],
       "bullets": ["Average grade to date: 2:1",
                   "<b>Relevant Modules:</b> Portfolio Management and Security Analysis; Applied Econometrics; Industrial Economics"],
       "subs": [
         {"left": "<b>Dissertation</b> | <i>MATLAB</i>", "right": "In progress, due 2027",
          "rows": ["<i>“Who Hedges the Barrel? Sovereign Hedging and Petro-Currency Oil Betas on OPEC Announcement Days”</i>"],
          "bullets": ["Testing whether a petro-currency’s oil beta shrinks under Norway’s krone conversions (vs unhedged Canada), kinks where Russia’s 2017–22 budget rule starts buying FX and turns one-sided under Mexico’s put hedge",
                      "Building an original policy dataset from Norges Bank and the Russian and Mexican finance ministries, and testing it against Känzig’s OPEC-day oil surprises with event studies and difference-in-differences",
                      "Stripping out the dollar factor so each beta measures oil, not the dollar, then testing whether any remaining beta is tradable after costs, judged by Sharpe ratio, drawdown and a White reality check"]},
         {"left": "<b>Empirical CAPM Test</b>", "right": "<i>MATLAB</i>",
          "bullets": ["Tested the CAPM on 694 anomaly portfolios in 54 countries (JKP global factor data) with Newey-West t-tests and the GRS joint test, rejecting it jointly in 48 of 53 countries",
                      "Momentum (35&nbsp;of&nbsp;54 countries) and value (28&nbsp;of&nbsp;54) earned the most persistent alphas, size almost none (5&nbsp;of&nbsp;54); 123 of 215 significant alphas survive a Benjamini-Hochberg multiple-testing correction"]},
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
       "bullets": ["Co-founded the university’s first agri-finance society, grew it to 126 members and led weekly research sessions on deals such as Olam Agri’s USD&nbsp;1.24bn stake sale to SALIC",
                   "Built a wheat calendar-spread strategy in R from futures curve structure and CFTC positioning (weekly backtest: Sharpe 0.76 before costs, 0.28 after, maximum drawdown 3.1%); published weekly notes for members"]},
      {"left": "<b>Strathclyde Poker Society</b> | <i>Vice-President, then President</i>", "right": "Sep 2025 – Apr 2026",
       "bullets": ["Ran weekly tournaments for around 60 players on £600 a semester, reconciling every buy-in and prize pool"]},
    ]},
    {"title": "ADDITIONAL INFORMATION", "paras": [
      "<b>Technical:</b> R, MATLAB, Excel, Git",
      "<b>Interests:</b> chess, 14th at the Irish U19 Chess Championships (2023) and won 21 of 22 games in a simultaneous exhibition against players averaging 1860 FIDE; powerlifting, Northern Ireland U19 champion (2023)",
    ]},
  ],
}
