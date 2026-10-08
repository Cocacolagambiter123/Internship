# Prompt: "Who Hedges the Barrel?" dissertation, career and master's war room

**How to use:** start a new session on Opus 5.5 with Ultracode. Attach this file and the four files listed in section 4, then send the kick-off message.

---

## 0. Your role

You are the lead orchestrator of a team of agents working for me, Will McGowan. Don't aim for a fast answer. Run the best research-and-review pipeline you can, manage it actively while it runs, and give me a result I can act on. You decide the final shape of the team. The roster in section 7 is my starting proposal, not a fixed plan. Use whatever parallel or sub-agent tools this environment gives you, plus web search, scholarly search and code execution where you have them.

## 1. Who I am

- Final-year (fourth-year) student at the University of Strathclyde, Glasgow, graduating June 2027. Degree: **BA Economics and Finance, with honours in Economics.** My CV wrongly says "BA (Hons) Economics"; use the correct title everywhere and fix it in the CV updates.
- Average grade so far is a 2:1, including 90% in first-year Finance. Relevant modules: Applied Econometrics, Treasury Management and Derivatives, Advanced Microeconomics. A-levels: Mathematics A, Economics A, Computer Science B.
- Tools: MATLAB, R, Excel, Git. No Python yet.
- CV projects:
  - Plains heatwaves and the KC-Chicago wheat spread (R). I traced a too-good lead-lag signal to a one-day timestamp error; once it was fixed, the rule had no edge out of sample.
  - A delta-hedging simulator (MATLAB).
  - A Monte Carlo Asian option pricer with a control variate.
  - An empirical CAPM test on 694 anomaly portfolios in 54 countries, with Benjamini-Hochberg and Bonferroni corrections.
- No finance internships. Work: bartender and mixologist. Leadership: co-founder and treasurer of the Strathclyde Agricapital Society, and president of the Strathclyde Poker Society (where I taught Kelly sizing). Chess: 14th at the 2023 Irish U19 Championships. Powerlifting: Northern Ireland U19 champion.
- **I have no internships, so my dissertation is the main substantive thing an interviewer or admissions reader will probe. It has to carry that weight.**

## 2. The prize: what winning means

1. **Primary goal: a quant role** (trading, research or a route into either) **or a role at a hedge fund.**
2. **The dissertation should get a mark in the 90s and the department's prize for best dissertation of the year.** My supervisor, Dr Luigi Gifuni, has told me that a mark in the 90s or the best in the year needs an **original and interesting** topic.
3. **One option: a master's at a top-10 university.** I haven't decided where or which degree. It depends partly on how my job applications go.

These goals can conflict. For example, a trading-rule section that impresses a quant interviewer may use words an economics examiner would rather see spent on identification. When they conflict, show me the trade-off and recommend an option. Don't pick silently. If you have to default, the career goal ranks first, but never at the cost of the dissertation's quality as economics, because the mark and the prize are career signals in their own right.

## 3. Hard constraints

- **It must be an economics dissertation**, marked by the economics department. The research question must be an economics question: a mechanism, an institution, a policy, international or macroeconomics. Market data and financial methods can be the measuring instrument, but they must not be the point. Every agent must flag anything an economics marker would read as a finance dissertation in disguise.
- **The limit is 8,000 words.** The earlier plan budgeted **10,000** words for three country cases, a cross-section and a trading test. That will not fit. Narrow the scope or go deeper on less; don't squeeze. Find out from Strathclyde's rules what counts towards the limit (abstract, tables, footnotes, appendices, references).
- **I must be able to get the data**, either free and public or through Strathclyde (library databases, and any Bloomberg, LSEG Workspace/Datastream, WRDS or similar access the university actually provides). Verify this; don't assume it. Mark anything you couldn't check as unverified.
- **Supervisor: Dr Luigi Gifuni.** He works in macroeconomics: oil and gas price shocks, uncertainty effects, cross-country spillovers, how institutions respond to commodity price projections, and text data for oil forecasting. His brief is in Appendix A and his research page is https://sites.google.com/view/luigigifuni/research. The dissertation has to relate to him so that he can give me the best possible advice in our meetings.
- **MATLAB** is the main tool; R is acceptable.
- **Deadline:** sometime in 2027. Ask me for the exact date. If I don't know it, find it or state your assumption.

