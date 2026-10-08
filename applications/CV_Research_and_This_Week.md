# CV research and this week's plan (8 October 2026)

What the firms behind each CV say they want, how people without summer internships got similar jobs, and what to do this week (8–14 October) to add something new to each CV.

**How this was gathered:** web searches on 8 October 2026. Most firm pages could not be opened directly, so the quotes come from search snippets of the firms' own pages and job adverts. Check the live page before quoting a firm back to itself in a cover letter. Forum stories (Reddit, Wall Street Oasis, Blind) are anecdotes and are marked as such.

## Deadlines in the next five weeks

These matter more than any new CV line. Dates marked "verify" came from third-party job boards or conflicting pages.

| Date | Firm and role | CV |
|---|---|---|
| Fri 16 Oct | Capital Economics, Graduate Economist | Banking/PE/Consulting |
| Fri 16 Oct | British International Investment, Investment and Impact Graduate (verify) | Banking/PE/Consulting |
| Mon 19 Oct, 12pm | Baringa, Graduate Analyst – Energy & Resources | Banking/PE/Consulting |
| Mon 19 Oct, 17:00 CET | Optiver, "The Trading Floor" institutional trading event on 13 Nov (eligibility unclear) | Quant |
| Tue 20 Oct | Maven Securities, Graduate Trader 2027 (Amsterdam) | Quant |
| Wed 21 Oct, 5pm | KPMG Ireland, 2027 graduate roles (verify the Corporate Finance date) | Banking/PE/Consulting |
| Fri 23 Oct | LCP Delta, Energy Research (Edinburgh) | Banking/PE/Consulting |
| 23 Oct or 1 Nov | J.P. Morgan, 2027 Investment Banking Analyst (sources differ) | Banking/PE/Consulting |
| Thu 29 Oct | FTI Consulting, Economic & Financial Consulting | Banking/PE/Consulting |
| Fri 30 Oct | Macquarie, Commodities and Global Markets (verify) | Quant |
| Sat 31 Oct | Janus Henderson, Research Associate | Asset Management |
| Sat 31 Oct | Howden, investment analyst roles (one application across all its 2027 schemes) | Banking/PE/Consulting |
| Tue 3 Nov | Baillie Gifford, Investment Research Programme 2027 | Asset Management |
| About 5 Nov | Civil Service Fast Stream, Government Economic Service (expected to open around now; check civil-service-careers.gov.uk) | General |
| Mid-Nov | Fidelity International, Equity Research (verify the date) | Asset Management |
| Rolling | Oxford Economics (reviewing since 28 Sep), Point72 Academy (applications reviewed as they arrive) | Consulting, Asset Management |

Optiver's Career Kickstarter (Trading), 30 Nov–4 Dec 2026 or March 2027, is open to final-year students at European universities and can lead to a Graduate Trader offer. It is the closest thing to an internship still open to you. No deadline was found.

## What changed on the CVs this round