## 4. Attached inputs

- `Will_McGowan_CV_Quant_Trading.pdf`
- `Dissertation_Ideas_Start_Here.md`: a one-page summary of an earlier session that produced 5 options plus extra ideas
- `Dissertation_Ideas_Ranked_and_Extended.md`: rankings, idea J in full, a draft email to Dr Gifuni, a marking-criteria map and sources
- `Dissertation_Ideas_Full_Detail.md`: the full working draft, with J's data list, method, week-1 check and fallbacks

Read the J sections first. Treat everything in these files as claims to check, not as facts. The earlier session couldn't open most data websites, and its "judges" were model personas, not people. Don't reuse its scores as evidence.

## 5. My chosen topic and what is already known about it

**J. "Who Hedges the Barrel? Sovereign Oil Hedging and Petro-Currency Reactions to OPEC News."** The question: on OPEC announcement days, measured with Känzig's oil supply news surprises (and Degasperi's "clean" series as a check), does a petro-currency's oil beta shrink, kink or turn one-sided when its government hedges the country's oil exposure? The three cases:

- Norway's pre-announced krone conversions for the oil fund, compared with unhedged Canada.
- Russia's 2017-2022 budget rule, which bought foreign currency only when oil was above a cut-off price.
- Mexico's annual put-option hedge.

The plan ends with a pre-registered tradability test using a White reality check and Kelly sizing. My CV already describes the dissertation this way.

**Weaknesses already identified.** Don't just rediscover these. Either solve each one or tell me it is fatal:

- The plan was built for 10,000 words, with three country cases, a cross-section and a trading test. It is over-scoped for 8,000.
- The dollar itself moves on OPEC days, so betas measured against USD partly measure the dollar.
- Few OPEC days fall inside the regime windows: perhaps 40-60 under Russia's rule and about 10 in the 2020 sales window. Statistical power is probably low.
- The rouble is confounded by sanctions (2014, 2018, 2022) and by COVID, and the cut-off price was crossed only in 2020.
- Mexico is only a marginal net oil exporter, and its hedge volumes have been undisclosed since 2017.
- Norges Bank's flows are pre-announced, partly forecastable and small relative to turnover.
- Daily windows mix OPEC news with other news.
- Supervisor fit is only moderate. There is no text component, FX is not Dr Gifuni's field, and the fit with his topic 3 has to be argued.
- The trading rule and Kelly sizing may read as finance to an economics marker.
- Several data claims were never verified:
  - when the Norges Bank monthly table starts;
  - where the Russian MinFin announcements are archived;
  - the Mexican hedge (SHCP) details;
  - whether Rüth et al. (2026), "When OPEC Speaks", already covers fiscal mechanisms.
- **The economic channel is untested.** Is it plausible at all that each institution changes how its currency reacts on OPEC days, through order flow, expectations or the fiscal position? If the channel is weak, the prediction is weak.

## 6. How to run this: the orchestration protocol

### 6.1 Phase 0: think hard before spawning anything

Before you spawn a single agent, think carefully about the team and write the plan to `pipeline/00_plan.md`:

1. Re-read all the inputs. Turn section 10 into a requirements matrix, which you will check at the end.
2. For every proposed agent, write down:
   - the question only it answers;
   - its inputs, outputs and dependencies;
   - whether another agent already covers it.

   Then merge, split, drop or add agents before starting.
3. **Choose the number of agents deliberately.** Too few and the lenses blur together; too many and you get duplicated searches and noise. Justify the final count in a few lines, and justify each agent's task.
4. **Facts come before opinions.** Research and verification agents run first, in parallel where they are independent. Reviewers then judge a design built on verified facts, not on the old documents' unverified claims.
5. Every lens marked ★ in section 7 is one I asked for by name, and each must survive in some form. You may merge two ★ lenses into one agent only if that agent reports on each lens separately.

### 6.2 Run the pipeline actively: you are expected to change it

**You are explicitly instructed to evaluate the pipeline on the fly while it runs: delete sub-optimal agents, rewrite their tasks, and spawn brand-new agents whenever you calculate that an extra step is needed to secure the prize.** Run a checkpoint after every phase, and also whenever an agent returns something surprising. At each checkpoint:

1. **Score every returned output** on four things: the new information it added, the quality of its evidence, its relevance to the prize, and how much it overlaps with other agents.
2. **Delete** any agent whose work proves redundant, low-value or off-target. Don't keep agents for completeness.
3. **Rewrite and re-run** an agent's task when its output shows the brief was wrong, too broad, too narrow or aimed at the wrong question.
4. **Spawn new agents** whenever an extra step would materially raise the odds of winning. Triggers include, but are not limited to:
   - a load-bearing factual claim that is still unverified;
   - two reviewers disagreeing about something that would change the recommendation;
   - a data source that turns out to be unavailable, shorter or different from what was assumed;
   - a power check showing that a test cannot detect plausible effects;
   - a competitive alternative topic or variant of J;
   - a gap in the requirements matrix;
   - a question from a reviewer that nobody on the team can answer.
5. **Log every change** in `pipeline/changelog.md`: what changed, why, and what you expect it to add. The final report summarises this log.

There is no fixed cap on agents or rounds. The rule is expected value. Spawn an agent when the extra step is likely to change or strengthen a recommendation, and stop when another round would only restate what you already have. Don't stop early to save effort.

### 6.3 Iterate the design until it holds

After the review panel, the architect (D1) revises the design. Re-run the reviewers whose objections were blocking, plus any whose verdict depends on the change. Keep going until either:

- no reviewer has a blocking objection that can be fixed within the constraints, or
- the remaining objections are genuine trade-offs that you can explain to me.

## 7. Starting roster (my proposal; change it per section 6)

★ = a lens I asked for by name.

### Phase 1: research and verification (run in parallel)

**R1. Data and access verifier.**
- Open and check every dataset J needs:
  - Känzig's oil supply news surprises: the latest vintage, the number of daily OPEC events and the date range.
  - Degasperi's OPEC surprises.
  - Daily FX: FRED H.10, ECB reference rates (RUB until March 2022), the Bank of Russia and Banxico.
  - Norges Bank's "FX transactions on behalf of the government": when the monthly table starts and what format it is in.
  - Russian MinFin fiscal-rule announcements for 2017-2022: where they are archived and how many there are.
  - Mexico's SHCP hedge details by year.
  - Net oil exports as a share of GDP.
  - Brent, WTI, VIX and the S&P 500.
- Find out what Strathclyde gives students in practice: the library's A-Z database list, and any business-school trading or financial-markets lab. Check whether it offers intraday FX or OPEC announcement timestamps that would tighten the event windows, and check free intraday sources and their terms.
- **Output:** a table with one row per dataset: source, URL, access route, coverage, frequency, verified (Y/N, and how), licence and gotchas. Also count the OPEC days in every regime window, and name a substitute for anything that fails.

**R2. Literature and originality scout.**
- Find the closest existing work, prioritising 2023-2026. Read Rüth, Oruc, Van der Veken and Zhang (2026), "When OPEC Speaks", in full if it is available.
- Also cover:
  - the commodity-currency literature (for example Chen and Rogoff 2003; Ferraro, Rogoff and Rossi 2015);
  - Känzig (2021);
  - work on fiscal rules, sovereign wealth funds and oil hedging and their links to exchange rates;
  - country studies of Norway, Russia's fiscal rule and Mexico's hedge.
- Search Google Scholar, SSRN, RePEc, NBER, CEPR, central-bank working papers and any scholarly search tool you have.
- **Output:** the 10-15 closest papers, with what each does and does not do; what would make J unoriginal; and one precise sentence stating the gap.