- **Dissertation:** back towards the original wording, since the work is still in progress. It keeps two points from the last round: the predictions fixed in advance, and unhedged Canada as the control.
- **Every other project bullet:** keeps the facts from the original and the reasoning from the last round. That means what was tested, the check or judgement call that shaped it, then the result.
- **The bullets now follow what the research found works for each reader:**
  - Open with the question.
  - Show the number that went against your own idea (Sharpe 0.76 before costs, 0.28 after).
  - Show the signal you killed (the timestamp error).
  - Say where a method stops working (the control variate's gain falls as 1/σ²).
  - Use real deal figures for bankers: SALIC paid USD 1.24bn for 35.4% of Olam Agri, implying USD 3.5bn of equity.
- **All four CVs still fit on one page.** The appendix shows every project bullet as original, last round and now.

## 1. Quant Trading CV

### What the firms say they want

- **Jane Street:** "We're more interested in how you think and learn than what you currently know." No finance background needed. Wants quantitative aptitude, teamwork and owning your mistakes.
- **Optiver:** "exceptional logical reasoning" and "excellent numerical and analytical skills". Trading knowledge is not needed; Python is a plus.
- **Susquehanna (SIG):** "Numerate + Logical". Trains poker, game theory and decision science. Its training lead: "We are trying to teach people how to be good decision-makers under uncertainty."
- **IMC:** economics accepted, and the advert names Python, MATLAB and R. **Old Mission** explicitly accepts R and MATLAB.
- **3Red:** asks for a track record in skill-based competition and names poker. **Maven:** probability, statistics and real interest in markets.
- **Capula:** economics accepted, but Python and Excel required. **Macquarie:** analytical curiosity, explaining complex ideas, strong Excel.

**Common themes, most to least frequent:**
1. Probability and numeracy
2. Decisions under uncertainty
3. Learning speed over finance knowledge
4. Communication
5. Interest in markets
6. Python
7. A competitive record

### People who got in without internships, and how they differed

- **A professional poker player** with an economics degree did about five years of poker, then intensive interview prep, then got an offer from a top prop shop. *(Wall Street Oasis, anecdotal.)* The interview did the work.
- **A strong chess player** with an English degree got an oil-futures trading job at Tradelink through a chess contact. *(Institutional Investor.)* The hobby's network got him past the CV screen.
- **An IMC Sydney trader** spent about three years as an analyst at the Reserve Bank of Australia first. *(IMC profile.)* A prior analytical job stood in for the internship.
- **An LSE economist** who played backgammon and poker tournaments got into Goldman Sachs equity trading. *(Poker forum, 2004, anecdotal.)*
- **The other side:** forum posters say Jane Street's graduate traders mostly come from its interns, and the poker players who could be verified (e.g. Jens Kyllönen at SIG) went through internships.

**What differed between them:**
- a game record plus heavy test prep;
- a network through the hobby;
- a prior analytical job;
- strong grades at firms that screen by test, where a missing internship alone may not sink you.

**What it means for you:** firms that screen with tests (Optiver, SIG, IMC, Maven) are the best bet. Your chess result can be checked, which matters: forum posters point out that poker winnings can't be.

### This week

| Action | Time | What it adds to the CV |
|---|---|---|
| Port the Monte Carlo Asian option pricer (or the hedging simulator) to Python on GitHub, with tests and a README | 6–8 h | Fixes the gap most adverts mention. Then add "Python (NumPy)" to Technical and a GitHub link. Draft line: "Asian option Monte Carlo (MATLAB → Python/NumPy, github.com/…): geometric control variate cuts variance 1,276x; gain decays as ~1/σ²" |
| Pre-register the dissertation's predictions and trading test on OSF (osf.io/registries). Only do this if you haven't looked at the hold-out data yet | 2 h | A public, timestamped record that makes "predictions fixed in advance" and "pre-registered" checkable. Draft line: "Trading test pre-registered on OSF (Oct 2026) before using hold-out data" |
| One-page write-up of the wheat timestamp bug, in the same repository | 1.5 h | A public link for the story interviewers like most: "how a one-day timestamp error faked a lead-lag signal" |
| Mental maths and probability drills (Zetamac, aim for 55+; *Heard on the Street*; the Green Book; *Fifty Challenging Problems in Probability*) | 30 min a day | Nothing on the CV (don't list a Zetamac score), but Optiver's 80-in-8 test and Maven's probability test screen on it |
| Attempt the current Jane Street puzzle | 3 h at most | Correct solvers are named only when the solution comes out, so nothing will show this week |

**Not possible this week:**
- IMC Prosperity runs in spring.
- Optiver Ready Trader Go is closed.
- CME's University Trading Challenge closed on 29–30 September.

## 2. Asset Management Research CV

### What the firms say they want

- **Baillie Gifford:**
  - Asks "Are you a self-starter?" and describes itself as "curious, patient, brave": brave means forming a view and defending it.
  - From a TARGETjobs article sponsored by Baillie Gifford: "Many employers in the investment banking and management world expect candidates to have first attended finance insight days and then undertaken an internship or placement year – Baillie Gifford does not."
  - A person reads a CV of up to two pages plus one question, and nothing else you attach. Then come a video interview and a call with a senior investor.
- **Fidelity:**
  - "We're looking for highly driven people with intellectual curiosity, ambition, resilience, comfort with numeracy…"
  - "Articulate and persuasive: You'll need the tenacity and confidence to communicate your judgement on whether shares in a company should be bought or sold."
- **Janus Henderson:** "Highly numerate with great attention to detail"; "Open minded / curious and willing to ask questions"; "Previous finance-related internship/experience preferred", so preferred, not required. Python is a plus.
- **Point72 Academy:** curiosity, coachability, intuition, grit and real interest in markets. More than half of Academy graduates didn't study finance.
- **Others:**
  - **Ruffer:** resilience and curiosity.
  - **Man Group Solutions:** analytical and willing to challenge its own convictions.
  - **Partners Group:** wants people who challenge conventional thinking.
  - **Kiltearn:** no graduate scheme; approach speculatively at careers@kiltearnpartners.com.

**Common themes:**
1. Curiosity
2. Independent judgement you can defend
3. Numeracy and attention to detail
4. A long-term temperament
5. Clear writing
6. Being a self-starter

### People who got in without internships, and how they differed

Baillie Gifford publishes its graduates' backgrounds:
- **Nathan Hill:** economics and politics at Bath, the first in his family at university, with about seven years in non-graduate jobs in the electricity sector first.
- **Jamila Osman:** chemical engineering at Edinburgh, then a short spell as an IT analyst.
- **Vittorio Lavioso:** law at Bocconi.
- **Others:** graduates in English and classics, law and physics. One of them: "One thing I wish I had done was speak with more confidence about experience I had that was completely unrelated to finance/investments."
- **A Wall Street Oasis poster** from a lower-ranked university says passing CFA Level I got them into equity research *(anecdotal)*.

**What differed between them:**
- **Experience route:** Hill turned years in an industry into sector insight.
- **Switcher route:** Osman and Lavioso brought rigour from another subject plus a clear reason for wanting long-term investing.
- **Signal route:** the forum poster relied on outside proof, such as a passed exam.

The shared lesson for you: don't undersell the bar jobs. Designing a 200-cover venue's menu and raising average spend by 25% are evidence of judgement.

### This week

| Action | Time | What it adds to the CV |
|---|---|---|
| Send three emails: (1) the Business School, asking whether undergraduates can use the Bloomberg Trading Simulation Laboratory for Bloomberg Market Concepts; (2) Clyde Capital, Strathclyde's student investment fund, asking to pitch a stock; (3) Green Turtle Trades, a student investment competition launched on 5 Oct across seven Scottish universities, asking whether Agricapital can enter | 1 h | Possibly a competition line: "Lead, Agricapital team, Green Turtle Trades inter-university investment competition 2026–27" |
| Write and publish one long-term investment note (about 2,000 words) on a listed company: the 5–10-year thesis, the key debate, the valuation and what would prove you wrong. Post it on LinkedIn or Substack and issue it as an Agricapital note | 9–10 h | A writing sample for Baillie Gifford and Fidelity, plus your interview stock pitch. Put the link in the CV header. Draft line: "Investment writing: '[Title]' (Oct 2026), long-term case on [Company]: [one-line thesis]" |
| Bloomberg Market Concepts, if you get terminal access | about 8 h | A modest signal: "Bloomberg Market Concepts certificate (Oct 2026)" |

**Not possible this week:**
- The CFA Research Challenge needs a university team of 3–5.
- Baillie Gifford's October events closed in September.

## 3. Banking / PE / Consulting CV

### What the firms say they want

**Investment banking:**
- **Lazard:** "Your degree does not need to be in a specific subject"; wants "a passion and flair for thinking differently and deeply about the challenge in front of you".
- **Goldman Sachs:** curiosity, drive, judgement and teamwork.
- **Houlihan Lokey:** "talent, passion, and enthusiasm" matter more than university or subject.
- **Rothschild:** a 2:1 and a wide mix of backgrounds. Evergreen is a register-your-interest pool, not an open vacancy.
- **DC Advisory:** commercial judgement and real interest in M&A; interviews test DCF and WACC.

**Private equity:**
- **ICG:** "We look for passionate, curious, and collaborative graduates who are self-motivated learners. We often see these qualities as more important than technical industry knowledge."
- **BII:** passion for impact investing, and it rates potential over experience.
- **Rede Partners:** diligence and an eye for detail.

**Economic and energy consulting:**
- **FTI:** "motivated, analytical and highly numerate".
- **Oxera:** econometrics with named tools (Excel, Stata, R or Python). Internships are a bonus. It rejects AI-written cover letters.
- **CEPA:** "Candidates must demonstrate quantitative and qualitative analytical skills and excellent written and spoken communication skills."
- **Capital Economics:** a CV plus an error-free covering letter.
- **Baringa:** curiosity, structured problem-solving and interest in energy.

**Common themes:**
- **Banks:** proof of interest in deals, then meticulousness.
- **Private equity:** motivation for the firm's specific mandate.
- **Consultancies:** applied econometrics with named tools, then clear writing.

### People who got in without internships, and how they differed

- **Banking through an off-cycle placement:** a Nomura analyst got in through a January off-cycle placement in TMT. Greenhill's London off-cycle placements feed 2027 full-time offers.
- **Banking through smaller firms:** mid-sized London banks recruit later and take more people from less-targeted universities. Cold emails to regional boutiques work better than mass online applications.
- **Private equity:** rarely straight from a degree. People get in at firms that hire on potential for a stated mandate (BII, ICG, Rede) or after a deals role elsewhere.
- **Economic consulting:** proof of skill replaces experience. CEPA: "Many of our new joiners at the economist position do have work experience, though this is not a pre-requisite."

**What differed between the sectors:**
- **Banking:** the timing and size of the firm.
- **Private equity:** fit with the firm's mandate.
- **Consulting:** econometric method counts most at Oxera and FTI; writing counts most at Capital Economics and Oxford Economics.

### This week

| Action | Time | What it adds to the CV |
|---|---|---|
| Write a deal note on SALIC's staged purchase of Olam Agri, presented at an Agricapital session | 6–8 h | See the facts and draft line below |
| A two-page note on a live regulatory decision: Ofgem's October 2026 price cap (4% rise) for Baringa, Cornwall Insight and LCP Delta, or the CMA's final vets decision for Oxera, FTI and CEPA (verify the details on GOV.UK) | 4–6 h | A writing sample in the consultancies' own subject. Draft line: "Wrote a two-page note on Ofgem's October 2026 price cap, breaking down [cost drivers] with public data" |
| The J.P. Morgan Investment Banking simulation on Forage, alongside the J.P. Morgan application only | 3–5 h | A minor plus. List it under Certifications, never under Experience |

**The facts for the SALIC deal note:**
- SALIC bought 35.43% of Olam Agri for about USD 1.24bn, completing on 23 Dec 2022. That implies USD 3.5bn of equity.
- It agreed to buy a further 44.58% in February 2025 at about USD 1.78bn, implying USD 4.0bn (3.47x book).
- Olam keeps 19.99%, with a put/call option at the closing valuation plus a 6% IRR.
- The talking point: the step-up from USD 3.5bn to USD 4.0bn works out at roughly 6% a year, the same rate as the put/call.
- Skip a DCF. SALIC is a state-backed strategic buyer, so a valuation bridge fits better.
- Draft line: "Wrote and presented a deal note on SALIC's staged acquisition of Olam Agri (2022–26), reconciling implied equity values (USD 3.5bn → USD 4.0bn), 3.5x book and the 6%-IRR put/call on Olam's 19.99% residual"

**Skip:** free "financial modelling certificates". The free tiers no longer give a certificate you can share.

## 4. General CV

### What employers say they want

- **NatWest:** "a deep sense of curiosity; analytical skills" and a 2:1.
- **Barclays:** resilience, adaptability, drive and curiosity.
- **Bank of England:** any subject, a 2:1. The 2027 intake is register-interest only for now.
- **Government Economic Service:** a 2:1 in economics and no work-experience requirement. It assesses applying economics, analysing data and communicating. Scottish Government economists are recruited through it.
- **Employer surveys:** communication (67%) and teamwork (57%) top the list. The biggest gaps employers see in graduates are self-awareness and resilience.
- **How much hiring comes from interns:**
  - Across all sectors, about half of interns get graduate jobs at the same firm (ISE: about 50% in 2022, 54% in 2024; AGR: 45%).
  - In investment banking, conversion is up to 80%.
  - So for generalist schemes (GES, Bank of England, Big Four, insurers, retail banks, energy firms), roughly half or more of graduate hires are not the firm's own interns.

### People who got in without internships, and how they differed

- **A first-person eFinancialCareers story:** missed spring weeks, failed every summer application and had no job at graduation. His careers service found him a temporary role at a small brokerage, which led to a fund internship, a contract at a bank, then a full-time banking job.
- **Fraser of Allander Institute researchers (at Strathclyde):**
  - Allison Catalano worked several years in hospitality operations before studying at Strathclyde, and now researches the labour market there. That is the closest match to your own path.
  - Others went from Strathclyde degrees to master's study and then to economist posts.
- **Wall Street Oasis advice for less-targeted UK students** *(anecdotal)*: aim at the Big Four, corporate banking, or wealth and asset management. Off-cycle roles face less competition.

**What differed between them:**
- **When they got in:** after graduating, after further study, or through off-cycle roles.
- **The way in:** a careers service and a small firm, a local research institute, or business areas less tied to internships.

The common thread: one piece of relevant work an employer could check, however small.

### This week

| Action | Time | What it adds to the CV |
|---|---|---|
| Start the Government Economic Service Fast Stream application if it has opened (check civil-service-careers.gov.uk), and register for Bank of England 2027 alerts | 1.5–2 h | No CV line, but this is the scheme that needs no work experience |
| A 700–900-word note with one chart, "Do petro-currencies move on OPEC news?", as a LinkedIn article or an Agricapital note | 5–6 h | Draft line: "Author, 'Do petro-currencies move on OPEC news?' (Oct 2026, link): event study of [currencies] around [N] OPEC decisions; written for non-specialists" |
| Email the Fraser of Allander Institute offering R/MATLAB help on a current project, linking the note | 1 h | Possibly, later: "Research Assistant, Fraser of Allander Institute: [task]" |
| Book Strathclyde employer presentations on MyCareerHub (filter "Employer Presentation") | 30 min | Contacts for the applications above |

## If you only have about 12 hours this week

1. **Applications first:** Capital Economics and BII (16 Oct), Baringa (19 Oct), Maven (20 Oct). Use the time each one needs.
2. **Quick emails (1 h, all CVs):**
   - Bloomberg lab access;
   - Clyde Capital;
   - Green Turtle Trades;
   - the Fraser of Allander Institute.
3. **OSF pre-registration of the dissertation (2 h, all CVs):** only if you haven't looked at the hold-out data. It turns "predictions fixed in advance" into something an interviewer can check.
4. **One written piece (6–8 h):** the SALIC/Olam deal note. It serves the Banking/PE CV and the Asset Management CV, and it builds on a line already on both.
5. **Next week:** the Python port (6–8 h). It helps the Quant CV most, plus Oxera, FTI and the General CV.

When any of these is done, send me the link or the result and I'll add the line to the right CVs.

## Appendix: every project bullet, original vs last round vs now

"Original" is the version before the process rewrite, "Last round" is the process rewrite and "Now" is the combined version on the CVs today. Bullets that have not changed since the original are left out.

### Quant Trading CV

**Dissertation, bullet 1**

- Original: Testing whether sovereign hedges reshape a petro-currency’s oil beta: smaller under Norway’s krone conversions (vs unhedged Canada), kinked at Russia’s budget-rule cut-off, one-sided under Mexico’s puts
- Last round: Setting predictions before running any tests: sovereign hedges should make a petro-currency’s oil beta smaller (Norway vs unhedged Canada), kinked (Russia’s budget-rule cut-off) or one-sided (Mexico’s puts)
- Now: Testing three predictions fixed in advance: sovereign hedges should reshape oil betas like options, smaller under Norway’s krone conversions, kinked at Russia’s budget-rule cut-off, one-sided under Mexico’s puts

**Dissertation, bullet 2**

- Original: Measuring each currency’s move on OPEC announcement days since 1983, with difference-in-differences around rule changes and the dollar’s own move stripped out
- Last round: Isolating the hedge’s effect: each currency’s move on OPEC announcement days since 1983, net of the dollar’s own move, compared across hedging regimes and against unhedged Canada
- Now: Measuring each currency’s move on OPEC announcement days since 1983, net of the dollar’s own move, with unhedged Canada as a control and difference-in-differences around Russia’s rule changes

**Plains Heat and the KC-Chicago Wheat Spread, bullet 1**

- Original: Tested whether Plains heatwaves move Kansas City wheat futures against Chicago, using 27 summers of NOAA weather data and the off-season as a placebo: heat explained 0.3% of weekly moves
- Last round: Designed the spread test so shared wheat news cancels, matched weather to prices with no look-ahead and used the off-season as a placebo: Plains heat explained 0.3% of weekly KC–Chicago moves
- Now: Tested whether Plains heatwaves move Kansas City wheat against Chicago, using the spread so shared news cancels, 27 summers of NOAA data and the off-season as a placebo: heat explained 0.3% of weekly moves

**Plains Heat and the KC-Chicago Wheat Spread, bullet 2**

- Original: Found a one-day timestamp error in the price data that would have faked a lead-lag signal; with it fixed, a trading rule set in advance showed no edge out of sample (2010–23)
- Last round: Traced a too-good lead-lag signal (0.74 correlation with Chicago’s previous day, 0.25 same day) to a one-day timestamp error; with it fixed, a rule set in advance had no edge out of sample
- Now: Distrusted a too-good lead-lag signal (0.74 correlation with Chicago’s previous day, 0.25 same day) and traced it to a one-day timestamp error; with it fixed, a rule set in advance had no edge out of sample (2010–23)

**Delta-Hedging Simulator, bullet 1**

- Original: Simulated delta-hedging a short call on 50,000 paths: hedging four times as often halved the hedging error, and 0.1–0.5% trading costs moved the best frequency from daily to weekly
- Last round: Checked the simulator against theory before using it (hedging error should fall as 1/√N: fitted slope −0.48 vs −0.5), then found 0.1–0.5% trading costs push the best frequency from daily to weekly
- Now: Simulated delta-hedging a short call on 50,000 paths, first checking it against theory (hedging four times as often halved the error, as 1/√N predicts), then found 0.1–0.5% costs push the best frequency from daily to weekly

**Delta-Hedging Simulator, bullet 2**

- Original: Tested a no-trade band around delta instead of a fixed timetable: on fresh paths the best band cut RMS P&L by 6% vs the best timetable at 0.1% costs, and by 2% at 0.5%
- Last round: Reasoned that a timetable trades even when the hedge has barely drifted, so tested a no-trade band around delta, chosen on one set of paths and judged on fresh ones: 6% less RMS P&L at 0.1% costs, 2% at 0.5%
- Now: Reasoned that a timetable wastes trades when the hedge has barely drifted, so tested a no-trade band around delta: on fresh paths the best band cut RMS P&L by 6% vs the best timetable at 0.1% costs, and 2% at 0.5%

**Monte Carlo Option Pricing Engine, bullet 1**

- Original: Priced an arithmetic Asian call by Monte Carlo, validated against two closed-form prices; a geometric-Asian control variate cut the variance 1,276-fold (97% off the standard error)
- Last round: Validated the pricer against two closed-form prices first, then picked a geometric-Asian control variate because its payoff tracks the arithmetic one (ρ = 0.9996): variance fell 1,276-fold
- Now: Priced an arithmetic Asian call by Monte Carlo, validated against two closed-form prices; chose a geometric-Asian control variate because the two payoffs move together (ρ = 0.9996), cutting the variance 1,276-fold

**Monte Carlo Option Pricing Engine, bullet 2**

- Original: Mapped where the control variate weakens over 8 volatilities and 6 strikes: at the money its gain falls from 4,569x to 71x as volatility rises from 10% to 80%, and to 52x at worst out of the money
- Last round: Mapped where the control variate weakens over 8 volatilities and 6 strikes and why: its gain falls roughly as 1/σ², from 4,569x to 71x at the money as volatility rises from 10% to 80%
- Now: Mapped where the control variate weakens over 8 volatilities and 6 strikes, and why: at the money its gain falls roughly as 1/σ², from 4,569x to 71x as volatility rises from 10% to 80%, and to 52x at worst out of the money

**Empirical CAPM Test, bullet 1**

- Original: Tested the CAPM on 694 anomaly portfolios in 54 countries (JKP data): alpha significant in 31% at 5%, over six times the rate expected by chance; GRS rejected in 48 of 53 countries
- Last round: Tested the CAPM on 694 anomaly portfolios in 54 countries (JKP data): 215 alphas were significant at 5%, but about 35 would pass by luck alone, so a raw count overstates the evidence
- Now: Tested the CAPM on 694 anomaly portfolios in 54 countries (JKP data): 215 alphas (31%) were significant at 5%, over six times the 35 luck alone would produce; GRS rejected it in 48 of 53 countries

**Empirical CAPM Test, bullet 2**

- Original: Corrected for running 694 tests at once: 123 of the 215 significant alphas survive Benjamini-Hochberg and 84 clear |t| > 3; momentum holds up best, while size’s hits are no more than luck predicts
- Last round: Applied stricter rules (Benjamini-Hochberg, |t| > 3, Bonferroni): 123, 84 and 22 survive, nearly all positive where flukes would split by sign; momentum holds up best, size looks like luck
- Now: Corrected for running 694 tests at once: 123 survive Benjamini-Hochberg, 84 clear |t| > 3 and 22 Bonferroni, nearly all positive where flukes would split by sign; momentum holds up best, size looks like luck


### Asset Management Research CV

**Empirical CAPM Test, bullet 2**

- Original: Showed momentum (35 of 54 countries) and value (28 of 54) earn the most persistent alphas and size almost none (5 of 54); 123 of 215 significant alphas survive a multiple-testing correction
- Last round: Asked how many alphas luck alone would produce (about 35 of 694 at 5%) before trusting any: 123 of 215 survive a multiple-testing correction, led by momentum and value, while size looks like luck
- Now: Asked how many alphas luck alone would produce (about 35 of 694) before trusting any: 123 of 215 survive a multiple-testing correction, led by momentum (35 of 54 countries) and value, while size looks like luck

**Wheat calendar-spread strategy, bullet 2**

- Original: Built a wheat calendar-spread strategy in R from futures curve structure and CFTC positioning (weekly backtest: Sharpe 0.76 before costs, 0.28 after, maximum drawdown 3.1%); published weekly notes for members
- Last round: Built a wheat calendar-spread strategy in R from curve structure and CFTC positioning and judged it after costs: Sharpe 0.76 before, 0.28 after, showing how quickly turnover erodes an edge
- Now: Built a wheat calendar-spread strategy in R from futures curve structure and CFTC positioning and judged it after costs: Sharpe 0.76 before, 0.28 after (maximum drawdown 3.1%), so turnover erodes an edge fast


### Banking/PE/Consulting CV

**Dissertation, bullet 2**

- Original: Building an original dataset from Norges Bank and the Russian and Mexican finance ministries, and testing it with event studies and difference-in-differences around each rule change
- Last round: Breaking the question into one testable prediction per country and building an original dataset from Norges Bank and Russian and Mexican finance ministry records to test each
- Now: Breaking the question into one testable prediction per country, using an original dataset from Norges Bank and the Russian and Mexican finance ministries, event studies and difference-in-differences

**FX Risk Management, bullet 1**

- Original: Assessed how six multinationals, including Toyota, Nestlé, NVIDIA and Reliance Industries, are exposed to currency risk through revenues and costs, and how each one manages it
- Last round: Mapped six multinationals’ currency exposure through revenues and costs, then compared how each manages it, from Toyota and Nestlé to NVIDIA and Reliance Industries
- Now: Mapped how six multinationals, including Toyota, Nestlé, NVIDIA and Reliance Industries, are exposed to currency risk through revenues and costs, then compared how each one manages it

**Empirical CAPM Test, bullet 1**

- Original: Tested whether the CAPM explains returns on 694 anomaly portfolios across 54 countries: it failed for 31% of portfolios individually and jointly in 48 of 53 countries, with momentum and value the most persistent
- Last round: Tested whether the CAPM explains returns on 694 anomaly portfolios across 54 countries, then corrected for running so many tests: 123 of 215 apparent anomalies survive, led by momentum and value
- Now: Tested the CAPM on 694 anomaly portfolios across 54 countries: it fails jointly in 48 of 53, and 123 of 215 apparent anomalies survive a correction for running so many tests, led by momentum and value


### General CV

**Dissertation, bullet 2**

- Original: Building an original dataset from Norges Bank and the Russian and Mexican finance ministries, and testing it with event studies and difference-in-differences around each rule change
- Last round: Building an original dataset from Norges Bank and the Russian and Mexican finance ministries, then testing each country’s prediction with event studies and comparisons across hedging regimes
- Now: Building an original dataset from Norges Bank and the Russian and Mexican finance ministries, then testing each country’s prediction with event studies and difference-in-differences around Russia’s rule changes

**Empirical CAPM Test, bullet 1**

- Original: Tested whether the CAPM explains returns on 694 anomaly portfolios across 54 countries: it failed for 31% of portfolios individually and jointly in 48 of 53 countries, with momentum and value the most persistent
- Last round: Tested whether the CAPM explains returns on 694 anomaly portfolios across 54 countries, then corrected for running so many tests: 123 of 215 apparent anomalies survive, led by momentum and value
- Now: Tested the CAPM on 694 anomaly portfolios across 54 countries: it fails jointly in 48 of 53, and 123 of 215 apparent anomalies survive a correction for running so many tests, led by momentum and value

**Corn-Soybean Cointegration, bullet 1**

- Original: Found corn and soybean prices cointegrated (quarterly, 1990–2022; Engle-Granger and Johansen tests); in the error-correction model both prices adjust back to equilibrium (soybean coefficient −0.29, p < 0.001)
- Last round: Tested whether corn and soybean prices share a long-run equilibrium (quarterly, 1990–2022) using both Engle-Granger and Johansen, then estimated how fast each adjusts back (soybean −0.29, p < 0.001)
- Now: Found corn and soybean prices share a long-run equilibrium (quarterly, 1990–2022) with both Engle-Granger and Johansen tests, and estimated how fast each adjusts back (soybean −0.29, p < 0.001)

**Wheat calendar-spread strategy, bullet 2**

- Original: Built a wheat calendar-spread strategy in R from futures curve structure and CFTC managed-money positioning; weekly backtest (Apr 2025 – Oct 2026): Sharpe 0.76 before costs and 0.28 after, maximum drawdown 3.1%
- Last round: Built a wheat calendar-spread strategy in R from curve structure and CFTC positioning and judged it after costs: Sharpe 0.76 before, 0.28 after, showing how quickly turnover erodes an edge
- Now: Built a wheat calendar-spread strategy in R from futures curve structure and CFTC positioning and judged it after costs: Sharpe 0.76 before, 0.28 after (maximum drawdown 3.1%), so turnover erodes an edge fast

## Sources

**Quant Trading**
- Jane Street, Quantitative Trader: https://www.janestreet.com/join-jane-street/position/8070482002
- Optiver, Graduate Trader: https://optiver.com/working-at-optiver/career-opportunities/6642746002/
- Optiver, Career Kickstarter (Trading): https://www.optiver.com/join-us/jobs/trading/amsterdam/career-kickstarter-trading-2027/
- Optiver, The Trading Floor: https://www.optiver.com/join-us/jobs/trading/amsterdam/institutional-trading-the-trading-floor/
- SIG graduate trader: https://gradireland.com/jobs/quantitative-trader-graduate-234661
- SIG game theory: https://sig.com/quantitative-trading/game-theory/
- SIG interview guide: https://www.techinterview.org/companies/sig-susquehanna-interview-guide/
- IMC: https://job-boards.eu.greenhouse.io/imc/jobs/4751729101
- Maven Securities: https://job-boards.greenhouse.io/mavensecuritiesholdingltd/jobs/8048591
- 3Red Partners: https://job-boards.greenhouse.io/3redpartners/jobs/5597626002
- Old Mission: https://www.tradinginterview.com/company/old-mission-capital/job/quantitative-trader-2027-graduate-program-august-start-2/
- Capula: https://apply.workable.com/capula-investment-management-ltd/jobs/view/A15A62A8BE.md
- Macquarie: https://www.macquarie.com/uk/about/careers/graduate
- Poker player to prop trading (anecdotal): https://www.wallstreetoasis.com/forum/private-equity/from-professional-poker-player-to-prop-trading-to-self-employed-trader-to-mba
- Chess player to Tradelink: https://www.institutionalinvestor.com/article/2cihep5u4cofv2kqnbf28/ria-intel/from-chess-master-to-day-trader-to-financial-advisor
- IMC graduate trader profile: https://prosple.com/on-the-job/day-in-the-life-of-a-graduate-trader-at-imc
- QuantNet thread on unusual backgrounds: https://quantnet.com/threads/unique-background-advice.57173/post-332207
- Jane Street puzzles: https://www.janestreet.com/puzzles/
- Zetamac practice: https://quantvault.org/zetamac-practice.html
- OSF registries: https://osf.io/registries
- IMC Prosperity: https://prosperity.imc.com

**Asset Management Research**
- Baillie Gifford, what we look for: https://www.bailliegifford.com/en/uk/individual-investors/careers/early-careers/graduate-programmes/investment-research/what-do-we-look-for/
- TARGETjobs on Baillie Gifford: https://targetjobs.co.uk/careers-advice/accountancy-banking-and-finance/skills-needed-investment-management-career-baillie-gifford
- Baillie Gifford graduate profiles:
  - Nathan Hill: https://bailliegifford.com/en/global/all-users/careers/early-careers/graduate-programmes/investment-research/meet-our-people/nathan-hill
  - Vittorio Lavioso: https://bailliegifford.com/en/global/all-users/careers/early-careers/graduate-programmes/investment-research/meet-our-people/vittorio-lavioso
  - Jamila Osman: https://targetjobs.co.uk/organisations/baillie-gifford-co/meet-investment-research-team-jamila
- Fidelity International, equity research: https://careers.fidelityinternational.com/early-careers-overview/graduates-and-postgraduates/equity-research
- Janus Henderson, Research Associate: https://jobs.janushenderson.com/job/London-Research-Associate-Investment-Graduate-Programme-2027-EC2M-3AE/1432364300/
- Point72 Academy: https://point72.com/blog/from-classroom-to-career-nikkei-spotlights-point72s-academy-program/
- Kiltearn careers: https://www.kiltearnpartners.com/careers
- Green Turtle Trades launch: https://www.deadlinenews.co.uk/2026/10/05/student-led-investment-competition-launches-across-seven-scottish-universities/
- Clyde Capital Fund: https://uk.linkedin.com/company/clyde-capital-fund
- CFA UK on presenting a stock idea: https://www.cfauk.org/events/how-to-present-a-stock-idea-effectively-sharpen-your-research-analysis-skills-pathway
- Bloomberg Market Concepts: https://blogs.cranfield.ac.uk/is/bmc

**Banking / PE / Consulting**
- Lazard recruitment FAQs: https://www.lazard.com/about-lazard/locations/united-kingdom/careers-in-the-united-kingdom/2026-lazard-london-recruitment-process-faqs/
- Houlihan Lokey early careers: https://hl.com/careers/early-careers/
- Rothschild & Co Evergreen: https://www.rothschildandco.com/en/careers/students-and-graduates/opportunities/evergreen-2027-global-advisory-graduate-programme-london/
- ICG early careers: https://www.icgam.com/people-and-careers/careers/early-careers/
- BII graduate programme: https://www.bii.co.uk/en/careers/investment-and-impact-graduate-analyst-programme/
- Oxera Graduate Analyst: https://careers.oxera.com/jobs/6635564-graduate-analyst-analytics
- FTI Consulting graduate scheme: https://targetjobs.co.uk/jobs/2027-graduate-scheme-economic-financial-consulting-248393
- CEPA economists: https://www.cepa.co.uk/careers/economists
- Capital Economics graduate recruitment: https://www.capitaleconomics.com/graduate-recruitment
- Nomura off-cycle profile: https://www.efinancialcareers.com/news/2017/07/investment-banking-analyst
- eFinancialCareers on junior IB jobs in 2026: https://www.efinancialcareers.com/news/junior-investment-banking-job-2026
- Olam Group on the SALIC deal:
  - first stake: https://www.olamgroup.com/news/all-news/press-release/olam-group-completes-sale-of-substantial-minority-stake-in-olam-agri-to-salic.html
  - second stake: https://www.olamgroup.com/news/all-news/press-release/olam-group-announces-completion-of-44-point-58-stake-sale-in-olam-agri-to-salic.html
- Ofgem price cap, October 2026: https://www.ofgem.gov.uk/press-release/energy-price-cap-will-rise-4-october-2026
- Forage on a CV: https://career.arizona.edu/blog/2025/04/28/how-to-add-a-forage-job-simulation-to-your-resume-linkedin/

**General**
- NatWest graduate trainee: https://www.brightnetwork.co.uk/graduate-jobs/natwest-group/graduate-trainee-commercial-banking-relationship-management-2027-anfc
- Bank of England graduate programme: https://www.bankofengland.co.uk/careers/future-talent/graduate-programme
- GES Fast Stream: https://www.civil-service-careers.gov.uk/fast-stream/fs-all-schemes/fs-government-economics-service-scheme/
- Scottish Government economists: https://www.gov.scot/publications/economist-careers-in-the-scottish-government/
- London Economics on graduate skills: https://londoneconomics.co.uk/blog/publication/what-employers-want-the-future-of-graduate-skills-and-recruitment-september-2025/
- ISE Student Recruitment Survey 2025: https://ise.org.uk/knowledge/research/491/ise_student_recruitment_survey_2025
- No internships to a banking job (eFinancialCareers): https://www.efinancialcareers.co.uk/news/how-i-got-a-top-banking-job-without-any-internships
- Fraser of Allander Institute team: https://fraserofallander.org/our-team/
- Fraser of Allander Institute, work with us: https://fraserofallander.org/work-with-us/
- Strathclyde careers events: https://www.strath.ac.uk/professionalservices/careers/events/