**R3. Institutions fact-checker.**
- Build a dated regime ledger for each case:
  - **Norway:** the fiscal rule (including the 2017 change from 4% to 3%), how petroleum revenue flows to the GPFG, and how Norges Bank sets and announces its monthly FX amounts. Note when the direction flips and how forecastable the amounts are.
  - **Russia:** the 2017 rule and its cut-off price and indexation, how purchases were executed, any suspensions or deferrals (for example in 2018; verify), the 2020 sales, the January 2022 suspension, and the later rule.
  - **Mexico:** how the Hacienda hedge actually works, what it protects (the budget, the currency, or both), its disclosure history and any recent changes.
- For each case, assess the **economic transmission channel** and re-derive the predicted "payoff shape" from the real rules, not from the old documents.
- Scan for other institutions that might give cleaner contrasts, such as other oil funds, fiscal rules or hedging programmes.
- **Output:** the ledger, an assessment of each channel, and anything that contradicts the earlier documents.

**R4. Strathclyde rules and marking researcher.**
- Find, from public pages:
  - the economics honours dissertation regulations: the word-limit rules and the submission date;
  - the grade descriptors, especially what 80+ and 90+ require;
  - how second marking and external examining work;
  - the name and criteria of the best-dissertation prize, and past winners if they are published.
- Where something isn't public, tell me exactly what to ask the department and Dr Gifuni.

**R5. ★ Career pathways researcher: how students like me broke in.**
- How did people like me get into each of these? "Like me" means: a UK non-target or semi-target university such as Strathclyde, an economics or economics-and-finance degree, a 2:1, no internships.
  - (a) quant trading at prop firms and market makers;
  - (b) quant research at systematic funds;
  - (c) analyst roles at hedge funds: macro, multi-manager pods, commodities;
  - (d) side doors that lead there: bank strats and quant analyst roles, macro research, commodity trading houses, quant or data roles at asset managers.
- **Sources:** LinkedIn profiles of alumni from Strathclyde and similar universities; firms' graduate pages; r/quant, r/FinancialCareers, Wall Street Oasis, QuantNet, eFinancialCareers and The Student Room; interview write-ups. Separate anecdote from base rates and watch for survivorship bias.
- **Answer directly:**
  - How much does the dissertation matter in hiring, and for which roles? Compare it with online assessments, mental maths and probability interviews, coding (Python), and a master's degree.
  - What do candidates with no internships put in its place?
  - What will interviewers probe on my CV? For example, the Kelly sizing, the multiple-testing CAPM work and the timestamp-bug story.
- **Test my belief:** *"The dissertation doesn't need to be heavily finance-based, because economics is more quantitative and that's what most quant and hedge fund firms are looking for."* Tell me, with evidence, where this is right and where it is wrong.
- **Timing:** use today's date to work out which 2027 graduate intakes are still open, whether firms let master's-bound students apply for summer 2027 internships, what off-cycle roles exist, and what options there are in London, Edinburgh and Glasgow. Produce a dated action list for the next 12 weeks.

**R6. ★ Master's pathways researcher.**
- Which master's degrees can I realistically get into with a BA in Economics and Finance (honours in Economics), my grades, A-level maths and my modules? What extra maths would I need (multivariable calculus, linear algebra, probability, real analysis, programming)?
- Treat "top 10" as both the UK top 10 and the global top 10 for the relevant subject. More importantly, cover each programme's reputation with quant and hedge-fund employers.
- Cover these degree families:
  1. economics and econometrics (MSc or MPhil);
  2. finance and financial economics;
  3. quant finance, financial mathematics, financial engineering and MFEs;
  4. statistics, data science, machine learning and CS conversion degrees.
- For each programme on the shortlist, record:
  - the entry requirements, including maths prerequisites, and whether I meet them;
  - evidence of placement into quant and hedge-fund roles (employment reports, LinkedIn);
  - cost, funding and length;
  - **application deadlines for September 2027 entry** (many fall now or soon);
  - GRE/GMAT requirements and references;
  - what the personal statement should say about the dissertation.
- How did students like me get in? Use GradCafe, The Student Room, forums and LinkedIn, with base rates where they exist.
- **Output:**
  - which type of degree best serves a quant or hedge-fund career from my background;
  - a reach/target/safe shortlist;
  - an action plan for the next 4-8 weeks, such as maths courses to take and tests to book.

### Phase 1b (needs R1 and R3)

**R7. Power and feasibility simulator.**
- Run the week-1 scouting regression on real data: daily NOK and CAD changes on the Känzig surprise, 2000-2019, against both USD and EUR.
- Count the events available for each mechanism test: the Norway flow interaction, the Russian regime difference-in-differences, the Mexican asymmetry, and any test D1 adds.
- Simulate statistical power for each test at plausible effect sizes.
- Save the scripts and results under `scouting/`, clearly labelled.
- **Output:** which tests are adequately powered and which are not. For each test that isn't, say what would rescue it: a longer sample, two-day windows, intraday data, pooling, or a different contrast.

### Phase 2: design

**D1. Dissertation architect.**
- From the Phase 1 outputs, build "J v2": the strongest 8,000-word economics version of the topic. It must include:
  - a one-sentence question, and why it matters for economics;
  - pre-registered hypotheses with predicted signs;
  - a data table showing what is verified;
  - the identification strategy and its threats;
  - what stays in, what is cut and what moves to an appendix;
  - a chapter word budget that sums to no more than the real limit;
  - the single figure that carries the argument;
  - a week-1 check, fallbacks if results are null, and a risk register with kill criteria;
  - a dated timeline to the deadline that front-loads results I can talk about in interviews and personal statements **this autumn**.
- Decide these explicitly:
  - Three countries, or depth on one or two?
  - Keep, shrink or cut the trading and Kelly section?
  - Should the design add a small element aligned with Dr Gifuni's interests (uncertainty, spillovers, real-economy effects, text)? Only if it raises the mark and supervisor fit without bloating the dissertation.
- Offer one or two variants only if they are genuinely different bets. Examples: a deep NOK-versus-CAD design, or a macro-insulation version that asks whether these institutions also dampen the real economy's response to oil news. Recommend one.

**D2. ★ Challenger: tell me if a different dissertation would serve my goals better.**
- Try to beat J v2. Consider:
  - (a) variants and pivots of J;
  - (b) the earlier runners-up (K, A, F, G, E and the reserves);
  - (c) genuinely new ideas.
- Every candidate must be:
  - economics;
  - supervisable by Dr Gifuni (inside or next to his brief);
  - feasible with verified data;
  - doable in 8,000 words by the deadline.
- Score each candidate on the same rubric as J v2. Escalate an alternative to the panel only if it plausibly beats J v2 on the prize as defined in section 2. If nothing does, say so plainly; that is a valid result. Build on the earlier session rather than repeating it.

### Phase 3: the review panel (parallel; each reviews J v2 and any escalated alternative)

**P1a. ★ Quant interviewer: quant research.** Think of systematic funds such as Two Sigma, G-Research, Man AHL, AQR, Citadel GQS, Squarepoint and Qube. Probe overfitting, look-ahead bias, data snooping, multiple testing, out-of-sample discipline, statistical power and reproducibility. Would this dissertation get me to the next round? Which five questions would you ask about it, and what answers separate a hire from a reject?

**P1b. ★ Quant interviewer: quant trading.** Think of market makers and prop firms such as Jane Street, Optiver, SIG, IMC, Citadel Securities, XTX and Flow Traders. Here the dissertation is probably a 5-10 minute talking point. What does it reveal about my expected-value thinking, sizing, speed and intuition? How should I talk about it? Is the tradability and Kelly section an asset or a liability?

(I asked for one quant interviewer; I've split it because research and trading interviews test different things. Merge them back if their outputs converge.)

**P2. ★ Hedge fund interviewer.** Think of analyst hiring for macro, multi-manager and commodities teams, for example at Brevan Howard, Millennium, Citadel GFI, Balyasny, Rokos and Point72. Is this candidate a macro thinker? Does the dissertation produce a view? Ask me for a trade idea drawn from the research. Would you want me in your pod?

**P3. ★ Portfolio manager at a top firm.** Take the view of an FX, rates or commodities macro PM. Would this research change how you trade NOK, CAD or MXN around OPEC meetings? Which parts of the intuition are sharp and which are naive? How would you test the analyst who wrote it?

**P4. ★ Founder/CEO lens, Ken Griffin-style.** Ground this in the public interviews and statements of Ken Griffin and other founders (for example Jim Simons, Ray Dalio, Izzy Englander, and David Siegel and John Overdeck). Is this person exceptional? What signals ambition, intellectual horsepower, competitiveness and ownership? What would make my application stand out in a pile of 10,000? This is a simulated perspective: label it as one and invent no quotes.

**P5. ★ Dr Luigi Gifuni lens (my supervisor).**
- Ground this in his public record:
  - his research page;
  - "Whispers in the oil market" (IJF, 2026);
  - his Brexit spillover event study;
  - "Oil shocks under model uncertainty";
  - "MF-VAR vs MIDAS";
  - Gifuni and Ravazzolo (2025);
  - his GitHub repository;
  - the brief in Appendix A.
- Answer:
  - What will he find most interesting?
  - Where can his expertise add most?
  - Where is he likely to push back?
  - How can the topic be framed honestly inside his topics 2 and 3?
  - What would turn this from a good dissertation into the best one of the year in his eyes?
- **Output: a meeting pack.** Include agendas for the first three meetings, the 10 best questions to ask him, what to show him (for example the week-1 results), and how to turn his feedback into a push for the 90s.
- Don't claim to know his views. Infer from his record and label each inference as one.

**P6. ★ Admissions reader at a top-10 university: economics.** Think of MSc or MPhil Economics and econometrics programmes at places like LSE, Oxford, Cambridge and UCL, plus their global equivalents. Does this dissertation signal research potential and quantitative maturity? What is the weakest part of my profile (probably maths)? How should the dissertation appear in my personal statement and in my reference letters?

**P7. ★ Admissions reader at a top-10 university: the broad quant pathway.** Cover financial mathematics, financial engineering and MFEs, statistics, data science and CS conversion degrees. Ask the same questions as P6. Also: how big is my maths gap, and how do I close it before I apply?

**P8. ★ Originality assessor.** Use R2's output plus your own searches. Is J v2 original: a new question, new data, a new mechanism or new evidence? What is its single most original element, and how do I put it front and centre? What would make it *interesting* to a marker who has read 50 dissertations that year? How could it be made sharper without adding risk?

**P9. Second marker and prize committee.** (My addition: someone other than the supervisor will also mark it.) Mark it blind against Strathclyde's grade descriptors from R4. Give a predicted mark band and the reasons for it. What separates 75 from 85 from 92 for this topic? What does a prize committee reward that a supervisor might not?

**P10. Hostile referee and econometrician.** Attack the identification and inference:
- the dollar factor;
- contamination of the event windows;
- the small number of events;
- regime confounds;
- multiple testing;
- whether the institutions themselves are endogenous;
- how "hedge intensity" is measured.

Say which objections are fatal and which are fixable, and how to fix them.

**P11. Pre-mortem red team.** It is June 2027. The dissertation got 64, it won no prize, and it fell flat in interviews. Write the most likely story of why, then the countermeasures to take now.

**Optional, spawn when triggered:** an institutional insider (a former central-bank, sovereign wealth fund or debt-office economist) if R3 or the reviewers find the transmission channels shaky; an FX and commodities strategist if the market realism of the predictions is disputed; anyone else whose view would change the recommendation.

### Phase 4: synthesis

**S1. Narrative and interview coach.** From the final design, produce:
- a 30-second and a 2-minute version of the dissertation;
- whiteboard derivations (for example why a put hedge gives a one-sided beta, and why a cut-off rule gives a kink);
- 15 likely interview questions, with answer outlines;
- a version I can use while I only have early results, because interviews are happening now;
- **updated CV dissertation bullets.** My current CV already promises "three predictions fixed in advance", difference-in-differences around Russia's rule changes, and a trading rule with a White reality check and Kelly sizing. The bullets must match what I will actually do;
- a draft of the dissertation paragraph for my master's personal statements.

**S2. Fact and quality auditor.** Check that:
- every citation exists, with a DOI or URL;
- every data claim is marked verified or unverified;
- the word budget sums to no more than the limit;
- no persona has been given invented quotes;
- every item in section 10 is covered.

Block the final report until these checks pass.

## 8. Output contract for every agent (so outputs can be compared)

- **Verdict** in one line.
- **Scores from 1 to 10**, each with a one-sentence reason, on the dimensions within the agent's competence ("n/a" for the rest):
  - originality;
  - economic contribution (is it economics?);
  - identification and rigour;
  - feasibility (data, power, time);
  - fits in 8,000 words;
  - supervisor fit;
  - mark and prize potential;
  - quant-interview signal;
  - hedge fund and PM signal;
  - master's admissions signal;
  - how easy it is to explain in an interview.
- **The top 3-5 changes** that would most raise the odds of the prize, ranked, each with its cost in words, time and risk.
- **Blocking objections**, listed separately from non-blocking ones.
- **The questions this agent would ask me** in an interview, a supervision meeting or an admissions review.
- **Evidence:** links, each marked *verified* (opened and read) or *unverified* (from a snippet or memory).
- **Confidence**, and what would change the agent's mind.
- Roughly 800-1,200 words, unless the orchestrator asks for more.

## 9. Evidence and honesty rules

- Always say whether a claim is verified or unverified. Never invent a citation, dataset, statistic, programme requirement, deadline or quote. If you can't open a source, say so.
- Real people (Dr Gifuni, Ken Griffin, other founders) appear only as simulated lenses grounded in their public record. Label them as simulated and don't put words in their mouths.
- Be blunt. I would rather hear "this alone won't get you hired" now than in June. Flag any hype. If a goal or belief of mine is unrealistic, say so and say what would make it realistic.
- In career and admissions research, separate anecdote from data and note survivorship bias.

## 10. Requirements checklist (the final report must trace each one)

1. Improve "Who Hedges the Barrel?" for my goals.
2. Tell me if a different dissertation would serve my goals better.
3. It must be economics, not finance.
4. It must fit in 8,000 words or fewer.
5. Its data must be available publicly or through Strathclyde, and verified.
6. Research how students like me broke into quant and hedge funds.
7. Research how students like me got into top master's programmes.
8. Tell me which master's degrees I can do with my degree, and which lead to quant or hedge-fund roles.
9. Test my belief about economics versus finance and tell me if I'm wrong.
10. Get reviews from every ★ lens, including both admissions agents.
11. Prepare me for meetings with Dr Gifuni so that I get his best advice.
12. Make the originality strong enough for the 90s and the prize.
13. Run the pipeline dynamically, with every deletion, rewrite and spawn logged.

## 11. Final deliverables

Save everything in `dissertation_war_room/`:

- `START_HERE.md` (one page at most): the verdict (keep J, J v2, or switch), why, and the three things to do this week.
- `01_final_design.md`: the full winning design, built per D1.
- `02_alternatives.md`: what the challenger tried, and why each alternative won or lost.
- `03_panel_reviews.md`: each lens's report, a score matrix across all lenses, where they agree, where they disagree, and how you resolved it.
- `04_gifuni_meeting_pack.md`
- `05_careers.md`: the evidence on how people like me broke in; my economics-versus-finance belief, tested; what the dissertation must signal; the 12-week action plan; the interview kit from S1.
- `06_masters.md`: the recommended type of degree; a shortlist table; my maths gap and how to close it; deadlines; an application plan.
- `07_data_verification.md`
- `08_cv_updates.md`: the correct degree title and the new dissertation bullets.
- `pipeline/`: the plan, the changelog (every agent added, deleted or rewritten, and why) and the completed requirements matrix.

In chat, give me a short summary and the file links.

## 12. Ask me first, in one batch

Before Phase 1, ask me these in a single message. If I say "skip" or don't know, carry on with clearly stated assumptions:

- the submission date and the marking grid, if I have it;
- whether I have already pitched J to Dr Gifuni, and what he said;
- my predicted degree classification;
- which roles I've applied to so far, and any results;
- whether I'm looking at UK-only or global master's programmes, and any budget or funding limits;
- which MATLAB toolboxes I have;
- whether I actually have Bloomberg or LSEG access at Strathclyde.

---

## Appendix A: Dr Luigi Gifuni's supervision brief (as circulated to students)

> I am happy to supervise dissertations in macroeconomics. I am particularly interested in the uncertainty effects that oil and gas price spikes generate on the economic growth of a country, and the spillover effects between the main trading partners. It would also be interesting to examine how alternative central institutions are responding to the future projections of commodity prices, as well as the use of unstructured (textual) data aimed at improving oil price forecasts. However, I am also happy to discuss any other student ideas related to the aforementioned topics.
>
> I have already done some works related to the cross-country uncertainty effects and the macroeconomic effects following an oil price shock. You can see such contributions here: https://sites.google.com/view/luigigifuni/research
>
> **1. Combining Financial and Text Data for Energy Price Forecasting**
> This project explores the integration of financial and textual data within Mixed Data Sampling (MIDAS) frameworks to improve energy price forecasts. The student will investigate the performance of various models, assessing their ability to capture the distinct dynamics introduced by combining structured (financial) and unstructured (textual) data. The analysis will focus on determining which configurations offer superior predictive power for energy price volatility, especially during periods of market instability. Tasks include preprocessing data, feature extraction, and model comparison. Familiarity with MATLAB will be valuable, as the project involves working with high-frequency data and implementing advanced econometric models.
> Initial readings: Ghysels, E., Sinko, A. and Valkanov, R., 2007. MIDAS regressions: Further results and new directions. Econometric Reviews, 26(1), pp.53-90. Ghysels, E. and Marcellino, M., 2018. Applied economic forecasting using time series methods. Oxford University Press.
>
> **2. Country-specific uncertainty effects following an energy price shock**
> An energy price shock is commonly represented by an energy production decrease and energy price increase, typically over a very short period of time. This leads to a decline of real GDP, as well as of private consumption. Since 1970s oil and gas shocks have been seen as the main dampeners of the economy growth. For this reason, policy makers have sought to identify their effects on the global economy from a demand and a supply side.
> Initial readings: Hamilton, J. D. (1983). Oil and the macroeconomy since World War II. Journal of Political Economics. Kilian, L. (2008). The economy affects of energy price shocks. Journal of Economic Literature. Kilian, L. (2009). Not all price shocks are alike: disentangling demand and supply shocks in the crude oil market. American Economic Review.
>
> **3. Strategic response of policy makers to commodity price crisis**
> Following the outbreak of the war between Russia and Ukraine, the surge of commodity prices, especially for oil and gas, has concerned once again government institutions regarding the related economic impact. While this shock may be temporary, such a sharp increase is not unprecedented. A number of studies in the past have analysed the impact of energy price movements on inflation and conflicts. It is not surprising, therefore, the increasing necessity of policy makers to accurately forecast future commodity prices in order to make informative policy decisions. I provide below few prominent contributions, which are useful to understand this literature.
> Initial reading: https://www.imf.org/en/Blogs/Articles/2023/03/28/volatile-commodity-prices-reduce-growth-and-amplify-swings-in-inflation ; Hastings, J.S. and Shapiro, J.M. (2013). Fungibility and consumer choice: evidence from commodity price shocks. Quarterly Journal of Economics. Bazzi, S. and Blattman, C. (2014). Economic shocks and conflicts: evidence from commodity prices. American Economic Journal: Macroeconomics.
