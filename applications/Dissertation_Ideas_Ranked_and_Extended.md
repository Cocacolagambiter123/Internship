# Dissertation ideas: ranked, judged and extended

**For:** Will McGowan, final-year BA Economics, University of Strathclyde
**Supervisor:** Dr Luigi Gifuni
**Date:** 8 October 2026

## How to read this

You asked for four things: rank your five existing ideas by originality and by quant appeal; say whether they cover your three goals (the department prize, a mark in the 80s or 90s, and a quant interviewer who wants to hire you); add new ideas with every pro and con; and give a final ranking, a recommendation and an email to Dr Gifuni. This document does that in order. The full working draft, with every method menu, week plan and chapter budget, is in the companion file Dissertation_Ideas_Full_Detail.md. Read this one first. Every term of art is explained once in the glossary at the end.

Two honesty notes before anything else.

(a) The scores and rankings below come from three independent model-generated scoring passes: a hedge-fund researcher persona, a prop-trading persona and a Strathclyde examiner persona. They are called "judges" below for brevity. They are not human reviewers. Treat them as a structured opinion, and do not tell Dr Gifuni that "judges" ranked anything.

(b) The environment that prepared this could not open most data sites (EIA, FRED, OPEC, IEA, the central banks, ICE, Yahoo, Investing.com). Every claim about what a dataset contains, when it starts and whether it is free rests on search-engine snippets of the relevant pages unless marked "verified". The items verified directly were Dr Gifuni's GitHub repository (cloned), Känzig's and Degasperi's OPEC-surprise repositories, the jauricestudios Gassco repository, and live Alpha Vantage calls for daily WTI, Brent, Henry Hub, USD/NOK and USD/MXN. So the week-1 data check for whichever idea you pick is not a formality. It is the first real task.

(c) A reading convention. The "hook" and "interview line" under each idea are written in the past tense, as the sentence you would say after finishing the work. None of it has been done yet, and every "first" in those lines means the first that this search could find.

Hard constraints applied throughout: original (the specific question has not been answered in this form), inside Dr Gifuni's interests, free public data only, MATLAB (R acceptable, no Python), finishable in about six months part-time, and no gimmicks that a mainstream economist would mark down.

---

## 1. The five existing ideas, ranked

### By originality

Average score out of 10; the three judges' scores in brackets.

1. **Who is short gas? The Treasury's gas exposure in gilt prices, 2022-2026** — 7.7 (8, 7, 8). Treating the Energy Price Guarantee as a call option on gas written by the Treasury, and asking whether gilts began pricing the UK as short gas, is a question no paper found has asked. Pinter (2023) explains the 2022 gilt crisis with pension-fund selling, and Shackleton (2025) links the scheme to gilts only in words. Two judges ranked it most original.
2. **Reading the tell: are Norwegian gas outage return dates biased forecasts?** — 7.7 (8, 8, 7). Scoring a pipeline operator's stated return date as a forecast is new. One judge put it first; the third marked it down because a public 2026 repository has already run the price-reaction event study on the same Gassco feed and found nothing.
3. **Calling the cartel's bluff: does the market price OPEC+ promises by each member's record?** — 6.0 (6, 6, 6). An attractive framing, but the IMF already describes compliance (Pescatori and Nazer 2022) and Spencer and Bredin (2019) already study how the futures curve reacts to OPEC decisions. Partly done; unanimous.
4. **Does the news know something the oil options market doesn't? (TOSI vs OVX, Kelly bankroll)** — 5.0 (5, 5, 5). It runs the supervisor's own index through the supervisor's own model against a new benchmark. The Kelly reporting device is the only new element. Unanimous.
5. **Could the newspapers call OPEC?** — 4.0 (4, 4, 4). Mori and Peersman (2024) already show financial variables predict Känzig's surprises; adding monthly newspaper indices is an incremental robustness check. Unanimous.

### By quant appeal

Four of the five tie at 6.3, so the order follows where each judge placed the idea in their own quant-appeal ranking.

1. **Who is short gas?** — 6.3 (6, 6, 7). A rates desk leans forward at "the Treasury sold the public a call option on gas", and gilt decomposition is real quant work. The identification problem (the LDI crisis overlaps the scheme) stops it scoring higher.
2. **Reading the tell (Gassco)** — 6.3 (6, 7, 6). Every European gas desk reads Gassco notices, so the story lands. Two judges put it in their top half; the third put it near the bottom because the price-reaction first stage is already a published null.
3. **TOSI vs OVX** — 6.3 (6, 6, 7). Turning a score gap into a Kelly bankroll is proper bettor thinking. But the core is a published model re-run with a new benchmark, which is the first red flag on an interviewer's list.
4. **Calling the cartel's bluff** — 6.3 (6, 6, 7). Good hook, but it needs long-dated futures from a paid terminal and cannot attribute a joint OPEC+ announcement to one member.
5. **Could the newspapers call OPEC?** — 4.7 (5, 4, 5). Whatever the result, the headline is about the validity of someone else's instrument: a methodological footnote, not a market finding.

---

## 2. Do the existing five cover everything?

**No.** All three judges reached that verdict independently. The five are a reasonable first list, but as a set they do not deliver your three goals, and the earlier recommendation (lead with Gassco, fall back to TOSI vs OVX) should be revised.

**Keep as a reserve: idea 3, Who is short gas?** Original (7.7); topic 3 of Dr Gifuni's brief almost word for word; reuses his Brexit event-study design; his own institute costed the scheme; all data free (Bank of England daily curves, Bundesbank curve, NBP price via ONS or National Gas). The problem is execution. The scheme's roughly nine active months sit on top of the September-October 2022 mini-budget and pension-fund (LDI) crisis; there is one regime switch on and one off; splitting gilt yields into expected rates, inflation and a fiscal premium is model-dependent; and RPI breakevens were distorted in autumn 2022 when index-linked gilt liquidity collapsed (Pinter 2023). Clean execution is at risk. Carry it as an alternative, not the lead.

**Keep only as a contingent reserve: idea 1, Reading the tell.** Original, in Dr Gifuni's forecast-evaluation language, and on gas, which his brief names and his papers do not touch. But the Gassco archive appears to start in September 2024, so about 150-170 unplanned outages exist; the jauricestudios repository already finds no daily TTF reaction to 166 of them (median return +0.057%, Wilcoxon p = 0.69, on vendor TTF data); notices arrive at all hours, so daily data cannot time the reaction; and free daily TTF history is unverified. The forecast-bias chapter is sound but it is a short note on a small, recent sample. Keep it only if Gassco emails you older history in week 1. Otherwise its outage catalogue can live on as an extension inside new idea I.

**Drop: idea 2, TOSI vs OVX.** Highest fit with Dr Gifuni of the existing five (9.0), lowest originality of the strong ideas (5.0). His index, his model, his code, tougher benchmark. He says an original idea earns the top mark; a quant interviewer files "published model, new sample" under replication. Three practical problems: OVX is one number (a 30-day implied volatility), not a distribution, so the market density must be assumed lognormal; his SV-BVAR takes about four hours per run, so a recursive exercise over 140 months is hundreds of hours; and the sentiment columns in his repository change scale after 2023:09, so the post-2021 extension needs his confirmation. The likely result is "the market wins". Its one good device, Kelly growth from a score gap, is absorbed into K and G.

**Drop: idea 4, Calling the cartel's bluff.** Its own text says to ask the library for a Bloomberg or Refinitiv terminal. That breaks the free-data constraint: EIA's free futures tables stop at contract 4 and end on 5 April 2024. OPEC+ announcements are joint, so a day's Brent move cannot be assigned to one member without strong assumptions; member-level compliance comes from secondary-source tables some members dispute; and there are few announcements. New idea F covers the OPEC-credibility slot with free data and a sharper test.

**Drop: idea 5, Could the newspapers call OPEC?** A one-regression exercise. Monthly text against a daily surprise is a frequency mismatch; about 130-140 events; and the outcome is either "someone else's instrument is contaminated" (a critique) or "no" (a small null). Feasible in a week, hard to make prize-worthy.

**What the five lack, measured against your goals.** None combines an original market-mechanism question with clean identification and verified free data. None is a cannot-fail quant dissertation (idea 2 cannot fail on data but is a replication). The one policy-credibility idea (4) needs a terminal. The one text idea in Dr Gifuni's idiom (2) builds nothing new. The new ideas fill each gap: J and A for mechanism plus identification; G as the cannot-fail quant option; F for policy credibility with free data; K for text in his idiom on a corpus no paper found has used. On MATLAB feasibility, all five existing ideas are MATLAB-native; only idea 2 has a compute problem.

---

## 3. New ideas

Twelve new ideas were generated and put through an examiner pass against the literature and against free data sources. Eleven were kept and scored alongside your five. One was dropped:

- **H. Two half-lives: what the WTI curve says about how long an oil shock lasts.** Dropped because only four free futures maturities exist (months 1-4), so a four-parameter decay model fitted to four points is under-identified; Adams, Burdorf and Käfer (2023) already read shock persistence off the near curve; the free sample ends April 2024; and there is no P&L. Scores: originality 4.7, quant 5.7, prize 4.7, feasibility 4.7.

Of your five, ideas 2, 4 and 5 are dropped for the reasons in section 2, and ideas 3 and 1 are carried as reserves. Letters are the labels the judges used. The six ideas that matter most get full write-ups below, in the order of the final ranking; the rest get shorter notes.

### Full write-ups

---

#### J. Who Hedges the Barrel?

**Question.** Using Känzig's OPEC-announcement-day oil supply surprises, does a petro-currency's same-day "oil beta" (how much it moves per unit of oil news) shrink, kink or turn one-sided when its government hedges the country's oil exposure for it? Three cases: Norway's pre-announced daily krone conversions for the oil fund (against unhedged Canada); Russia's 2017-2022 budget-rule purchases of foreign currency, which switched on only when oil was above a cut-off price; and Mexico's annual put-option hedge, which protects only the downside. Is whatever beta remains tradable after a reality check?

**The hook.** Norway ships its oil money abroad by rule, Russia bought dollars only when Urals was above the budget price, and Mexico buys puts. I test whether these sovereign hedges show up as smaller, kinked or one-sided oil betas in their currencies on the days OPEC speaks.

**Why it is original.** [Känzig (2021, AER)](https://doi.org/10.1257/aer.20190964) shows the dollar depreciates after adverse oil supply news, most against exporters' currencies, but estimates no individual petro-currency betas and no institutions. Rüth, Oruc, Van der Veken and Zhang (2026, "When OPEC Speaks", [University of Erfurt](https://www.uni-erfurt.de/en/university/current/news/news-detail/neues-arbeitspapier-when-opec-speaks-the-dollars-evolving-reaction-to-oil-supply-news-in-the-age-of-shale); only the news summary was found) show the dollar's reaction flipped sign in the shale era with no fiscal rules or hedges mentioned; read the paper in week 1. [Ahmed (2020)](https://ideas.repec.org/a/eee/ecolet/v189y2020ics0165176520300422.html) explains a 30-currency cross-section around the single 2019 Abqaiq attack. [Habib, Bützer and Stracca (2016)](https://doi.org/10.1057/imfer.2016.9) find, with monthly shocks, that exporters absorb oil shocks through reserves rather than exchange rates. The ruble's weaker oil link after 2017 is documented descriptively ([Fedoseeva 2018](https://ideas.repec.org/a/cii/cepiie/2018-q4-156-9.html); [BOFIT Weekly 35/2018](https://www.bofit.fi/en/monitoring/weekly/2018/vw201835_2/)). [Norges Bank commentaries](https://norges-bank.brage.unit.no/norges-bank-xmlui/handle/11250/2558079) say the conversion mechanism should not move the krone, without a test; an [NHH thesis](https://openaccess.nhh.no/nhh-xmlui/handle/11250/223306) finds higher NOK variance on purchase-announcement days to 2013 and no return reaction. [Bjørnland and Thorsrud (2016)](https://doi.org/10.1002/jae.2669) cover Norway's fiscal rule but not FX; [Baghestani, Chazi and Khallaf (2019)](https://doi.org/10.1111/opec.12234) and [Ma and Valencia (IMF WP 18/35)](https://www.imf.org/en/Publications/WP/Issues/2018/03/02/Welfare-Gains-from-Market-Insurance-The-Case-of-Mexican-Oil-Price-Risk-45667) cover the peso and the put hedge's welfare value, not the FX reaction to the hedge. No paper found estimates currency-by-currency OPEC-day betas with within-country time variation and explained them with the actual hedging institutions and their dated regime changes.

**Why Dr Gifuni will find it interesting, and what he can advise on from public work alone.** Topic 3 of his brief is how "central institutions are responding to the future projections of commodity prices". Russia's cut-off is a published oil-price rule, Mexico's strike is the budget's oil-price assumption, Norway's conversions follow projected petroleum revenue: this tests whether markets price institutions' responses to commodity projections. It also sits in his country-specific-effects and spillover themes and uses his methods: Kilian-style oil VARs, the Känzig instrument he cites, the high-frequency event study of his Brexit paper, forecast-evaluation discipline. He can advise on instrument choice and averaging across Känzig and Degasperi, event windows, HAC inference, the 2014 and 2020 collapses, and the economic-value evaluation he has noted is absent from his own work. Be honest: there is no text component, and FX is not his field. Frame the topic-3 fit explicitly rather than claiming a verbatim match.

**Why a quant interviewer will like it, and what it proves about you.** This is how an FX macro desk thinks: the oil beta of NOK versus CAD versus MXN, why the krone "should" move and does not, whether a sovereign's hedge is already priced. You turn institutional detail into testable payoff shapes (kink at the budget price, one-sided beta from puts, sign-dependent beta from pre-announced flows), handle the dollar common factor, use an identified instrument with its known critiques, run a difference-in-differences across regime dates with a control currency, then ask whether the residual beta is tradable after costs, a reality check and Kelly sizing. Skills proved: event-study and panel econometrics, instrument validity checks, threshold and asymmetric regressions, bootstrap and multiple-testing control, strategy evaluation, and poker-style thinking about who is hedged and who is exposed.

**Data.**
- [Känzig oil supply news surprises](https://github.com/dkaenzig/oilsupplynews): free, CC BY 4.0; twelve vintages to 2025M12, Daily sheet with 169 events from 1983, 4-5 month lag. **Verified.**
- [Degasperi "clean" OPEC surprises](https://github.com/riccardo-degasperi/OPEC-surprises): free, no licence stated; 1983:7-2025:6, daily and monthly. **Verified.**
- Daily exchange rates: [FRED H.10](https://fred.stlouisfed.org/series/DEXNOUS) from 1971 (MXN 1993, BRL 1995), ECB reference rates from 1999, Bank of Russia, Banxico, Alpha Vantage. Free. USD/NOK and USD/MXN **verified** via Alpha Vantage; the rest unverified.
- [Norges Bank FX transactions on behalf of the government](https://www.norges-bank.no/en/topics/statistics/foreign-exchange-transactions-daily/): free; monthly pre-announced daily amounts, a search-engine snippet of the page shows rows back to 2000, so the table may run from 2000; the live page could not be opened, so confirm the start year in week 1.
- Russian MinFin fiscal-rule announcements, with [ING snaps](https://think.ing.com/snaps/russia-fx-purchases-january-2022/) and BOFIT as records: free; purchases February 2017-January 2022, sales March-December 2020, about 60 releases. Unverified.
- Mexico sovereign oil hedge (SHCP reports, Banorte notes, Ma and Valencia): free; since 2001; barrels undisclosed from 2017. Unverified.
- Net oil exports to GDP: [EIA international data](https://www.eia.gov/international/data/world), World Bank WDI; free, annual 1980-2024. Unverified.
- [Brent](https://fred.stlouisfed.org/series/DCOILBRENTEU), [WTI](https://fred.stlouisfed.org/series/DCOILWTICO), VIX and S&P 500 for controls: free; Brent and WTI **verified** via Alpha Vantage.

**Method, trimmed plan.**
1. Baseline betas (weeks 1-5). Merge Känzig's Daily sheet with daily log changes of 15-20 currencies against USD and EUR. Estimate each currency's OPEC-day beta with HAC and block-bootstrap errors, by sub-sample, with and without a dollar factor purged using non-commodity currencies. To my knowledge the first currency-by-currency table of oil-news betas; a complete result on its own.
2. Cross-section (weeks 5-7). Pool a currency-day panel with net oil exports/GDP interacted with the surprise, currency fixed effects, date-clustered errors; add the Degasperi supply-versus-information split; identify residual under-reactors (prediction: NOK, RUB after 2017, MXN on the downside).
3. Norway versus Canada (weeks 7-10), the core. Interact NOK's OPEC-day surprise with the sign and size of that month's pre-announced conversion flow, CAD as control. Then an event study of the Norges Bank announcement itself: EUR/NOK's day-0 return on the surprise in the announced amount relative to a stated expectation.
4. Russia (weeks 10-13). Difference-in-differences of RUB's beta across regimes (pre-2017 float; 2017-2022 purchases; 2020 sales window) with CAD and NOK controls, pre-trend checks, sanction dummies, post-February 2022 excluded. Say that the cut-off is crossed only in 2020, so the "kink" is a regime test confounded with COVID.
5. Mexico (weeks 13-15). MXN's beta to negative oil surprises should be smaller than to positive ones and smaller in years with a higher hedged share; COP and BRL as unhedged comparators; 2001-2017.
6. Tradability (weeks 15-17). One pre-registered OPEC-day rule held 1-5 days, after bid-ask costs, with Sharpe, drawdown, a White reality check across all rules tried and a Kelly fraction. "Priced in the window, not tradable" is the efficient-market result.
7. Robustness and write-up (weeks 17-20). Degasperi's series, 2-day windows, VIX and S&P controls (Mori and Peersman); average across the two instruments in the spirit of his model-uncertainty work.

Chapter budget, 10,000 words: introduction, question and the three predictions written down in advance 1,000; literature (oil and exporter currencies; fiscal rules and sovereign hedging; OPEC-announcement identification) 1,300; institutions and the dated regime ledger 1,300; data and the OPEC-day surprise series (Känzig, with Degasperi as the check) 900; baseline betas and the three tests (difference-in-differences across regime changes, kink, asymmetry) with the purged dollar factor 2,600; robustness, placebos and the pre-registered tradability check with a reality check 1,500; conclusion 700; abstract and limitations 700.

**MATLAB notes.** Statistics and Machine Learning Toolbox (fitlm with robust options, regress, bootstrp) and Econometrics Toolbox (hac). DiD, threshold and signed regressions are OLS with dummies; clustered errors, the stationary bootstrap and the reality check are short hand-written functions; Kelly sizing is arithmetic. R fallback: fredr or quantmod, sandwich and lmtest, fixest, boot, PerformanceAnalytics.

**Week-1 check.** (a) Download Känzig's 2025M12 vintage and Degasperi's Jun25 file; confirm the Daily sheets align on OPEC dates. (b) Download daily USD/NOK, USD/CAD, USD/MXN, USD/BRL, EUR/NOK and EUR/CAD and merge. (c) Regress daily log changes in NOK and CAD on the OPEC-day surprise for 2000-2019; require |t| above 2 with exporters appreciating on adverse supply news. (d) Find the Norges Bank monthly table and its start year; collect at least 24 MinFin announcements. (e) Read Rüth et al. (2026) and confirm it does not already include fiscal or fund mechanisms. If (c) fails, try 2-day windows and Degasperi's series; if still null, switch to the fallback.

**Pros.**
- Every input is free and small: one verified shock series (plus a verified second), daily FX, three hand-collected institutional tables; the week-1 check is cheap and decisive.
- The institutional predictions are sharp and can be written down in advance (kink, one-sided beta, sign-dependent beta), which examiners and quants both respect.
- Steps 1 and 2 alone are a complete, citable table that this search found nowhere in the literature; steps 3-5 each stand alone, so partial completion still yields a strong dissertation.
- A null (markets see through sovereign hedges) is a clean finding about efficiency and about whether fiscal rules insulate currencies at all.
- Fits brief topic 3 more literally than any existing idea and uses the Känzig instrument Dr Gifuni knows well.
- Highly explainable in an interview: oil beta, payoff shapes, event windows, DiD, dollar factor, reality check, Kelly.
- No overlap with the existing five (existing 4 is about members' promises, not currencies) and no paid data.

**Cons.**
- *Time.* Hand-collecting about 60 MinFin and 200-plus Norges Bank announcements is tedious for you; budget two focused weeks and automate the parsing. The analysis itself is a few scripts.
- *Data risk.* Low. Unknowns: the Norges Bank table's start year (a snippet suggests 2000) and whether Rüth et al. already include fiscal mechanisms; both are week-1 items. Mexico's barrels are undisclosed from 2017.
- *Where you could get stuck.* The dollar moves on OPEC days, so betas versus USD partly measure the dollar; show results versus EUR and with a purged factor. OPEC days inside regime windows are few (perhaps 40-60 under Russia's rule, about 10 in the 2020 sales window), so wide bands are likely. RUB is confounded by sanctions (2014, 2018, 2022); the cut-off is crossed only in COVID-hit 2020. Mexico is a marginal net exporter, so MXN's beta may be near zero. Norges Bank flows are pre-announced, partly forecastable and small relative to turnover, so a null on the flow interaction is plausible and the announcement "surprise" needs a defensible expectation model.
- *How examiners might attack it.* "Your coefficient is the dollar, not oil." "Forty OPEC days cannot identify a regime change." "Daily windows mix OPEC news with other news" (hence VIX and S&P controls and Degasperi's series). "Is the topic-3 fit real?"
- *If the result is null.* It still works: the beta table and the pooled cross-section are new whatever the mechanism tests show.
- *How much Dr Gifuni can help.* Expert on the instrument, event windows, inference, oil episodes and economic-value evaluation. Generic on FX microstructure and on Norwegian, Russian and Mexican institutional detail, which you self-teach. No text component for him.
- *Explaining it in an interview.* Every piece is derivable on a whiteboard: why a put hedge gives a one-sided beta, why a rule that buys FX only above a cut-off gives a kink, how to purge a dollar factor without commodity currencies, how a reality check corrects for trying several rules.

**Fallback.** If the mechanism tests are null or underpowered, the dissertation stands as "The oil-news beta of currencies: exposure, supply versus information news, the dollar factor and time variation", with the hedge tests as pre-registered nulls. If RUB or MXN prove problematic, run the full design on NOK versus CAD alone. If Känzig's latest vintage is unavailable, use the openICPSR 2017 package plus Degasperi.

**Interview line.** "I used OPEC-day oil surprises to measure how each petro-currency trades oil news, then tested whether Norway's fund flows, Russia's budget rule and Mexico's put hedge show up as smaller, kinked or one-sided betas, and whether what is left is tradable after a reality check."

**Prize case.** A clear mechanism; a credible high-frequency instrument with its critiques addressed; institutional detail turned into falsifiable predictions; DiD with controls and pre-trends; careful inference with few events acknowledged; a proper dollar-factor treatment; economic-value evaluation with multiple-testing control; honest nulls; appeal across energy, international finance and public finance.

**Judges' scores.** Originality 8.0, quant appeal 8.3, prize and mark 8.0, feasibility 7.7, Gifuni fit 7.0. First overall for all three passes.

---

#### A. The Atlantic Switch

**Question.** When the EIA's weekly storage number surprises the US gas market at 16:30 Amsterdam time, how much of the Henry Hub reaction reaches Dutch TTF and British NBP prices by that evening's settlement? Is the pass-through switched on only when US LNG export capacity is slack and a cargo is at the margin of cancellation?

**The hook.** A scheduled US number lands 35 minutes before TTF's 17:05-17:15 settlement window. I use it as an instrument to measure what fraction of a US gas shock crosses the Atlantic, and show the fraction is a switch controlled by whether an LNG cargo is worth loading.

**Why it is original.** No paper found measures transmission of the EIA storage surprise to any non-US gas price. The US literature stops at Henry Hub: [Ederington, Lin, Linn and Yang (2019)](https://doi.org/10.5547/01956574.40.5.lede); [Prokopczuk, Wese Simen and Wichmann (2021)](https://doi.org/10.5547/01956574.42.2.mpro) on the announcement-day premium; [Gu, Kurov and Stan (2026)](https://doi.org/10.1002/fut.70104) on holiday-shifted releases, which pre-empts that device; [Halova, Kurov and Kucher (2014)](https://doi.org/10.1002/fut.21633); [Chen, Hartley and Lan (2023)](https://doi.org/10.1002/fut.22402). [Halova Wolfe and Rosenman (2014)](https://doi.org/10.1016/j.eneco.2013.12.010) use scheduled EIA releases as identified shocks for oil-gas transmission inside the US, so the device exists but has never been pointed across the Atlantic or conditioned on the arbitrage state. [Fernández-Pérez, Garel and Indriawan (2020)](https://doi.org/10.5547/01956574.41.5.afer) settle "are storage forecasts rational?", so that is a data check, not a contribution. The integration literature ([Farag, Jeddi and Kopp 2025](https://doi.org/10.1111/twec.13699); [Nick and Tischler 2014](https://www.ewi.uni-koeln.de/de/?p=998)) uses cointegration on price levels with no identified shock.

**Why Dr Gifuni will find it interesting, and what he can advise on from public work alone.** It is literally the "spillover effects between the main trading partners" line of his brief, on gas, which his papers never touch. His Brexit paper is exactly this design: scheduled announcements, cross-country event study, HAC and bootstrap inference with few events, placebo days. He can advise on windows, placebos, inference, forecast-evaluation checks and reporting a null. He cannot help with LNG cost chains, GIE data or ICE settlement rules; you self-teach those from free EIA, GIE, OIES and ICE documents.

**Why a quant interviewer will like it, and what it proves about you.** A desk trades precisely this: release, consensus, surprise, reaction, spillover. The interviewer sees exogenous timing, an IV estimate of pass-through, a physical no-arbitrage switch (feedgas utilisation; TTF minus 1.15 times Henry Hub minus shipping and regasification), placebo Thursdays, a pre-registered minimum-detectable-effect calculation, and a lead-lag rule net of costs. Skills proved: event-study and IV econometrics with HAC and bootstrap, regime regression, forecast evaluation, dataset assembly from six free sources, exact market-timing knowledge (10:30 ET is 16:30 CET except for about three daylight-saving weeks a year).

**Data.**
- [EIA Weekly Natural Gas Storage Report](https://ir.eia.gov/ngs/ngs.html): free; national weekly to 1994, regions from 2010; Thursday 10:30 ET. Unverified.
- Consensus history: [Hugging Face Tropstan/Forex_Factory_Calendar](https://huggingface.co/datasets/Tropstan/Forex_Factory_Calendar) and other calendar exports; free; reportedly from 2007. **Unverified; terms of use unknown.**
- Henry Hub spot ([FRED DHHNGSP](https://fred.stlouisfed.org/series/DHHNGSP)) and [EIA NYMEX contracts 1-4](https://www.eia.gov/dnav/ng/ng_pri_fut_s1_d.htm): free; spot from 1997 (**verified** via Alpha Vantage), futures 1994 to 5 April 2024.
- Dutch TTF front-month daily: [DBnomics ICE per-contract series](https://db.nomics.world/ICE/DUTCH_TTF_GAS_FUTURES) from 11 November 2020; Investing.com export (start unconfirmed); Yahoo TTF=F is the CME USD/MMBtu contract first traded 12 July 2021, not a pre-2021 source. Free. **Unverified; the single biggest risk.**
- [UK NBP System Average Price](https://www.ons.gov.uk/economy/economicoutputandproductivity/output/datasets/systemaveragepricesapofgas): free; daily, likely a decade or more. Unverified.
- [GIE AGSI+ and ALSI+](https://agsi.gie.eu/): free with registration; daily since 2014. Unverified.
- US LNG exports, feedgas, outages ([EIA Natural Gas Weekly Update](https://www.eia.gov/naturalgas/weekly/)): free; monthly by terminal from 2016. Unverified.
- [ICE Endex Operating Schedule](https://www.ice.com/publicdocs/endex/ICE_Endex_Operating_Schedule.pdf): free; settlement window 17:05-17:15 CET; early-close days. Unverified; pre-2021 window unconfirmed.

**Method, trimmed plan.**
1. Week-1 assembly and power analysis. Build the weekly surprise (actual minus consensus), match to EIA actuals, compute the minimum detectable pass-through per sub-period. Report it up front.
2. US benchmark. Henry Hub Thursday returns on the surprise with Newey-West errors; confirm the known reaction. A validity check.
3. Cross-Atlantic pass-through, the main result. (a) Reduced form: TTF and NBP Thursday settlement-to-settlement returns on the surprise with Brent, EUR/USD and lagged EU storage controls. (b) IV: instrument the Henry Hub Thursday return with the surprise and estimate the fraction reaching Europe. Placebos: non-release Thursdays, holiday-shifted release days. Sub-periods: pre-2016, 2016-2021, 2022-2026.
4. The switch. Interact the surprise with pre-specified lagged states: feedgas over nameplate capacity (binding above 0.9); the arbitrage margin; north-west European regas utilisation. Headline is the binary slack-versus-binding regime with summer 2020 as the clearest open state; a grid-search threshold is robustness only.
5. Speed and tradability. Friday and Monday TTF returns on the Thursday surprise; one rule fixed in advance, slack states only, net of ICE fees and spread, Sharpe and Kelly bankroll, permutation test.
6. Second chapter or fallback. Reverse-direction event study of unscheduled US LNG outages (Freeport 8 June 2022 and restart; hurricane shutdowns 2020-2021) on Henry Hub, TTF and NBP.

**MATLAB notes.** Statistics and Machine Learning Toolbox (fitlm, bootstrp, regress) and Econometrics Toolbox (hac). IV is fitlm on first-stage fitted values with hand-coded 2SLS errors; threshold search and bootstrap about 50 lines; webread and jsondecode for FRED, DBnomics and the GIE API. R fallback: sandwich and lmtest, AER (ivreg), tsDyn, quantmod, rvest, gie.

**Week-1 check.** All four must pass: (1) at least 300 consensus-actual pairs for 2016-2026 matching EIA actuals to the Bcf; (2) a free daily TTF front-month series back to at least 2017 (under 2% missing) and daily NBP SAP back to at least 2012; if TTF stops at November 2020, NBP becomes the long leg; (3) archived ICE Endex rules confirming the settlement window was after 16:30 CET in every sample year, with early-close Thursdays listed; (4) a minimum detectable pass-through below the plausible 10-30% of the Henry Hub move for at least the pre-2022 sample.

**Pros.**
- A genuinely unanswered question with a mechanism gas traders recognise; the title signals market-microstructure and LNG literacy without an internship.
- Identification is textbook: exogenous timing, IV scaling, placebo days, pre-specified regimes; any mainstream examiner can grade it.
- Several self-contained results: the pass-through estimate alone is a dissertation; the switch and the outage chapter add depth.
- Squarely in Dr Gifuni's brief (spillovers, gas) and reuses his public event-study methods.
- Policy relevance for the prize committee: whether US LNG exports tie Henry Hub to world prices; EU security of supply.
- Low toolbox burden; the hardest code (threshold bootstrap, 2SLS) is short.
- A precise null ("Europe does not trade the US number even after the LNG boom") is publishable evidence of informational segmentation.
- Summer 2020 and Freeport give memorable episodes for the abstract and interviews.

**Cons.**
- *Time.* Assembling 500-800 consensus rows; building a continuous TTF series from per-contract data with roll rules; time-zone and early-close bookkeeping. Each is a week or more of fiddly work.
- *Data risk.* High. Free daily TTF before 2017-2021 is unverified and may not exist, so the long European leg may have to be NBP SAP, a within-day average that blurs the 35-minute timing story. Consensus history comes from exports whose contents and terms are unverified.
- *Where you could get stuck.* Power: TTF daily volatility (3-6% in 2022) dwarfs a plausible 0.1-0.4% pass-through, so the headline interval may be wide; pre-2022 and NBP carry the power. Open-arbitrage states are rare (mainly summer 2020 and parts of 2016-2019). Daylight-saving mismatches and ICE early-close days must be handled or the timing argument fails.
- *How examiners might attack it.* "Why not intraday?" (paywalled). "Your arbitrage margin depends on TTF itself" (lagged states, pre-specified thresholds, exogenous capacity measures). "Why is Farag et al. not enough?" (levels versus identified news). Forecast rationality and the holiday-shift placebo are already published and cannot be sold as contributions.
- *If the result is null.* It works only if the interval is tight enough to be informative; a wide-interval null dressed up as a result will be marked down.
- *How much Dr Gifuni can help.* Expert on windows, placebos and inference with few events. Nothing on LNG economics, GIE data or ICE rules.
- *Explaining it in an interview.* Strong; the whole design fits on a whiteboard. Expect to be asked which weeks 10:30 ET is not 16:30 CET and what that does to the settlement argument.

**Fallback.** If pass-through is zero in every state with a tight interval, write that as the finding and lean on the outage chapter. If free TTF stops at November 2020, use NBP SAP as the long leg. If consensus data cannot be assembled, build a model-based surprise from degree-days and prior flows and validate it against what you can collect. If intervals are too wide, the LNG outage event study is a complete dissertation on its own.

**Interview line.** "The EIA drops its storage number 35 minutes before TTF's settlement window; I used it as an instrument to measure what fraction of a US gas shock crosses the Atlantic and found the fraction is a switch controlled by whether an LNG cargo is worth loading."

**Prize case.** A one-sentence question with a visible mechanism; exogenous identification any examiner accepts; a dataset from six free sources; mainstream econometrics with a pre-registered power calculation; results that matter for EU energy security and US export policy; honest nulls; code anyone can rerun.

**Judges' scores.** Originality 8.0, quant appeal 8.7 (second highest, after G's 9.0), prize and mark 7.7, feasibility 5.3, Gifuni fit 7.0. Second overall for all three passes.

---

#### F. Does the Dealer Lie About the Deck? OPEC's Demand Forecasts as Strategic Signals

**Question.** Are OPEC's monthly world-oil-demand forecasts biased relative to the EIA's Short-Term Energy Outlook (and the IEA where free), in a direction, at horizons and at calendar points that track OPEC's production stance and meeting cycle rather than its information set? Has the futures market learned to discount OPEC's revisions when the cartel's recent record has been poor?

**The hook.** Every month the player with the biggest stack tells the table how strong demand will be. I treated 25 years of OPEC's forecasts as cheap talk from an interested party, scored them vintage by vintage against the EIA and against OPEC's own later numbers, and tested whether the market has learned to discount the dealer.

**Why it is original.** Agency forecast evaluation covers the EIA only ([Auffhammer 2007](https://doi.org/10.1016/j.reseneeco.2006.05.001); [Sanders, Manfredo and Boris 2009](https://doi.org/10.1016/j.eneco.2008.08.010); [Garratt, Petrella and Zhang 2023](https://doi.org/10.1016/j.eneco.2023.106620)) or the IEA's long-run outlook ([Wachtmeister, Henke and Höök 2018](https://www.sciencedirect.com/science/article/pii/S0306261918303428)), and never asks whether a forecaster with a stake in the price shades its numbers. The IEA-OPEC demand gap appears only in a [Reuters tally](https://sweetcrudereports.com/comparison-of-iea-opec-oil-demand-forecasts-since-2008/), a [2008 Deutsche Bank note](https://www.ogj.com/general-interest/article/17267672/reliability-of-oil-supply-demand-forecasts-challenged), a [2024 Baker Institute brief](https://www.bakerinstitute.org/research/whats-happening-oil-market-forecasts) and the [IEF's monthly comparisons](https://www.ief.org/data/comparative-analysis), none testing bias formally or measuring market learning. The only cheap-talk test on OPEC ([Brunetti, Büyükşahin and Robe 2013](https://doi.org/10.5547/01956574.34.4.5)) covers "fair price" statements. [Moghaddam (2019)](https://doi.org/10.1111/opec.12138) tests price forecasts, not demand. [KAPSARC (2018)](https://doi.org/10.30573/ks--2018-dp40) documents the secondary-sources versus direct-communication production gap used here as an honesty measure. [Coibion and Gorodnichenko (2015)](https://doi.org/10.1257/aer.20110306) and [Nordhaus (1987)](https://doi.org/10.2307/1935962) supply methods not yet applied to OPEC in any paper found.

**Why Dr Gifuni will find it interesting, and what he can advise on from public work alone.** Forecast evaluation is his core craft (MSPE ratios, DM, Mincer-Zarnowitz, Model Confidence Set, recursive real-time design), all in his public repository and all used here on a new object. His topic 3 asks how institutions respond to commodity projections; this asks whether an institution's projections are themselves strategic. The text chapter scores the MOMR demand section with his public dictionaries and tests whether tone leads revisions, echoing his SARB finding that message components, not whole documents, move markets. His Oil_Variables.xlsx and TOSI are natural controls; the Kilian demand/supply framing is his home ground.

**Why a quant interviewer will like it, and what it proves about you.** It mirrors the sell-side analyst-bias research quant funds use: a sender with a known incentive, a receiver who should discount, a test of whether the discount is applied and updated. It shows vintage discipline (no look-ahead), a horse race with the right small-sample tests, a release-day surprise against the rival agency's latest revision, a Bayesian reliability weight that doubles as a forecast combination, horizon and calendar tests that separate strategy from model differences, and a pre-registered "fade the cartel's optimism" signal.

**Data.**
- [OPEC Monthly Oil Market Report archive](https://www.opec.org/opec_web/en/publications/338.htm): free PDFs via a form; demand forecasts with previous month's figure; production by two sources. **Archive depth unverified**: hoped 2001 (about 300 issues), planning floor 2012 (170).
- [EIA STEO archive](https://www.eia.gov/outlooks/steo/archives/): free; quarterly from 1984, monthly PDFs from 1997; world liquids consumption. Unverified; [Zenodo PUDL mirror](https://zenodo.org/records/17622298).
- [IEA Oil Market Report archives](https://www.iea.org/reports/oil-market-report-2006-archives): yearly compilations from 2003 appear to exist; free status unconfirmed. **Week-1 item.**
- [IEF Comparative Analysis](https://www.ief.org/data/comparative-analysis): free monthly PDFs since about September 2020. Unverified.
- Realised demand: [EIA International](https://www.eia.gov/international/data/world), [JODI](https://jodidata.org/oil/database/data-downloads.aspx), own later estimates. Free. Unverified.
- Brent and WTI daily via Alpha Vantage: free; Brent 1987 to 6 October 2026. **Verified.**
- [CFTC Commitments of Traders](https://www.cftc.gov/MarketReports/CommitmentsofTraders/HistoricalCompressed/index.htm): free; weekly from June 2006. Unverified.
- [Dr Gifuni's repository](https://github.com/gifuniluigi/ijof-wom_esui): free, no licence stated (cite and ask before redistributing). **Verified.** OPEC dates from [Känzig's file](https://github.com/dkaenzig/oilsupplynews). **Verified.**

**Method, trimmed plan.**
1. Vintage panel (weeks 1-4). From each MOMR and STEO (and free IEA issue) record current- and next-year demand forecasts, the previous figure, the revision, and OPEC's two production figures. Target 300 months, minimum 170. Two outcomes: each agency's own estimate 24 months later, and a common outside series. A complete dataset chapter.
2. Forecast evaluation (weeks 4-8). Bias and Mincer-Zarnowitz with HAC errors; RMSE and DM (HLN) against each other and no-change-in-growth; Coibion-Gorodnichenko regressions of errors on revisions; Nordhaus smoothing; a herding test. State that the effective bias sample is about 50 target-year paths.
3. Strategic bias (weeks 8-12). Regress the OPEC-minus-EIA gap and OPEC's revision on OPEC's stance (cutting, holding, raising; months to the next meeting; pledged cuts; the production gap), with oil-price and oil-market controls. Horizon test (optimism larger next-year), timing test (before versus after meetings), placebo (the EIA gap should not respond to OPEC's stance).
4. Market learning (weeks 12-16). On MOMR release days regress Brent returns and curve-slope changes on OPEC's revision surprise relative to the EIA, interacted with OPEC's trailing relative accuracy or a two-forecaster Bayesian posterior weight. Pre-register the likely null.
5. Text (weeks 16-19, optional). Score the MOMR demand section with his public dictionaries; test whether tone leads revisions by one to three months.
6. Economic value (weeks 19-22), pre-registered. A reliability-weighted combination forecast; one mean-reversion rule when the OPEC-EIA gap passes its rolling 90th percentile, Kelly-sized, after costs. Write-up weeks 22-26.

**MATLAB notes.** Text Analytics Toolbox (extractFileText) for PDFs; fallback R pdftools or hand entry of two to four numbers per report (10-15 hours). Statistics and Machine Learning Toolbox (fitlm, bootstrp), Econometrics Toolbox (hac, arima). DM from his repository plus the HLN correction; the Bayesian combination needs only normpdf. R fallback: pdftools, sandwich, lmtest, forecast (dm.test), quanteda.

**Week-1 check.** Confirm the earliest downloadable MOMR and that each demand table shows the previous month's forecast; download the STEO archive for the same months; test whether the IEA 2006 archive downloads free with the demand table; download three IEF PDFs. Proceed if at least 170 OPEC-EIA pairs can be built; if under 100, fall back to a 2020-2026 IEF-plus-Reuters panel.

**Pros.**
- All core data free and official; no terminal anywhere.
- Hundreds of monthly vintages for the revision, rigidity and release-day tests; the smaller effective bias sample is stated, not hidden.
- Five of the six steps are complete results; "honest noise" is as publishable as "shading".
- Squarely in Dr Gifuni's forecast-evaluation wheelhouse and topic 3; he can advise on every test and will like the text chapter.
- A live policy debate (the 2024-2026 IEA-OPEC divergence, including the Hormuz-shock disagreement) that journalists cover but no paper found has tested.
- The poker framing is exact: an interested player announces the strength of the hand; has the table learned to discount him?
- Methods (vintage panels, Mincer-Zarnowitz, DM, Coibion-Gorodnichenko, Bayesian combination) are exactly what quant-research interviewers probe.
- Low confounding compared with event studies: careful real-time data handling, not causal identification.

**Cons.**
- *Time.* Hand-extracting 170-300 reports with changing layouts; two to three weeks; use the two-numbers-per-report shortcut.
- *Data risk.* MOMR depth unverified; PDFs behind a form; IEA current numbers paywalled, so the three-way comparison may be 2020-2026 only.
- *Where you could get stuck.* Realised demand differs by agency definition and is revised heavily; measure errors against each agency's own later estimate and a common outcome or the "bias" is an artefact. The sign of OPEC's bias is not stable (most cautious in 2008, most bullish in 2022-26), so deliver horizon, timing and asymmetry results, not a sign. Monthly revisions are small against daily price noise, so the market chapter is likely a null.
- *How examiners might attack it.* "Fifty independent observations, not 300." "OPEC cuts when demand is weak, so your stance regressor is itself a demand forecast" (reverse causality; timing and placebo tests; modest language). "Cheap talk is a stretched theory" (motivation only).
- *If the result is null.* It works: "honest noise" plus the horse race, the learning test and the text test is a complete dissertation.
- *How much Dr Gifuni can help.* A great deal on evaluation and text. He has not published on fixed-event revision tests or cheap-talk theory; you learn those from Nordhaus, Clements and Coibion-Gorodnichenko.
- *Explaining it in an interview.* Easy: analyst-bias logic, vintages, Mincer-Zarnowitz, Bayesian weights. Expect the reverse-causality and effective-sample questions.
- Overlaps existing ideas 4 and 5 and D; competes with E and J for the policy-credibility slot.

**Fallback.** If no bias or no link to stance, report "honest noise" and let steps 2, 4 and 5 carry it. If extraction is slow, two numbers per report. If the archive is shallow, a 2020-2026 IEF-plus-Reuters panel emphasising the recent divergence. If demand fails entirely, the same panel supports a smaller paper on EIA-versus-OPEC supply forecasts or the production gap.

**Interview line.** "I treated OPEC's monthly demand forecasts as cheap talk from the player with the biggest stack, scored them vintage by vintage against the EIA and against OPEC's own later numbers, and tested whether the futures market has learned to discount the cartel's optimism."

**Prize case.** A sharp, novel question about a famous institution; a hand-built real-time dataset; textbook forecast evaluation; game theory and analyst-bias logic as motivation; a text chapter in the supervisor's methods; relevance to the 2024-2026 divergence; honest effective-sample statements; a null that is still a contribution.

**Judges' scores.** Originality 8.0, quant appeal 7.7, prize and mark 7.7, feasibility 5.7, Gifuni fit 7.3. Third for two passes, fourth for the third.

---

#### G. Pricing the Wednesday: the oil options market's price for one EIA report

**Question.** How much implied variance does the crude oil options market assign to a single scheduled EIA Weekly Petroleum Status Report? Is that price fair against the extra variance report days actually deliver (a scheduled-news variance risk premium)? Does the premium rise when commercial stocks are low relative to seasonal norms or when text-based oil uncertainty is high?

**The hook.** The Tuesday-to-Wednesday close is the only step of the week that removes an EIA report from OVX's 30-day window without changing the number of trading days in it. A free index and a calendar are enough to read off what traders pay for one Wednesday and to test whether they overpay.

**Why it is original.** Implied volatility falls after scheduled releases ([Ederington and Lee 1996](https://doi.org/10.2307/2331358), the methodological ancestor, for rates and FX). OVX falls on WPSR days ([López 2018](https://doi.org/10.1016/j.eneco.2018.04.040); [Nikkinen and Rothovius 2019](https://doi.org/10.1016/j.energy.2018.10.061); [Sharma 2017](https://openscholar.uga.edu/record/14104)) and has weekday effects ([Qadan and Idilbi-Bayaa 2021](https://doi.org/10.1016/j.resourpol.2020.101980)). Futures and options react to inventory surprises ([Miao, Ramchander, Wang and Yang 2018](https://doi.org/10.1002/fut.21850)); realised volatility is higher on report days ([Bu 2014](https://doi.org/10.1016/j.eneco.2014.05.015); [Ye and Karali 2016](https://doi.org/10.1016/j.eneco.2016.08.011)). Event variance premia exist for FOMC and earnings in equities and rates ([Londono and Samadi 2023](https://doi.org/10.17016/IFDP.2023.1376); [Wright 2020](https://www.nber.org/papers/w28306); [Alexiou, Goyal, Kostakis and Rompolis 2025](https://doi.org/10.1093/rof/rfaf016); [Dubinsky, Johannes, Kaeck and Seeger 2019](https://doi.org/10.1093/rfs/hhy060)). Unconditional energy variance premia are negative ([Trolle and Schwartz 2010](http://infoscience.epfl.ch/record/148475)). What was not found in the literature: the implied variance of one report in variance units, identified by the Tuesday-to-Wednesday versus Monday-to-Tuesday difference with holiday-week placebos; that implied event variance set against realised extra variance to form a scheduled-news variance risk premium for a commodity; conditioning on inventories and on text uncertainty, including an out-of-sample test of Dr Gifuni's public uncertainty indices on a second-moment target; and a Kelly-sized synthetic variance position. The drop itself is a replication and must be presented as such.

**Why Dr Gifuni will find it interesting, and what he can advise on from public work alone.** It sits in his stated interest in the uncertainty effects of oil price spikes and in forecast evaluation. His IJF paper used OVX as a benchmark and concluded text uncertainty indices have "inherent weaknesses" for the price level; step 6 re-tests those same public indices on the forecast error of implied event variance, a respectful extension of his own negative result. He presented at the EIA Financial Markets Workshop in 2025, so the EIA report is natural ground. His evaluation toolkit is what steps 4-6 use. He has not worked on options or variance premia, so the derivatives logic comes from the literature; his help is on uncertainty measures, evaluation and framing.

**Why a quant interviewer will like it, and what it proves about you.** Whether a known, scheduled risk is priced correctly is how event-volatility desks think. The interviewer can probe additivity of event and diffusive variance, what the VIX-style interpolation does to the report count, why Tuesday-to-Wednesday versus Monday-to-Tuesday is clean, separating resolution from news with the Wednesday intercept, the theory-of-storage prediction, HAC inference with persistent regressors, the limits of a synthetic variance swap without option prices, and Kelly under estimation error. Skills shown: event studies, GARCH and HAR, HAC inference, placebo design, out-of-sample DM tests, bet sizing, a self-built release calendar. It connects to your delta-hedging simulator on GitHub.

**Data.**
- [Cboe OVX](https://fred.stlouisfed.org/series/OVXCLS): free; daily from 10 May 2007. Unverified (snippets).
- [EIA NYMEX WTI contracts 1-4](https://www.eia.gov/dnav/pet/pet_pri_fut_s1_d.htm): free; contract 1 from 1983, ending 5 April 2024. Unverified.
- [WTI spot, FRED DCOILWTICO](https://fred.stlouisfed.org/series/DCOILWTICO): free; daily 1986 to present, used to extend realised variance past April 2024. **Verified** via Alpha Vantage.
- [EIA WPSR release schedule](https://www.eia.gov/petroleum/supply/weekly/schedule.php): free; Wednesday 10:30 ET, holiday weeks shift to Thursday; only the current year listed, so 2007-2025 shifts must be reconstructed from archived snapshots. Unverified.
- [EIA weekly commercial crude stocks](https://www.eia.gov/petroleum/supply/weekly/): free; weekly from 1982. Unverified.
- [FOMC calendars](https://www.federalreserve.gov/monetarypolicy/fomccalendars.htm) and OPEC dates from [Känzig](https://github.com/dkaenzig/oilsupplynews): free. Känzig **verified**.
- [Dr Gifuni's repository](https://github.com/gifuniluigi/ijof-wom_esui): free, no licence (cite and ask); uncertainty indices 1982-2021:06, OPU 1969-2023:12, DM code. **Verified.**
- [Caldara-Iacoviello GPR](https://www.matteoiacoviello.com/gpr.htm) (daily file unverified) and [FRED USEPUINDXD](https://fred.stlouisfed.org/series/USEPUINDXD): free. Unverified.
- [Investing.com EIA inventories calendar](https://www.investing.com/economic-calendar/eia-crude-oil-inventories-75): free to view; depth and terms unchecked. Alpha Vantage historical options: **not free**, excluded.

**Method, trimmed plan.**
1. Calendar and OVX anatomy (weeks 1-3). For every trading day from May 2007 record WPSR release day (Wednesday or holiday Thursday), API release, FOMC and OPEC days, and the trading-day and calendar-day counts in the forward 30-day window. A reusable dataset.
2. Resolution drop by difference-in-transitions (weeks 3-5). Regress the daily change in OVX squared on transition dummies; one report's implied variance is the Tuesday-to-Wednesday change minus the Monday-to-Tuesday change (both lose one calendar day and keep 22 trading days; only the first loses a report), Newey-West errors, FOMC and OPEC days dummied, March-June 2020 excluded. Placebo: in holiday weeks the drop must move to Wednesday-to-Thursday.
3. Resolution versus news (weeks 5-6). On report days regress the change in OVX squared on the absolute inventory surprise (seasonal ARIMA forecast error, checked against Investing.com) and the report-day squared return; the intercept is the implied variance of a report net of news.
4. Realised counterpart (weeks 6-8). Excess variance of report days from Tuesday-close-to-Wednesday-close returns in a GARCH(1,1) and a HAR model with a report-day dummy; Henry Hub Thursdays as a check.
5. Scheduled-news variance risk premium (weeks 8-9). Implied event variance minus realised event variance against the ordinary-day premium; test whether the ratio exceeds one with block-bootstrap and HAC inference; the VIX-FOMC analogue as validation.
6. Mechanisms and the text test (weeks 9-11). Regress the premium on stocks relative to the five-year seasonal average, the OVX level, GPR, EPU and Dr Gifuni's text uncertainty indices; then a recursive out-of-sample test of whether text uncertainty predicts realised-minus-implied event variance, with DM tests using his code.
7. Economic value (weeks 11-13). A synthetic 30-day variance position entered at Tuesday close only when the estimated premium is positive, fractional Kelly, bid-ask and jump haircut, rule fixed on 2007-2016 and tested on 2017-2026. State that without option prices this is an upper bound on the edge.

**MATLAB notes.** Statistics and Machine Learning Toolbox (fitlm, regress) and Econometrics Toolbox (garch, egarch, hac, arima). Calendar logic with datetime and hand-typed holiday lists; HAR is OLS; DM, block bootstrap and fractional Kelly are short functions. No Financial or Text Analytics Toolbox. R fallback: fredr, rugarch, sandwich and lmtest, forecast::dm.test.

**Week-1 check.** Download OVX, EIA contracts 1-4 and FRED WTI spot. Reconstruct WPSR release dates 2007-2026 (expect about 980 releases, roughly 150-190 holiday Thursdays). Compute the mean log change in OVX for each weekday transition. GO if (a) Tuesday-to-Wednesday minus Monday-to-Tuesday is negative with |t| above 2, (b) in holiday weeks the drop moves to Wednesday-to-Thursday, (c) the size is plausible (a report day with twice a normal day's variance implies roughly a 2-2.5% fall in OVX, about 0.6-1.0 points at OVX = 35). If the drop is absent or wrong-signed, pivot to the realised-only version.

**Pros.**
- Data cannot fail: OVX since 2007, EIA futures to April 2024, FRED spot to 2026 and weekly stocks since 1982 are all free and confirmed to exist; a working dataset is on disk in week 1.
- Every step is a standalone result, so a null (the market prices Wednesdays fairly) is a clean finding about efficient pricing of scheduled commodity news.
- The identification is simple enough to verify on a whiteboard and has a respectable ancestor in Ederington-Lee.
- It extends the supervisor's own public negative result to a second-moment target with his public indices and code, so he has a personal stake.
- Fits your poker framing: the market posts odds on a scheduled event; are the odds fair and how much should you bet?
- Options and event-variance language signals derivatives literacy without paid data; the self-built release calendar is a dataset no one else appears to have.
- Workload is about 12 weeks of standard toolbox work plus writing.
- Natural gas Thursdays and the VIX-FOMC analogue give two robustness checks without new methods.

**Cons.**
- *Time.* The lightest of the strong ideas. Reconstructing 2007-2025 holiday-shifted release dates is tedious (2-3 days).
- *Data risk.* Very low. EIA futures end on 5 April 2024, so 2024-2026 realised variance uses WTI spot and the splice must be tested. Consensus forecasts are not free, so the surprise is a model-based proxy an examiner may question.
- *Where you could get stuck.* OVX is interpolated from two USO option expiries, so the window's report count is fractional; the clean identification is the within-week transition. OVX is built on USO, not WTI futures; USO's roll strategy and April 2020 restructuring (OVX at 325) weaken the basis; exclude March-June 2020. The Tuesday-close-to-Wednesday-close window bundles the API report and occasional FOMC decisions with the EIA release. OVX squared is near-unit-root; everything must be in changes with HAC errors or the examiner will call it spurious.
- *How examiners might attack it.* "The resolution drop is already published and the calendar method is Ederington-Lee transplanted." Lead with the event-level premium, the conditioning and the Kelly step or risk a replication label. Some economists will read it as finance unless the theory-of-storage conditioning and the forecasting chapter carry weight.
- *If the result is null.* It works: "the options market prices scheduled inventory news efficiently", with the VIX-FOMC analogue showing the method detects a premium where one is known to exist.
- *How much Dr Gifuni can help.* Least of the strong ideas. Nothing on options or variance premia; help on uncertainty measures and evaluation.
- *Explaining it in an interview.* Excellent; everything is first-principles. The trading step is a synthetic variance swap ignoring bid-ask and jump error; present it as an upper bound.

**Fallback.** If the implied per-report variance cannot be estimated with acceptable precision, the dissertation becomes (1) the realised event variance of EIA report days 1990-2026 for oil and 1994-2024 for gas, how it depends on inventories and text uncertainty, and whether text uncertainty predicts it out of sample; (2) an honest "the options market prices scheduled inventory news efficiently" finding, with the VIX-FOMC analogue run to show the method works.

**Interview line.** "I used the fact that the Tuesday-to-Wednesday close is the only step of the week that takes an EIA report out of OVX's 30-day window without changing its trading-day count to back out what the oil options market charges for one Wednesday, then checked whether that price is fair against the variance report days deliver, whether it rises when the tanks are empty, and how a Kelly bettor would have traded the gap."

**Prize case.** A one-sentence question; a transparent identification verifiable by hand; a result at every stage; careful econometrics (changes not levels, HAC errors, placebos, pre-registered rule, out-of-sample DM tests); a contribution stated precisely against named papers including the two that already show the drop. It bridges energy economics, forecasting and finance. A null reads as maturity, not failure.

**Judges' scores.** Originality 6.0, quant appeal 9.0 (highest), prize and mark 7.0, feasibility 8.7 (highest), Gifuni fit 6.0 (lowest of the kept ideas). All three passes named it the cannot-fail reserve; one ranked it third overall.

---

#### K. The Forecaster's Tell: EIA Prose versus the Options Band (with C, Words Against Numbers, folded in)

**Question.** Every month the EIA's Short-Term Energy Outlook (STEO) prints a WTI point forecast, a prose section and, since October 2009, a 95% band taken from NYMEX options and centred on the NYMEX futures price. When the EIA hedges more in its crude-oil prose, is its own point forecast further off, does the realised price break the band more often, and is realised variance higher relative to OVX over the following month, beyond what band width, OVX and the EIA's own deviation from the futures price it reports already say? Are the published bands calibrated, and does re-centring them on the EIA's own number rather than the futures price change that? Henry Hub is the replication.

**The hook.** A government forecaster writes a number, an essay about the number and the market's odds around it every month. I test whether the essay knows what the spreadsheet does not, whether the printed odds hold up once re-centred on the forecaster's own number, and I express the difference as the growth rate a Kelly bettor would earn if offered the market's odds.

**Why it is original.** No published text analysis of the STEO was found, and no published coverage test of the EIA's options-implied bands was found: EIA promised back-testing in its [2009 supplement](https://www.eia.gov/outlooks/steo/special/pdf/2009_sp_05.pdf) and never published it, and a 2026 Chalmers thesis on STEO errors ([Agovic 2026](https://hdl.handle.net/20.500.12380/310948)) even states the STEO has no uncertainty measure. The narrative-versus-numbers literature covers central-bank macro forecasts and tone rather than hedging: [Sharpe, Sinha and Hollrah](https://doi.org/10.1016/j.ijforecast.2022.04.008) on Greenbook tonality (who also find "uncertainty" words rare and uninformative); [Clements and Reade (2020)](https://doi.org/10.1016/j.ijforecast.2019.08.013) on Bank of England narratives; [Ericsson (2016)](https://doi.org/10.17016/IFDP.2015.1152); [Filippou, Mitchell and Nguyen (2023)](https://doi.org/10.26509/frbc-wp-202320) and [Müller (2022)](https://doi.org/10.1007/s00181-021-02100-9) on forecasters' narratives. None benchmarks text against a market-implied distribution or targets the second moment. Two prior results you must engage head-on. First, the band is a risk-neutral interval and the oil variance risk premium is negative ([Prokopczuk, Symeonidis and Wese Simen 2017](https://doi.org/10.1016/j.jbankfin.2017.05.003); Trolle and Schwartz 2010), so over-coverage in calm years is expected, not a discovery. Second, [Brown, Cakir Melek, Matschke and Sattiraju (2023, "The Missing Tail Risk in Option Prices")](https://www.kansascityfed.org/Research%20Working%20Papers/documents/9442/rwp23-02browncakirmelekmatschkesattiraju.pdf) already show realised oil prices land in the left tail more often than option-implied densities predict. Your distinct objects are the EIA's own published bands (not a re-estimated density), the re-centring test, regime variation in coverage, and text written by the forecaster about its own forecast. [Baumeister, Huber, Lee and Ravazzolo (2025, JAE)](https://doi.org/10.1002/jae.70018) compare real-time Henry Hub forecasts with expert and futures benchmarks, so the gas point-accuracy scorecard is largely redundant; the gas leg is calibration and text. Numeric EIA evaluations ([Sanders, Manfredo and Boris 2009](https://doi.org/10.1016/j.eneco.2008.08.010); [Baumeister and Kilian 2014](https://doi.org/10.1111/iere.12074); Garratt, Petrella and Zhang 2023) and futures-as-forecasts work ([Chinn and Coibion 2014](https://doi.org/10.1002/fut.21615); [Ellwanger and Snudden 2023](https://doi.org/10.5547/01956574.44.4.rell)) set the benchmarks. [Gifuni (2026, IJF)](https://doi.org/10.1016/j.ijforecast.2025.09.001) is the negative result on uncertainty text that this re-tests.

**Why Dr Gifuni will find it interesting, and what he can advise on from public work alone.** Text-as-data for oil price forecasting is the subject of his PhD and IJF paper, and this tests the open corner of his own negative result: uncertainty language failed for the price level; does it work for the second moment and for a forecaster's own errors? The evaluation toolkit is his and public (DM, CRPS, log score, PCA aggregation, recursive standardisation, crisis sub-samples, MATLAB code in his repository). The oil-section versus gas-section comparison transplants his SARB topic-level idea to energy, and Henry Hub brings gas into his portfolio as his brief asks. He can advise on dictionary pitfalls, index construction, HAC with overlapping horizons and presenting a null as a finding. He knows the STEO audience from his 2025 EIA workshop talk. His co-author Francesco Ravazzolo is on the closest gas-forecasting benchmark paper, a supervision asset. TOSI (public to 2023) is offered as a newspaper control so the project complements his corpus. He has not published on PIT tests, Kelly or encompassing; you own those.

**Why a quant interviewer will like it, and what it proves about you.** A calibration-of-official-forecasts question with a market benchmark: is there information in words beyond the options-implied distribution, and are the printed odds honest? Objects a quant can probe: implied versus realised variance and the variance risk premium, interval coverage tests, PIT histograms, Mincer-Zarnowitz, forecast encompassing against the market, HAC inference with overlapping horizons, Kelly growth as a unit of measurement, and a competitor signal (the EIA's own point-minus-futures bet) so the text must earn its place. Skills proven: PDF-to-text pipeline, dictionary measures with hand validation, forecast-evaluation econometrics, density scoring, realised-variance estimation, rules fixed in advance, a null reported as a result. Nothing is a black box.

**Data.**
- [EIA STEO archive](https://www.eia.gov/outlooks/steo/archives/): free; monthly PDFs from February 1997, quarterly to 1983, Excel base files for 2024-2026 only; October 2026 issue released 6 October 2026. Monthly PDF existence **verified by the fact-checker**; contents unverified.
- [Zenodo PUDL mirror of the STEO archive](https://zenodo.org/records/17622298): free; PDFs and XLS files zipped per year plus the uncertainty-chart PDFs; about 1.1 GB. Existence **verified by the fact-checker**.
- EIA Market Prices and Uncertainty Report (MPUR), the monthly STEO supplement since October 2009, reached from the archive page: free. **The numeric source for the band bounds**: each issue states lower and upper 95% bounds for two forecast months (for example August 2015: November 2015 $34-$64/b; December 2016 $27-$103/b) and the NYMEX futures price at the band's centre. WTI and Henry Hub only; no Brent bands; no interval in thin-option months. The [archived chart PDFs](https://www.eia.gov/outlooks/steo/archives/uncertainty/uncertainty_past_wti.pdf) carry labels only. Band design **verified by the fact-checker**; issue-by-issue coverage unverified.
- STEO-reported NYMEX futures (the band's centre): the as-of-cutoff market benchmark and the only one that exists beyond contract 4 or after 5 April 2024. [EIA NYMEX tables, contracts 1-4](https://www.eia.gov/dnav/pet/pet_pri_fut_s1_d.htm) to 5 April 2024 are the horizon 1-4 cross-check (stop date **verified**).
- [Cboe OVX, FRED OVXCLS](https://fred.stlouisfed.org/series/OVXCLS): free; daily from 10 May 2007. Unverified.
- [WTI spot](https://fred.stlouisfed.org/series/DCOILWTICO), [Brent](https://fred.stlouisfed.org/series/DCOILBRENTEU), [Henry Hub](https://fred.stlouisfed.org/series/DHHNGSP) on FRED: free. WTI and Henry Hub **verified** via Alpha Vantage.
- [Loughran-McDonald Master Dictionary](https://sraf.nd.edu/loughranmcdonald-master-dictionary/): free for academic research (academic-use licence). Unverified.
- [Dr Gifuni's repository](https://github.com/gifuniluigi/ijof-wom_esui): free, no licence stated; DM, CRPS, log-score and PCA code; TOSI and dictionaries. **Verified.**
- [World Bank Commodity Markets Outlook forecasts](https://www.worldbank.org/en/research/commodity-markets/price-forecasts): free; from November 1994. Extension only.

**Method, trimmed plan.** What actually gets written is steps 1-4; step 5 is kept short; the rest is appendix or extension.
1. Corpus and vintage dataset (weeks 1-7). Download every monthly STEO PDF 1997-2026 (Zenodo as backup), convert to text, split into sections by vintage-specific headers; extract WTI and Henry Hub forecasts at horizons 1-12, realised monthly averages, the EIA forecast minus the STEO-reported futures price, and from October 2009 the MPUR band bounds and futures centre for the horizons stated. Cross-check horizons 1-4 against EIA's NYMEX tables to April 2024. A documented 30-year, two-commodity dataset (EIA material is public domain, so it can go on GitHub).
2. Short scorecard (weeks 7-9). MSPE ratios against no-change and the STEO-reported futures; Mincer-Zarnowitz with Hodrick or Newey-West (h-1) errors; DM with the HLN correction; one forecast-encompassing regression per horizon for which the STEO reports a futures price; Nordhaus revision tests; sub-samples 2008-09, 2014-16, 2020, 2022 gas, 2026.
3. Band calibration, re-centring and Kelly (weeks 9-13), the headline chapter. Pre-state the expected pattern: coverage above 95% in calm years, breaches clustered in the left tail in 2008-09, 2014-16 and 2020. Reconstruct the lognormal density from each published band; compute 95% coverage, PIT histograms with Berkowitz and Knüppel tests, log score and CRPS; re-centre the same volatility on the STEO point forecast and score again; compare with a GARCH(1,1) density centred on the STEO-reported futures and a historical-volatility density around no-change. Report average log-score gaps as Kelly growth with block-bootstrap intervals. The five-line derivation for the whiteboard: (a) let p be your predictive density and q the benchmark's, and suppose a counterparty quotes fair odds from q, so a £1 stake on outcome y returns 1/q(y); (b) a Kelly bettor stakes p(y) on each outcome; (c) if y occurs, wealth multiplies by p(y)/q(y); (d) expected log growth is the sum over y of p(y) log[p(y)/q(y)], the Kullback-Leibler divergence, never negative (Kelly 1956; Cover and Thomas, chapter 6); (e) its sample analogue is the average log p(y_t) minus log q(y_t), the log-score gap. So the gap is the growth rate a Kelly bettor would earn if offered the benchmark density as odds, before costs. It is an identity, not a tradeable profit, because nobody quotes those odds.
4. The tell (weeks 12-20). Text indices from the crude-oil and gas sections: hedging density (Loughran-McDonald uncertainty plus weak-modal words per 100 words), commitment density, tone, readability, revision language; hand-validate 30-50 passages; standardise recursively. Regress absolute and squared error at horizon h and a band-breach dummy on the hedging index, controlling for log band width, OVX, lagged realised volatility, the absolute gap between the EIA forecast and the STEO-reported futures, and a recession dummy; HAC errors with bandwidth h-1; one pre-specified primary horizon (the shortest MPUR-stated horizon); orthogonalise text against the point-forecast revision; TOSI as a control; oil versus gas.
5. Variance risk premium (weeks 14-16, short). Forward realised WTI variance over 22 and 63 trading days after each release on OVX squared and the hedging index; does hedging predict the variance-swap payoff proxy; out-of-sample R-squared against HAR from 2015; DM.
6. Extensions only. An out-of-sample text-adjusted forecast with Clark-West; one trading rule written down before returns are touched, with a White reality check; the World Bank narrative; PCA aggregation of text indices as he builds TOSI.

Chapter budget, 10,000 words: introduction 900; literature (narrative forecasting, EIA evaluations, option-implied densities and the variance risk premium, Gifuni's text-uncertainty result) 1,400; data (vintage dataset, MPUR bands, STEO-reported futures, text extraction) 1,500; point-forecast scorecard 1,000; band calibration and re-centring 2,200; the text tell 1,800; conclusion and policy note 700; abstract and limitations 500.

**MATLAB notes.** Statistics and Machine Learning Toolbox (fitlm, regress, bootstrp, pca, logncdf, chi2gof) and Econometrics Toolbox (hac for Newey-West and Hansen-Hodrick; garch). Text Analytics Toolbox convenient (extractFileText, tokenizedDocument) but not required: pdftotext then fileread, regexp and ismember, a 30-line readability function. Christoffersen, Berkowitz, Mincer-Zarnowitz, HAR and Hodrick errors are short functions; DM, CRPS and log score from his repository. R fallback: pdftools, quanteda, sandwich/lmtest, forecast::dm.test, rugarch, MCS.

**Week-1 check.** Download about 24 STEO PDFs spanning 1997-2026 and confirm the crude-oil section can be isolated in each format era, that 1997-2003 PDFs are text not scans, and that the hedging-word share varies across issues (if tiny, pivot the primary text measure to complexity, tone and revision language). Count how many MPUR issues since October 2009 state numeric bounds, for which horizons, and whether each states the futures centre; confirm the charts continued into 2026. Download EIA's NYMEX tables to 5 April 2024 as the horizon 1-4 cross-check. Download OVXCLS and DCOILWTICO and match three forecast paths to realised prices. Read Baumeister, Huber, Lee and Ravazzolo (2025), Brown et al. (2023), Agovic (2026) and the EIA's own evaluations, and write one paragraph on what K adds to each. Pass: at least 300 issues with extractable text and price tables, and numeric band values with a stated futures centre for at least 150 issues.

**Pros.**
- Point forecasts and narrative text cannot fail: monthly PDFs verified from February 1997, quarterly to 1983, Zenodo mirror. The two data risks (numeric band values, the futures benchmark) are bounded by what the MPUR reports.
- Each step is a complete result: the dataset, the coverage audit (no published audit found, checked against EIA's own evaluations and Agovic 2026), the efficiency tests through 2026 and the descriptive history all stand if the text carries no signal.
- A one-sentence story for a quant: words versus the options market's own distribution, with the variance risk premium behind it.
- Uses the supervisor's public toolkit and tests an open corner of his own negative result; adds Henry Hub, which his brief names and his papers lack.
- Dictionary methods are transparent and defensible to mainstream examiners; the 2014, 2020, 2022 and 2026 shocks give dramatic out-of-sample episodes.
- A null ("the EIA's words add nothing beyond the band") is a clean finding in dialogue with Gifuni and with Sharpe et al.
- The self-consistency framing (words, numbers and printed odds from one institution) is a new question, provided the market benchmark and the published band stay central.
- Pre-stating the expected direction of the band result shows out-of-sample discipline even without a trading rule.
- Two public goods for GitHub, with licensing stated: the vintage dataset (EIA public domain, FRED) can be shared freely; a tone index built with the Loughran-McDonald dictionary (academic-use licence) or his dictionaries (no licence stated) needs permission before redistribution.
- Fully explainable in an interview: word shares, OLS with HAC, DM, PIT, lognormal densities, Kelly.

**Cons.**
- *Time.* As first drafted (C plus K) it was two dissertations; the trimmed plan fixes that. PDF extraction across several STEO redesigns (quarterly 1985-96, redesigns around 2004, 2011, 2016, 2021) is messy; band values come from the MPUR text, two horizons per issue, manual work you will dislike; budget two to three weeks.
- *Data risk.* Low for existence, moderate for detail. Band values are not in a numeric table; the market benchmark is the futures price the STEO itself reports, so it exists only for the horizons and months the STEO chose to report; EIA's futures tables cover contracts 1-4 and stop on 5 April 2024. Pre-2010 Excel tables are unconfirmed, so early forecasts come from PDF tables.
- *Where you could get stuck.* EIA house style may leave little variation in hedging words; the week-1 variance check decides. About 175-200 band months with overlapping horizons give low power; Hodrick or Newey-West errors and block bootstraps are mandatory and results may be marginal. Tone and the point forecast come from the same analysts, so the orthogonalised residual is small; the expected text result is a null. The band is centred on the futures price, not the EIA forecast, so coverage of the band and accuracy of the point forecast are separate tests.
- *How examiners might attack it.* "Hedging responds to current volatility, so this is endogenous" (claim incremental predictive content, not causality). "The tone-on-error regression is the Greenbook design on a new forecaster." "The EIA band is the market's density; over-coverage is the known negative variance risk premium, and Brown et al. already show the left tail" (that is why the headline is re-centring and regime variation on the EIA's own published bands, with the expected direction stated first). "Baumeister, Huber, Lee and Ravazzolo already compare Henry Hub forecasts with futures" (hence the gas leg is calibration and text). "A Chalmers thesis already tabulates STEO errors" (the band audit must carry the fallback).
- *If the result is null.* It works: "Scoring the EIA as a bettor", with the vintage dataset, what we believe is the first coverage test of the EIA's own published bands with re-centring and regime results as the headline, and a text null consistent with Gifuni and Sharpe et al.
- *How much Dr Gifuni can help.* A great deal: dictionaries, index construction, evaluation, overlapping-horizon inference, presenting a null. Not on PIT tests, Kelly, encompassing or variance-risk-premium mechanics; his co-author Ravazzolo wrote the closest gas benchmark.
- *Explaining it in an interview.* Requires fluency in HAC inference, Mincer-Zarnowitz, interval coverage, the variance risk premium and the Kelly identity, each derivable from first principles. The interviewer may call the text chapter "cute"; lead with the re-centring-plus-Kelly chapter. Any long-variance trade is a thin illustration against a negative average premium and should not be a headline.
- Overlaps existing idea 2 in the Kelly device and the options-density object; existing 2 is absorbed.

**Fallback.** If the text predicts nothing, the dissertation becomes "Scoring the EIA as a bettor": what we believe is the first calibration audit of the EIA's published WTI and Henry Hub bands 2009-2026 with re-centring and regime variation as the headline; an efficiency and revision-smoothing study through 2026 that goes beyond the Chalmers error tables; a documented null on institutional hedging language. If pre-2005 PDFs are unreadable, run text on 2005-2026 and numbers on 1997-2026. If band values are recoverable for too few issues, restrict calibration to the horizons the MPUR states and say so. Where an issue states no futures price for a horizon, drop that horizon from the encompassing test rather than substitute a different curve. If hedging-word variance is tiny, pivot the text measures to complexity, tone and revision language.

**Interview line.** "I scored a government forecaster's essay against its own numbers and the futures price it printed, tested whether its published odds changed once re-centred on its own forecast, and expressed the log-score gap as the growth rate a Kelly bettor would earn if offered the market's density as odds, before costs."

**Prize case.** A dataset that no paper found has built, from a source every energy economist reads; one sharp question with pre-specified tests and a pre-stated expected direction; classic forecast-evaluation econometrics with correct overlapping-horizon inference; an audit of an official forecaster's published uncertainty bands that we believe to be the first, positioned against Brown et al.; policy relevance to how official forecasters should communicate uncertainty after 2022 and 2026; honest nulls; reproducible MATLAB from public files. It uses the evaluation toolkit of the forecasting literature the supervisor publishes in.

**Judges' scores.** K: originality 7.0, quant appeal 6.7, prize and mark 7.0, feasibility 7.0, Gifuni fit 9.0 (average rank 6.3). C before folding: 6.7, 6.7, 6.7, 6.0, 9.0 (average rank 9.0). The passes preferred K and advised folding C's re-centring and encompassing tests into it.

---

#### E. The Government Put: Scoring Forty Years of SPR Promises

**Question.** When Washington announces an SPR release, exchange or repurchase, does the oil market price the barrels announced or the barrels the Department of Energy's forty-year record says it will deliver? Did the quantity-limited $67-72 refill band of October 2022 leave the footprint of a credible floor in the deferred WTI curve, fading as the purchasing budget was spent and as DOE itself bought above the band?

**The hook.** In October 2022 the US government wrote a put on WTI struck at $67-72 with a notional of about five billion dollars. I built what I believe is the first ledger of what the SPR promised versus what it delivered since 1985, tested whether traders learned to discount the announcer, and asked whether a put the writer could barely fund was ever priced.

**Why it is original.** The SPR literature estimates average price effects with structural VARs ([Kilian and Zhou 2020](https://doi.org/10.1002/jae.2798); [Stevens and Zhang 2021](https://doi.org/10.5547/01956574.42.6.rste)) or announcement event studies that take announced volumes at face value ([Demirer and Kutan 2010](https://doi.org/10.1016/j.eneco.2010.06.006); [Stevens 2014](https://are.berkeley.edu/sites/default/files/job-candidates/paper/The%20Strategic%20Petroleum%20Reserve%20and%20Crude%20Oil%20Prices_0.pdf); [Kelly 2023](https://www.atu.edu/business/jbao/fall2023/202302%2005%20Kelly.pdf) on equities). [Newell and Prest (2017)](https://www.nber.org/papers/w23974) simulate releases in a VAR. [Razek et al. (2023)](https://ideas.repec.org/a/eee/jrpoli/v86y2023ipbs0301420723007730.html) and [Conte (2022)](https://soar.suny.edu/entities/publication/33cf349c-57de-4bde-b9da-04b116df64f1) are the only work on 2021-22. Theory: [Salant (1983)](https://www.rand.org/pubs/papers/P6766.html) on speculative attack against a finite buffer stock; [Svensson (1991)](https://www.nber.org/papers/w3394) on target-zone credibility, applied only to exchange rates; [Ahn (2012)](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2025228) on SPR and cartel deterrence. [Treasury press release jy0887](https://home.treasury.gov/news/press-releases/jy0887) gives an elasticity-based estimate of the 2022 releases. No paper found has assembled an announce-versus-award-versus-deliver ledger and scored DOE as a forecaster of its own actions, tested whether announcement-day reactions per barrel scale with a real-time credibility posterior, treated the refill band as a Salant buffer-stock floor whose credibility depends on remaining reserves, or covered the January 2023 rejected bids, the 2024 above-band purchases, the 2025 pledge funded with $171m, or the March 2026 172 mb exchange.

**Why Dr Gifuni will find it interesting, and what he can advise on from public work alone.** It is topic 3 of his brief almost word for word (strategic response of policy makers to a commodity price crisis) and uses his Brexit paper's design: dated policy announcements, daily reactions, placebo dates. The ledger chapter is forecast evaluation in his language: announced volumes are DOE's forecasts of its own deliveries, scored with bias tests, Mincer-Zarnowitz and DM. The optional text step scores DOE releases with his dictionaries and re-tests his finding that uncertainty language forecasts poorly. His Kilian-Baumeister training means he knows Kilian-Zhou's critique of high-frequency identification. He has no SPR or options-theory work, so advice on the Salant chapter will be generic.

**Why a quant interviewer will like it, and what it proves about you.** The abstract reads as an option and credibility problem: a writer with limited notional, a strike, a market that should price the probability of exercise, and an announcer whose record can be scored. It shows a dataset no paper found uses, a clean event study with HAC and bootstrap placebos, a beta-binomial credibility tracker derivable on a whiteboard, a limited-reserves attack model turned into a testable fade-out hypothesis, and two pre-registered Kelly-sized rules whose honest failure is reported as a result. Skills proved: time-series econometrics, event-study design, Bayesian updating, options and term-structure reasoning, out-of-sample discipline.

**Data.**
- [DOE History of SPR Releases](https://www.energy.gov/hgeo/opr/history-spr-releases): free; every drawdown, exchange, test sale and mandated sale 1985 to September 2025 with volumes. Unverified.
- [DOE Historical SPR Oil Sales and Exchanges (2018)](https://www.energy.gov/sites/prod/files/2018/08/f54/Historical%20SPR%20Oil%20Sales%20and%20Exchanges_Aug%202018.pdf) and annual SPR reports: free; sale-by-sale 1985-2018. Unverified.
- [DOE CESER press releases](https://www.energy.gov/ceser/strategic-petroleum-reserve): free; solicitations and awards December 2022-2026. Unverified.
- SPR Petroleum Account balance ([CRS Insight IN12542](https://www.everycrsreport.com/reports/IN12542.html), DOE budget justifications): free; dollars available by fiscal year. Unverified.
- [EIA weekly SPR stocks, FRED WCSSTUS1](https://fred.stlouisfed.org/series/WCSSTUS1): free; weekly from August 1982. Unverified.
- [EIA NYMEX WTI contracts 1-4](https://www.eia.gov/dnav/pet/pet_pri_fut_s1_d.htm): free; daily 1983 to 5 April 2024 (**verified** stop date); covers the band regime to the April 2024 pause.
- WTI and Brent spot via Alpha Vantage: free; WTI 1986 to 6 October 2026. **Verified.**
- Continuous front-month WTI after April 2024 ([Yahoo CL=F](https://finance.yahoo.com/quote/CL%3DF/history)): free; individual contract months are not reliably free. Unverified; week-1 item.
- [OVX](https://fred.stlouisfed.org/series/OVXCLS) and [CFTC positions](https://www.cftc.gov/MarketReports/CommitmentsofTraders/HistoricalCompressed/index.htm): free. Unverified.
- White House fact sheets and [Treasury jy0887](https://home.treasury.gov/news/press-releases/jy0887): free; band wording confirmed only through secondary quotes. Unverified.

**Method, trimmed plan.**
1. Build the ledger (weeks 1-4). For every SPR action 1985-2026 record announcement date, announced volume, award date and volume, delivered volume from weekly EIA stocks, delivery window, instrument type and any price band. Delivery ratios by type; Mincer-Zarnowitz of delivered on announced with HAC errors; a shortfall model conditioning on the price move between announcement and bid date, so market-driven shortfalls are separated from discretionary ones.
2. Event study (weeks 4-8), Brexit template. Daily front-month WTI, contract 1-4 spreads (to April 2024), OVX and weekly positions around announcement, award and first-delivery days, by instrument type, with signed predictions from Stevens-Zhang; HAC errors, bootstrap placebo dates, pre-trend checks.
3. Credibility pricing (weeks 8-11). A real-time beta-binomial posterior that an announcement will be delivered as stated, updated only with information public at each date; regress the announcement-day reaction per barrel on the posterior and instrument type; test whether reactions shrank after the January 2023 rejection and 2024 above-band purchases.
4. Limited-reserves floor test (weeks 11-15), framed by Salant and Krugman-Rotemberg, not Svensson's arbitrage: violation counts against placebo bands; realised variance and drift on distance to the floor; the new test interacting the floor footprint with the remaining Petroleum Account balance and DOE's above-band purchases, predicting fade-out; OVX near the floor.
5. Economic value (weeks 15-18), pre-registered. Rule A "fade the announcement"; Rule B "sell the put" (long WTI within $5 of the floor during the band regime). Kelly-size each, bootstrap Sharpe intervals, after costs.
6. Out-of-sample live test (weeks 18-22). Write down in advance what the ledger and posterior predict for the March 2026 exchange's drawdown and return legs and the 2025-26 solicitations; compare with weekly EIA stocks through March 2027; score the January 2025 fill-to-the-top pledge against the 1 mb actually bought. Write-up weeks 22-26.

**MATLAB notes.** Statistics and Machine Learning Toolbox (fitlm, bootstrp, betapdf, ksdensity); Econometrics Toolbox (hac, garch, adftest); DM from his repository; regexp for the optional hedging score. R fallback: sandwich, lmtest, forecast, rugarch, boot, quanteda.

**Week-1 check.** Open the DOE history page, the 2018 PDF, the FY2017-2025 annual reports and the 2022-26 press releases; confirm at least 25 dated announcements with announced and delivered volumes, including at least 6 emergency or exchange events and 15 solicitations. Download weekly SPR stocks and the NYMEX contracts 1-4 file. Confirm the 18 October 2022 White House wording. Find the Petroleum Account balance by year. Test whether Yahoo returns a continuous front-month series and at least one expired contract month. If fewer than 20 scorable announcements exist or balances cannot be found, switch to F.

**Pros.**
- Every dataset is free, official and small; assembled in two to three weeks.
- Each of the six steps is a complete result; the most likely outcome of step 4 (no credible floor, DOE buying at $72-81) is still a clean finding and is designed in.
- The ledger is a genuinely new dataset you build yourself.
- Direct hit on brief topic 3 and his Brexit method; he will enjoy the scoring of DOE as a forecaster.
- The poker logic is explicit: a player announces a bet he may not be able to fund; the table learns how often he follows through.
- Fresh events no paper covers (January 2023 rejected bids, 2024 above-band purchases, the 2025 pledge versus 1 mb bought, the March 2026 exchange), with a live out-of-sample test in 2026-27.
- Interview-ready: option intuition, limited-reserves logic, Bayesian updating and an honest trading test, each explainable in two minutes.
- Low paid-data risk: options data not required (OVX substitutes); the band regime sits mostly inside EIA's free futures coverage.

**Cons.**
- *Time.* The ledger means reading 40-60 press releases and PDFs; two focused weeks.
- *Data risk.* EIA futures stop on 5 April 2024; the deferred-curve test beyond that needs contract-level prices with no confirmed free source, though the band was effectively abandoned by September 2024. The 200 mb return pledge cannot be fully scored before spring 2027.
- *Where you could get stuck.* Fewer than ten emergency drawdowns and exchanges that matter; few in-band days (WTI within $5 of the floor only in a handful of months), so the floor test and Rule B have little power. Delivery shortfalls are endogenous to the price path, so "DOE as a biased forecaster" must be shown conditional on prices. Confounding is severe around 2022 announcements (war, OPEC+ cuts, Fed hikes).
- *How examiners might attack it.* "Svensson's test does not transfer: DOE was a discretionary buyer, not a counterparty obliged to buy at $67", so the band chapter must be reframed as a limited-reserves credibility test or be called a gimmick. "SPR announcement effects are already studied" (step 2 alone is an update; originality rests on steps 1, 3 and 4). A trader will say the answer is obvious (a $4-5bn budget cannot pin a $3tn market), so lead with the ledger and the learning test. Pledge size versus funded capacity, not "no purchases", is the honest measure.
- *If the result is null.* It works: "The put the market never priced", with the ledger, the event study by instrument and the credibility test.
- *How much Dr Gifuni can help.* Strong on event-study design, forecast scoring and the Kilian-Zhou critique; generic on the Salant chapter and SPR institutions.
- *Explaining it in an interview.* Good, provided you can derive why a discretionary buyer cannot create an arbitrage floor and which observable the footprint should fade with.
- Pitch this or F, not both; it shares the "government writes an option" framing with existing idea 3.

**Fallback.** If the floor test shows nothing, steps 1-3 carry the paper and the band chapter is a tested-and-rejected hypothesis with a limited-reserves explanation. If reactions do not scale with credibility, report "announcements are noise relative to deliveries" and strengthen the award-day and delivery-week event study. If post-April-2024 contract prices are not free, restrict the curve test to October 2022-April 2024. If the ledger cannot reach 20 scorable announcements, switch to F.

**Interview line.** "The US government wrote a put on oil struck at $67 with a notional it could barely fund; I scored forty years of SPR promises against deliveries, tracked how fast traders learned to discount the announcer, and tested whether a floor with no reserves behind it ever showed up in the futures curve."

**Prize case.** A one-line question any economist understands; a dataset you built; classic theory imported into a new setting with the right adaptation; modern methods (event study with placebos, Bayesian updating, forecast scoring); relevance to the 2022 and 2026 crises; replicable code; a null that is still a contribution.

**Judges' scores.** Originality 8.0, quant appeal 7.3, prize and mark 6.3, feasibility 6.7, Gifuni fit 7.3. Average rank 5.7.

---

### Shorter notes

All six ideas below run in MATLAB with the Statistics and Machine Learning and Econometrics Toolboxes (B also wants the Text Analytics Toolbox for its HTML corpus), each with an R fallback; the toolbox-by-toolbox notes, full method menus and week plans are in the appendix.

#### D. Who Moves First?

**Question.** Each month the EIA, OPEC and the IEA publish, days apart, forecasts of world oil demand growth. Who is more accurate? Does the later report's revision follow the earlier one beyond what its own information warrants? Does OPEC's gap to the other two track its production-policy state and the March 2022 break (when OPEC+ dropped the IEA as a secondary source)? Does Brent react to the later release once the earlier one is public?

**The hook.** Three institutions post rival oil-demand forecasts days apart every month and were further apart in 2024 and 2026 than at any time since 2008. I score who has the edge, who follows whom, whether the cartel's number tilts with its policy, and whether Brent has already read their cards.

**Why it ranks where it does.** A near-duplicate of F on the same MOMR and STEO panel, with the richer three-agency lead-lag design and the best trading-floor hook of the forecast ideas. The judges prefer F because it is more feasible, has a sharper incentive story and a survivable week-1 fallback. D has the heaviest extraction of any idea (roughly 850 PDFs across three sources with changing layouts), unverified IEA and OPEC archive depth, and a likely-null release-day event study. Pitch F instead unless the IEA archive proves free in week 1.

**Pros.** Rival public forecasters with a known release sequence and an interested party; fits your "who bluffs, who copies" framing; topical (the 2024 and 2026 OPEC-IEA splits); three stand-alone chapters, two needing no price data; journalists have shown the raw pattern exists; his evaluation toolkit transfers directly; produces a public three-agency dataset; growth-rate harmonisation and own-vintage truth show awareness examiners reward.

**Cons.** Heaviest extraction for a student who dislikes repetitive work; IEA before 2017 and OPEC before 2010 are week-1 risks; only three forecasters, so classical herding tests do not apply; "truth" is revised for years and defined differently by each agency; daily release-day event studies have low power and coincide with other releases; copying versus common information is hard to separate; six questions in 10,000 words is sprawl; the brief fit is through methods, not topic.

**Judges' scores.** Originality 8.0, quant appeal 7.7, prize and mark 7.3, feasibility 4.7 (lowest of the strong ideas), Gifuni fit 6.7. Average rank 6.0.

#### L. Does the Sentence Change the Beta? Central-bank energy talk and oil's grip on breakeven inflation

**Question.** When the Bank of England and the Federal Reserve devote more of a policy statement to energy and write that passage with firmer, clearer look-through language, does oil's daily pass-through into 5- and 10-year breakeven inflation fall in the inter-meeting period that follows, after controlling for the policy surprise, oil volatility, the inflation level and TIPS liquidity? Do breakevens react to the energy passage on the announcement day itself? (ECB and Norges Bank as extensions only.)

**The hook.** Central banks say they look through energy shocks; I measure whether traders believe the sentence or the oil price, and report the answer as basis points of breakeven per 1% oil move and as the change in a desk's hedge notional.

**Why it ranks where it does.** Highest Gifuni fit of all 17 (9.7): it is the gap flagged from his own work, applying topic-level clarity to how central banks talk about energy, on his brief topic 3, with his Brexit template. But the lowest quant appeal of the kept ideas and weak feasibility. Endogeneity (banks talk about energy when oil is volatile and breakevens already moving), noisy daily breakevens, no free euro-area inflation compensation (no usable Bundesbank linker series either, so the ECB leg cannot test inflation compensation and ECB WP 3227 of May 2026 does that with paid data), TIPS liquidity premia that collapsed in Q4 2008 and March 2020 inside the energy-heavy sub-samples, and a data-mining risk across banks and measures. The two papers to position against are [Benchimol and Mellina (2026)](https://ideas.repec.org/p/een/camaaa/2026-29.html), FOMC inflation language mapped to breakevens with no energy passage, and [Acosta, Ajello, Bauer, Loria and Miranda-Agrippino (2025, FRBSF WP 2025-30)](https://www.frbsf.org/wp-content/uploads/wp2025-30.pdf), whose public US Monetary Policy Event-Study Database (USMPD) should be your intraday policy-surprise control for the Fed. Oil-to-breakeven sensitivity is documented by Perez-Segura and Vigfusson (2016, Fed IFDP Notes), Hammoudeh and Reboredo (2018) and Celasun, Ratnovski and Mihet (2012); a reference to Ruman, Junttila and Sahlström (2026) in an earlier draft could not be verified by any route and nothing depends on it. Trimmed plan: BoE and Fed only, corpus, measurement, pass-through moderation (primary) and the announcement-day event study; chapter budget in the appendix. One pass ranked it fourth overall; the others thirteenth and fourteenth.

**Pros.** Free US and UK data with thousands of daily observations (T5YIE and T10YIE daily from 2 January 2003; BoE curves from the 1980s); exactly his research frontier, so supervision is expert and personal; several stand-alone sub-results; a beta-regime question with a clean intraday surprise control for the Fed, liquidity controls, placebos and multiple-testing control; natural drama in 2022 and 2026; a validated null is a credibility finding.

**Cons.** Heavy scraping even at two banks; FOMC statements rarely mention energy outside 2004-2008 and 2021-2026; the UK policy-surprise control is a daily 2-year gilt change, weaker than the USMPD; the Känzig series lags months so 2026 cannot be purged in real time; a null is ambiguous between "markets ignore words" and "measure too crude" unless the 100-statement hand-coding is impeccable; his group may be working nearby, so the energy passage must be your distinct claim; weakest for a prop or volatility desk, and there is no money angle beyond the hedge-ratio translation.

**Judges' scores.** Originality 6.3, quant appeal 5.7 (lowest of the kept ideas), prize and mark 6.7, feasibility 5.0, Gifuni fit 9.7 (highest of all). Average rank 10.3.

#### I. The Gas Map at Market Speed

**Question.** On days when identified European gas-supply news moves TTF, which countries' equities, 10-year yields and currencies pay? Does that market-implied map match Eurostat gas dependence? Did it re-draw after 24 February 2022? Does gas news transmit differently from OPEC oil news in the same daily asset panel?

**The hook.** Europe's gas-dependence map exists twice, once in Eurostat and once in asset prices on gas-news days; I estimate the second from identified supply announcements and test whether traders priced the right countries before and after 2022.

**Why it ranks where it does.** The most literal transplant of his Brexit event study to gas (Gifuni fit 9.0) and the best fit of the spillover ideas, but the worst feasibility of the kept ideas. The daily gas-supply surprise series is not the contribution: [Alessandri and Gazzani (2025, JME)](https://doi.org/10.1016/j.jmoneco.2025.103749), [Colombo and Toni (2025)](https://www.lem.sssup.it/WPLem/files/2025-20.pdf) and [Pagano Giorgianni (2025/26)](https://arxiv.org/abs/2510.03792) all build one; [Goodell et al. (2023)](https://doi.org/10.1016/j.eneco.2023.106838) study 24 Nord Stream dates on TTF; [Huszár, Kotró and Tan (2023, Energy Economics)](https://doi.org/10.1016/j.eneco.2023.107052) and Li, Chuang and Gupta (2026, Pretoria WP 202609, whose abstract you should read before characterising it) are adjacent. Free daily TTF history is unverified: the one free series with a known start ([DBnomics ICE](https://db.nomics.world/ICE/DUTCH_TTF_GAS_FUTURES)) begins November 2020, Yahoo TTF=F is the CME USD/MMBtu contract first traded July 2021 and not a pre-2021 source, and the only verified Gassco study ([jauricestudios](https://github.com/jauricestudios/norway-ttf-event-study)) used vendor ICE data and found no TTF reaction to 166 notices. So the first stage may be weak and the sample may be 40-70 events. What no paper found does: trace identified gas news across about 15 countries' assets at daily frequency, test the betas against measured dependence with a pooled interaction design and a 2022 break, compare gas and oil news in the same panel, and quantify the selection bias between outcome-selected and announcement-selected event lists.

**Pros.** A clearly empty niche in a hot JME/ECB literature; steps 1, 3 and 5 each a complete result; textbook methods; direct reuse of his Brexit template; the announcement-selected versus outcome-selected comparison is a genuine methodological point; topical; Känzig's data, Henry Hub and daily FX verified.

**Cons.** High data risk on TTF; event lists in a paywalled article and an unread arXiv table; a weak first stage would leave the cross-country betas meaningless; timestamping against the ICE close invites identification attacks; with 60-120 events and 15 countries only the pooled design has power and even it may give wide bands; euro-area inflation swaps not free; shares the Gassco source with existing idea 1, so pursue at most one; he cannot help with gas-market plumbing.

**Judges' scores.** Originality 6.3, quant appeal 6.7, prize and mark 6.3, feasibility 4.7, Gifuni fit 9.0. Average rank 10.7.

#### B. Numbers at 10:30, Words at 1:00

**Question.** The EIA releases hard numbers at 10:30 ET (WPSR Wednesday; storage report Thursday) and its own prose hours later. At 1:00 pm Wednesday two agency texts arrive together: the WPSR's own "Summary", which explains that week's numbers (the primary corpus), and This Week in Petroleum (January 2002 to October 2025, often a topical essay; secondary). The Natural Gas Weekly Update follows on Thursday afternoon (from January 2002). Net of the full numeric release, does the tone, uncertainty language and clarity of the agency's own words carry information for oil and gas returns and volatility, and is it priced at once or with a drift?

**The hook.** Engelberg showed equities are slow to price the words in earnings releases; I built what I believe is the first corpus of the EIA's own weekly explanations, which arrive hours after its numbers, and tested whether anyone reads them.

**Why it ranks where it does.** A new corpus (about 2,400-3,600 official narratives) in the supervisor's idiom, with a design borrowed from [Engelberg (2008)](https://doi.org/10.2139/ssrn.1107998) and a second-moment test that closes a gap in his own work. But [Jeong and Ahn (2025)](https://doi.org/10.1016/j.eneco.2024.108105) already show agency-report sentiment (IEA and OPEC) predicts oil returns, so the broad claim is taken; the scraping (2-4 weeks across 24 years of changing EIA HTML) is exactly the repetitive work you dislike; soft-information effects are tiny; and traders' prior is that EIA weekly prose is boilerplate. TWIP ended in October 2025 and the NGWU may be cut in 2026, so the live sample cannot be extended. The WPSR summary archive is unconfirmed and is the first week-1 item; without it the 1 pm oil corpus is TWIP alone. Adjacent work: [Loughran, McDonald and Pragidis (2019, "Dissemination of Oil News into Prices")](https://doi.org/10.1016/j.irfa.2019.03.008); [Cao and Robe (2022)](https://doi.org/10.1002/fut.22283) on USDA reports; [Armesto, Hernández-Murillo and Owyang (2009)](https://doi.org/10.1111/j.1538-4616.2008.00186.x) on the Beige Book.

**Pros.** Fully inside his expertise and brief; an original dataset you build (EIA text is public domain, so the corpus can be shared); identification from a known institutional timing gap; several self-contained results; a null is a clean hard-information-only finding; free Dukascopy 1-minute data separate the 10:30 and 13:00 reactions (personal use only; the minute data cannot go on GitHub); every step explainable from first principles.

**Cons.** Heavy scraping; broad claim pre-empted; two texts land at 1 pm, so the reaction must be attributed carefully (WPSR summary primary, TWIP weeks reported separately); tone is partly mechanical ("inventories rose" reads negative), so the orthogonalisation against the full numeric release and the weather-section placebo must be impeccable; power to detect a 5-10 basis-point drift is modest; the Text Analytics Toolbox may not be licensed; Dukascopy quotes are broker CFDs; gas prose arrives after the NYMEX settlement, so the oil-gas speed comparison is not symmetric; a null leaves a solid rather than prize-like dissertation.

**Judges' scores.** Originality 6.7, quant appeal 6.3, prize and mark 6.0, feasibility 5.0, Gifuni fit 9.0. Average rank 11.3.

#### Existing 3. Who is short gas? The Treasury's gas exposure in gilt prices, 2022-2026 (carried forward as a reserve)

**Question.** The 2022 Energy Price Guarantee was in effect a gas call option written by the Treasury. Did it move the gas risk in gilt prices from inflation into the government's finances, and did that switch off once the scheme was cut back?

**The hook.** The Treasury sold the public a call option on gas; I measured whether gilts started trading the UK as short gas.

**Why it ranks where it does.** The one existing idea worth carrying forward: original (7.7), topic 3 of his brief almost word for word, his Brexit design, his institute costed the scheme, free data ([Bank of England yield curves](https://www.bankofengland.co.uk/statistics/yield-curves), Bundesbank curve, NBP SAP). It is a reserve, not the lead, because there is essentially one confounded episode: the scheme's active months overlap the mini-budget and LDI crisis ([Pinter 2023](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4407740)), yield decomposition is model-dependent, and index-linked gilt liquidity collapsed in autumn 2022. [Shackleton (2025)](https://doi.org/10.1111/ecaf.12695) links the scheme to gilts only in words.

**Pros.** Original and on-brief; a rates desk leans forward; real quant work (gilt decomposition, placebo with oil since petrol was not covered, German and US comparison, out-of-sample test on the 2026 Hormuz shock); a small Guardian text index would give him his text component.

**Cons.** One regime on and one off; mini-budget overlap means results must be shown with and without 23 September-14 October 2022; model-dependent decomposition; RPI breakeven distortion; clean execution at risk.

**Judges' scores.** Originality 7.7, quant appeal 6.3. Average rank 9.0.

#### Existing 1. Reading the tell: are Norwegian gas outage return dates biased forecasts? (contingent reserve)

**Question.** When Gassco announces an unplanned outage, is its stated return date an unbiased forecast? Do TTF and British gas prices react to that date, or to a date corrected for Gassco's track record?

**The hook.** I scored Norwegian pipeline operators as forecasters and tested whether gas traders already read their tell.

**Why it ranks where it does.** Genuinely original and in his forecast-evaluation language, on gas. But the [Gassco archive](https://umm.gassco.no) appears to start in September 2024 (about 150-170 unplanned outages); the jauricestudios repository already finds no daily TTF reaction to 166 of them (median [0,+1] return +0.057%, Wilcoxon p = 0.689, on vendor TTF data); notices arrive at all hours, so daily data cannot time the reaction; and free daily TTF is unverified. The forecast-bias chapter is a short note on a small, recent sample. Contingent on Gassco emailing you older history in week 1; otherwise its outage catalogue lives on as an extension inside I. [Valitov and Maier (2020)](https://ideas.repec.org/a/eee/eneeco/v89y2020ics0140988320301250.html) study power-plant outages but take announced end dates as given.

**Pros.** New question; uses his evaluation methods; gas; the free-text remarks field lets you re-test his text-uncertainty finding where it might work.

**Cons.** Two-year archive; a published null on the price reaction; timing problem; TTF data risk; shares the Gassco source with I.

**Judges' scores.** Originality 7.7, quant appeal 6.3. Average rank 10.3.

### Dropped candidates, one line each

- **H. Two half-lives (new).** Under-identified: four free futures maturities cannot pin a four-parameter decay model; the free sample ends April 2024; no P&L. Average rank 16.3.
- **Existing 2. TOSI vs OVX.** A replication of the supervisor's own model with a new benchmark; four-hour runs; scale breaks in the post-2021 indices; "the market wins" is the likely answer. Its Kelly device lives on in K and G. Average rank 14.0.
- **Existing 4. Calling the cartel's bluff.** Needs a paid terminal for long-dated futures; joint OPEC+ announcements cannot be attributed to one member; disputed compliance tables; few events. F takes the slot. Average rank 14.7.
- **Existing 5. Could the newspapers call OPEC?** A robustness check on someone else's instrument; frequency mismatch; 130-140 events. Average rank 16.7.

---

## 4. Final combined ranking

Scores and ranks are from three independent model-generated passes, not human reviewers; treat them as a structured opinion. The order is by the average of the three passes' overall rank positions (1 = best).

1. **J. Who Hedges the Barrel?** (1.0; first for all three). Novel mechanism, verified tiny inputs, sharp falsifiable predictions, mainstream DiD and event-study econometrics, appeal across energy, international finance and public finance. Limits: few OPEC days inside regime windows, the dollar factor, no text for the supervisor.
2. **A. The Atlantic Switch** (2.0; second for all three). The best desk story and textbook identification, but the highest data and power risk: free daily TTF before 2017-2021 is unverified and a plausible pass-through is tiny against 2022 volatility. Pitch only if the week-1 TTF and consensus checks pass.
3. **F. Does the Dealer Lie About the Deck?** (3.3). Novel, free data, forecast-evaluation rigour in his toolkit, a live controversy, a text chapter in his idiom. Risks: MOMR depth, hand extraction, an endogenous stance, a likely-null market chapter. Pitch this rather than D.
4. **E. The Government Put** (5.7). Original ledger and credibility test on topic 3, small free data, every step a result; but very small samples, a band chapter that must be reframed, severe 2022 confounding.
5. **D. Who Moves First?** (6.0). Richer three-agency version of F with the best floor hook, but the heaviest extraction, unverified archives, a likely-null event study.
6. **G. Pricing the Wednesday** (6.3; third for one pass). Highest quant appeal, highest feasibility, data that cannot fail. Held back by a headline drop already published and the weakest supervisor fit. The cannot-fail reserve named by all three.
7. **K. The Forecaster's Tell** (6.3). The best compromise between supervisor fit (9.0) and quant content; what we believe is the first coverage test of the EIA's own published bands, with re-centring as the headline, carries it if the text is null. Pitch this rather than C.
8. **C. Words Against Numbers** (9.0). Same corpus and band as K with more sprawl; folded into K above.
9. **Existing 3. Who is short gas?** (9.0). Original and on-brief, free data, one confounded episode. A reserve.
10. **L. Does the Sentence Change the Beta?** (10.3). Highest Gifuni fit, a question a macro department respects, but endogeneity, noisy daily breakevens, TIPS liquidity premia, no free euro-area compensation, data-mining risk; weakest for a prop desk.
11. **Existing 1. Reading the tell** (10.3). Original but a two-year archive and a published null (on vendor TTF data). Contingent on Gassco history.
12. **I. The Gas Map at Market Speed** (10.7). Best fit of the spillover ideas, worst feasibility: the shock series is not new, free TTF is unverified, the first stage may be weak.
13. **B. Numbers at 10:30, Words at 1:00** (11.3). A new corpus in his idiom, but heavy scraping, tiny effects, a pre-empted broad claim.

Dropped: existing 2 (14.0), existing 4 (14.7), H (16.3), existing 5 (16.7).

### Pairs and slots to resolve before you pitch

- D and F use the same MOMR and STEO panel: pitch F.
- C and K use the same STEO corpus and bands: pitch K, with C's re-centring and encompassing tests as a chapter (done above).
- E, F and J (and existing 4) all occupy the "policy credibility" slot: pitch one.
- I and existing 1 share the Gassco source: pursue at most one.
- G, K and existing 2 share the OVX second-moment device: existing 2 is absorbed.

### Recommendation

**Top choice: J, Who Hedges the Barrel?** The only candidate scoring 8 or above on originality, quant appeal and prize potential while also scoring high on feasibility. Its inputs are small and two are verified. Its predictions can be written down before you touch the data, which is what a prize committee and a quant interviewer both reward. Its honest weak point is supervisor fit (7.0): no text component, and FX is not Dr Gifuni's field. Handle that by leading with the Känzig instrument, the Brexit template and the forecast-evaluation discipline he knows, and by framing fiscal rules and hedging programmes as "institutions responding to commodity price projections" (his topic 3) honestly.

**Fallback: K, The Forecaster's Tell.** Highest supervisor fit among the strong ideas (9.0); point forecasts and text that cannot fail, with two named data risks bounded by the MPUR; bounded workload under the trimmed plan; a coverage test of the EIA's own published bands that we believe is the first, with re-centring as the headline; a direct test of his own negative result; and his co-author Ravazzolo on the closest gas benchmark paper. Its honest weak point: the text result is probably a null and over-coverage alone is a known result, so the dissertation must lead with re-centring and regime variation.

**Named reserves.** A (The Atlantic Switch) if you want the strongest gas-desk story and the TTF and consensus data pass week 1; its weak point is power. G (Pricing the Wednesday) as the guaranteed-finish option all three passes named; its weak point is that the headline drop is already published and supervisor fit is lowest. Existing 3 (Who is short gas?) as the on-brief UK reserve; its weak point is one confounded episode.

### Week-1 checks

**J (before the first meeting if you can).**
1. Download Känzig's 2025M12 vintage and Degasperi's Jun25 file; confirm the Daily sheets load and align on OPEC dates.
2. Download daily USD/NOK, USD/CAD, USD/MXN, USD/BRL, EUR/NOK and EUR/CAD from FRED or the ECB and merge.
3. Regress daily log changes in NOK and CAD (versus USD and EUR) on the OPEC-day surprise for 2000-2019. Require |t| above 2 with exporters appreciating on adverse supply news. If it fails, try 2-day windows and Degasperi's clean series.
4. Find the Norges Bank monthly FX-transactions table and confirm its start year (a snippet of the page shows rows back to 2000); collect at least 24 monthly MinFin announcements.
5. Read Rüth et al. (2026) and confirm it does not already include fiscal or fund mechanisms.

**K (in parallel, two or three evenings).**
1. Download about 24 STEO PDFs spanning 1997-2026, extract text, confirm the crude-oil section can be isolated in each format era and that the hedging-word share varies.
2. Count how many Market Prices and Uncertainty Report issues since October 2009 state numeric band bounds, for which horizons, and whether each states the NYMEX futures price at the centre; confirm the charts continued into 2026.
3. Download OVXCLS and DCOILWTICO and match three STEO forecast paths to realised prices.
4. Read Baumeister, Huber, Lee and Ravazzolo (2025), Brown et al. (2023) and Agovic (2026) and write one paragraph on what K adds to each.

**G (one line).** Compute the mean log change in OVX for each weekday transition over 2007-2026 and confirm Tuesday-to-Wednesday minus Monday-to-Tuesday is negative with |t| above 2 and moves to Wednesday-to-Thursday in holiday weeks.

**For both J and K.** Read the conclusion of Dr Gifuni's open-access IJF paper and chapters 2-4 of his thesis before the meeting, so you can say exactly which of his public strands each idea reuses. Do not send the email until this reading is done.

---

## 5. Suggested email to Dr Gifuni

Send this only after you have read the IJF paper's conclusion, the Brexit paper and thesis chapters 2-4, so that the second sentence is true.

Subject: Dissertation proposal: two ideas for your view

Dear Dr Gifuni,

I am a final-year BA Economics student and would like to ask whether you would supervise my honours dissertation, due in spring 2027. I have been reading your brief, your International Journal of Forecasting paper and your Brexit event-study paper, and I would like to propose two ideas that sit inside your interests and use only public data.

My preferred idea is "Who Hedges the Barrel?". Using Känzig's OPEC-announcement-day oil supply surprises (and Degasperi's cleaner series as a check), I would estimate each petro-currency's same-day oil beta and then test whether sovereign hedging institutions change its shape: Norway's pre-announced krone conversions for the oil fund (against unhedged Canada), Russia's 2017-2022 budget-rule purchases that switched on only above a cut-off oil price, and Mexico's annual put hedge that protects only the downside. The predictions are a smaller, kinked or one-sided beta respectively, tested with difference-in-differences across the dated regime changes, a purged dollar factor, HAC and bootstrap inference, and a pre-registered tradability check with a reality check. I see it as a test of how institutions' responses to commodity price projections are priced, in the spirit of the third topic in your brief, using the event-study design of your Brexit paper.

My fallback is "The Forecaster's Tell". Every month the EIA's Short-Term Energy Outlook prints a WTI point forecast, an options-implied 95% band centred on the NYMEX futures price, and a prose section. I would build what I believe would be the first text dataset of those sections (1997-2026), run what I believe would be the first coverage test of the published bands (having checked the EIA's own evaluations and a 2026 Chalmers thesis), with the main result being whether re-centring the band on the EIA's own forecast changes its calibration, and test whether the EIA's hedging language predicts its own misses, band breaches and next-month realised variance relative to OVX, beyond band width and the EIA's own deviation from the futures price it reports. This re-tests your finding that text-based uncertainty measures are weak, on a second-moment target and on forecaster-authored text, using the dictionaries and evaluation code in your public repository.

Could we meet in the next two weeks to discuss which you think is stronger, and to agree a week-1 data check? I would also be very grateful for an anonymised copy of last year's top-marked dissertation, or a note on what set it apart, and for the marking criteria the department uses, so that I can aim at them from the start.

I work in MATLAB (and R where needed) and can have the week-1 data check for either idea ready before we meet.

Thank you for your time.

Kind regards,
Will McGowan

---

## 6. How the top two ideas map to the marking criteria

The department's actual grid must be requested (the email asks for it). These are the usual criteria in an economics honours dissertation, not the department's wording.

| Criterion | J. Who Hedges the Barrel? | K. The Forecaster's Tell |
|---|---|---|
| Research question | One falsifiable mechanism (does a sovereign hedging institution change the shape of a currency's oil beta?) with three predictions stated before estimation. | Do a public forecaster's prose, point forecast and printed odds agree with each other and with the market? Expected direction of the band result stated in advance. |
| Literature | Oil and exporter currencies; sovereign wealth and fiscal rules; OPEC-announcement identification. Gap: the institutional shape of the beta. | Narrative forecasting (Sharpe et al.; Clements and Reade); EIA evaluations; option-implied densities and the variance risk premium (Brown et al.; Prokopczuk et al.); Gifuni's text-uncertainty result. Gap: the EIA's own published band and its re-centring. |
| Method | Difference-in-differences across dated regime changes; event-day regressions with HAC and block bootstrap; a dollar-factor purge; placebos; a reality check. | Mincer-Zarnowitz and encompassing with overlapping-horizon inference; PIT, Berkowitz and Knüppel calibration tests; log score and CRPS; Kelly growth; orthogonalised text regressions with a block bootstrap. |
| Data work | Two verified public shock series; daily FX; three hand-collected institutional ledgers with dated regimes. | A 30-year vintage dataset built from public PDFs; MPUR band bounds and STEO-reported futures; a hand-validated text index. |
| Results and interpretation | Three signed predictions, each confirmed or rejected with intervals; a null on any one is a finding about efficiency. | Over-coverage expected, so the result is re-centring and regime variation; a text null is consistent with the supervisor's published finding. |
| Presentation | A pre-registration page in the appendix; a GitHub repository with public-domain data and code; one figure per chapter that carries the argument. | The same, with licensing stated for anything derived from dictionaries or the supervisor's repository. |

---

## 7. Sources

Every URL and DOI used in this document, grouped by where it is used.

**Verification caveat, stated plainly.** The environment that prepared this document could not open eia.gov, fred.stlouisfed.org, opec.org, iea.org, ief.org, jodidata.org, energy.gov, cftc.gov, treasury.gov, norges-bank.no, minfin.gov.ru, cbr.ru, banxico.org.mx, bankofengland.co.uk, ecb.europa.eu, federalreserve.gov, ons.gov.uk, nationalgas.com, agsi.gie.eu, ice.com, finance.yahoo.com, investing.com, stooq.com, stoxx.com, eurostat, umm.gassco.no, dukascopy.com, sraf.nd.edu, matteoiacoviello.com, worldbank.org, arxiv.org, sciencedirect.com, ssrn.com, theses.gla.ac.uk or web.archive.org. Every statement about those sites (start dates, formats, free status, release times) comes from search-engine snippets and must be re-checked in week 1. Verified directly: the Gifuni repository (cloned and inspected), the Känzig, Degasperi and jauricestudios repositories (fetched), and Alpha Vantage live calls for WTI, Brent, Henry Hub, USD/NOK and USD/MXN. A separate fact-checking pass verified the STEO archive depth, the band design (options-implied, centred on NYMEX futures, WTI and Henry Hub only, from October 2009), the 5 April 2024 stop of EIA's futures tables, the Zenodo mirror, and the corrected citations listed below. Two references from an earlier draft could not be found by any route and are flagged rather than relied on: Ruman, Junttila and Sahlström (2026) and the FRBSF Economic Letter 2025-30 attributed to Miyamoto, Najjar, Nguyen and Sergeyev. The literature-database checks could not be completed for every reference, so later checks relied on web search; no citation was invented, but journal details should be checked against the publisher page before you cite them.

### Dr Gifuni's work and repository
- [Gifuni (2026), Whispers in the oil market, IJF](https://doi.org/10.1016/j.ijforecast.2025.09.001) — his text-for-oil-forecasting paper, open access.
- [Gifuni (2023), MF-VAR vs MIDAS, SSRN](https://doi.org/10.2139/ssrn.4574350) — his negative mixed-frequency result.
- [Gifuni (2022), Oil shocks under model uncertainty, SSRN](https://doi.org/10.2139/ssrn.4282185).
- [Gifuni (2022), Brexit spillovers, SSRN](https://doi.org/10.2139/ssrn.4095329) — the event-study template reused by J, A, E, I and L.
- [Gifuni and Ravazzolo (2025), When Topics Drive Central Bank Transparency, SSRN](https://doi.org/10.2139/ssrn.5310029).
- [Gifuni's replication repository](https://github.com/gifuniluigi/ijof-wom_esui) — TOSI, indices, dictionaries, DM/CRPS code (verified; no licence stated).

### Existing ideas 1-5
- [Gassco UMM platform](https://umm.gassco.no) (not reachable); [jauricestudios/norway-ttf-event-study](https://github.com/jauricestudios/norway-ttf-event-study) — no TTF reaction to 166 Gassco notices; uses vendor TTF data (verified).
- [Valitov and Maier (2020), Energy Economics](https://ideas.repec.org/a/eee/eneeco/v89y2020ics0140988320301250.html).
- [Pinter (2023), SSRN](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4407740); [Shackleton (2025), Economic Affairs](https://doi.org/10.1111/ecaf.12695); [Bank of England yield curves](https://www.bankofengland.co.uk/statistics/yield-curves).
- [Pescatori and Nazer (2022), IMF WP](https://doi.org/10.5089/9798400219788.001); [Spencer and Bredin (2019), Energy Economics](https://doi.org/10.1016/j.eneco.2019.01.018); Mori and Peersman (2024), Marco Fanno WP 314 (no URL found).

### Shared data sources
- [Känzig oil supply news repository](https://github.com/dkaenzig/oilsupplynews) (CC BY 4.0, verified); [Känzig (2021), AER](https://doi.org/10.1257/aer.20190964); [Degasperi OPEC surprises](https://github.com/riccardo-degasperi/OPEC-surprises) (verified; no licence stated).
- FRED: [DCOILWTICO](https://fred.stlouisfed.org/series/DCOILWTICO), [DCOILBRENTEU](https://fred.stlouisfed.org/series/DCOILBRENTEU), [DHHNGSP](https://fred.stlouisfed.org/series/DHHNGSP), [OVXCLS](https://fred.stlouisfed.org/series/OVXCLS), [USEPUINDXD](https://fred.stlouisfed.org/series/USEPUINDXD), [DEXNOUS](https://fred.stlouisfed.org/series/DEXNOUS), [WCSSTUS1](https://fred.stlouisfed.org/series/WCSSTUS1).
- EIA: [NYMEX WTI contracts 1-4](https://www.eia.gov/dnav/pet/pet_pri_fut_s1_d.htm) and [Henry Hub contracts 1-4](https://www.eia.gov/dnav/ng/ng_pri_fut_s1_d.htm) (to 5 April 2024); [STEO archive](https://www.eia.gov/outlooks/steo/archives/); [international energy data](https://www.eia.gov/international/data/world); [Weekly Natural Gas Storage Report](https://ir.eia.gov/ngs/ngs.html); [Natural Gas Weekly Update](https://www.eia.gov/naturalgas/weekly/); [WPSR](https://www.eia.gov/petroleum/supply/weekly/) and [release schedule](https://www.eia.gov/petroleum/supply/weekly/schedule.php).
- [CFTC Commitments of Traders](https://www.cftc.gov/MarketReports/CommitmentsofTraders/HistoricalCompressed/index.htm); [FOMC calendars](https://www.federalreserve.gov/monetarypolicy/fomccalendars.htm); [Caldara-Iacoviello GPR](https://www.matteoiacoviello.com/gpr.htm); [ONS gas SAP](https://www.ons.gov.uk/economy/economicoutputandproductivity/output/datasets/systemaveragepricesapofgas); [GIE AGSI+](https://agsi.gie.eu/).

### Idea J
- Rüth, Oruc, Van der Veken and Zhang (2026), [University of Erfurt news page](https://www.uni-erfurt.de/en/university/current/news/news-detail/neues-arbeitspapier-when-opec-speaks-the-dollars-evolving-reaction-to-oil-supply-news-in-the-age-of-shale) — summary only; paper to be read.
- [Ahmed (2020), Economics Letters](https://ideas.repec.org/a/eee/ecolet/v189y2020ics0165176520300422.html); [Habib, Bützer and Stracca (2016), IMF Economic Review](https://doi.org/10.1057/imfer.2016.9); [Bjørnland and Thorsrud (2016), JAE](https://doi.org/10.1002/jae.2669).
- [Norges Bank Economic Commentaries](https://norges-bank.brage.unit.no/norges-bank-xmlui/handle/11250/2558079); [NHH thesis on Norges Bank FX purchases](https://openaccess.nhh.no/nhh-xmlui/handle/11250/223306); [Norges Bank FX transactions page](https://www.norges-bank.no/en/topics/statistics/foreign-exchange-transactions-daily/) (visible to at least 2008; start year unconfirmed).
- [Fedoseeva (2018), International Economics](https://ideas.repec.org/a/cii/cepiie/2018-q4-156-9.html); [BOFIT Weekly 35/2018](https://www.bofit.fi/en/monitoring/weekly/2018/vw201835_2/); [ING snap, January 2022](https://think.ing.com/snaps/russia-fx-purchases-january-2022/).
- [Baghestani, Chazi and Khallaf (2019), OPEC Energy Review](https://doi.org/10.1111/opec.12234); [Ma and Valencia, IMF WP 18/35](https://www.imf.org/en/Publications/WP/Issues/2018/03/02/Welfare-Gains-from-Market-Insurance-The-Case-of-Mexican-Oil-Price-Risk-45667).

### Idea A
- [Ederington, Lin, Linn and Yang (2019)](https://doi.org/10.5547/01956574.40.5.lede); [Prokopczuk, Wese Simen and Wichmann (2021)](https://doi.org/10.5547/01956574.42.2.mpro); [Gu, Kurov and Stan (2026)](https://doi.org/10.1002/fut.70104); [Halova, Kurov and Kucher (2014)](https://doi.org/10.1002/fut.21633); [Halova Wolfe and Rosenman (2014)](https://doi.org/10.1016/j.eneco.2013.12.010); [Fernández-Pérez, Garel and Indriawan (2020)](https://doi.org/10.5547/01956574.41.5.afer); [Chen, Hartley and Lan (2023)](https://doi.org/10.1002/fut.22402); [Farag, Jeddi and Kopp (2025)](https://doi.org/10.1111/twec.13699); [Nick and Tischler (2014), EWI](https://www.ewi.uni-koeln.de/de/?p=998).
- [Hugging Face Tropstan/Forex_Factory_Calendar](https://huggingface.co/datasets/Tropstan/Forex_Factory_Calendar) (unverified); [DBnomics ICE Dutch TTF futures](https://db.nomics.world/ICE/DUTCH_TTF_GAS_FUTURES) (from November 2020); [ICE Endex Operating Schedule](https://www.ice.com/publicdocs/endex/ICE_Endex_Operating_Schedule.pdf).

### Idea F (and D)
- [Brunetti, Büyükşahin and Robe (2013)](https://doi.org/10.5547/01956574.34.4.5); [Garratt, Petrella and Zhang (2023)](https://doi.org/10.1016/j.eneco.2023.106620); [Moghaddam (2019)](https://doi.org/10.1111/opec.12138); [Auffhammer (2007)](https://doi.org/10.1016/j.reseneeco.2006.05.001); [Sanders, Manfredo and Boris (2009)](https://doi.org/10.1016/j.eneco.2008.08.010); [Wachtmeister, Henke and Höök (2018)](https://www.sciencedirect.com/science/article/pii/S0306261918303428); [KAPSARC (2018), DP40](https://doi.org/10.30573/ks--2018-dp40); [Nordhaus (1987)](https://doi.org/10.2307/1935962); [Coibion and Gorodnichenko (2015)](https://doi.org/10.1257/aer.20110306).
- [Finley (2024), Baker Institute](https://www.bakerinstitute.org/research/whats-happening-oil-market-forecasts); [Reuters tally via Sweetcrude Reports](https://sweetcrudereports.com/comparison-of-iea-opec-oil-demand-forecasts-since-2008/); [Lewis (2008) via Oil and Gas Journal](https://www.ogj.com/general-interest/article/17267672/reliability-of-oil-supply-demand-forecasts-challenged); [IEF Comparative Analysis](https://www.ief.org/data/comparative-analysis).
- [OPEC MOMR archive](https://www.opec.org/opec_web/en/publications/338.htm); [IEA Oil Market Report 2006 archives](https://www.iea.org/reports/oil-market-report-2006-archives) (free status unconfirmed); [JODI downloads](https://jodidata.org/oil/database/data-downloads.aspx); [Zenodo PUDL STEO archive](https://zenodo.org/records/17622298).

### Idea E
- [Kilian and Zhou (2020), JAE](https://doi.org/10.1002/jae.2798); [Stevens and Zhang (2021)](https://doi.org/10.5547/01956574.42.6.rste); [Demirer and Kutan (2010)](https://doi.org/10.1016/j.eneco.2010.06.006); [Stevens (2014), Berkeley](https://are.berkeley.edu/sites/default/files/job-candidates/paper/The%20Strategic%20Petroleum%20Reserve%20and%20Crude%20Oil%20Prices_0.pdf); [Kelly (2023)](https://www.atu.edu/business/jbao/fall2023/202302%2005%20Kelly.pdf); [Conte (2022)](https://soar.suny.edu/entities/publication/33cf349c-57de-4bde-b9da-04b116df64f1); [Razek et al. (2023)](https://ideas.repec.org/a/eee/jrpoli/v86y2023ipbs0301420723007730.html); [Newell and Prest (2017), NBER](https://www.nber.org/papers/w23974); [Salant (1983), RAND](https://www.rand.org/pubs/papers/P6766.html); [Svensson (1991), NBER](https://www.nber.org/papers/w3394); [Ahn (2012), SSRN](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2025228).
- [DOE History of SPR Releases](https://www.energy.gov/hgeo/opr/history-spr-releases); [DOE Historical SPR Oil Sales and Exchanges (2018)](https://www.energy.gov/sites/prod/files/2018/08/f54/Historical%20SPR%20Oil%20Sales%20and%20Exchanges_Aug%202018.pdf); [DOE CESER SPR page](https://www.energy.gov/ceser/strategic-petroleum-reserve); [CRS Insight IN12542](https://www.everycrsreport.com/reports/IN12542.html); [US Treasury jy0887](https://home.treasury.gov/news/press-releases/jy0887); [Yahoo CL=F](https://finance.yahoo.com/quote/CL%3DF/history).

### Idea G
- [Ederington and Lee (1996), JFQA](https://doi.org/10.2307/2331358); [López (2018)](https://doi.org/10.1016/j.eneco.2018.04.040); [Nikkinen and Rothovius (2019)](https://doi.org/10.1016/j.energy.2018.10.061); [Sharma (2017), UGA thesis](https://openscholar.uga.edu/record/14104); [Qadan and Idilbi-Bayaa (2021)](https://doi.org/10.1016/j.resourpol.2020.101980); [Miao, Ramchander, Wang and Yang (2018)](https://doi.org/10.1002/fut.21850); [Bu (2014)](https://doi.org/10.1016/j.eneco.2014.05.015); [Ye and Karali (2016)](https://doi.org/10.1016/j.eneco.2016.08.011); [Londono and Samadi (2023)](https://doi.org/10.17016/IFDP.2023.1376); [Wright (2020), NBER](https://www.nber.org/papers/w28306); [Alexiou, Goyal, Kostakis and Rompolis (2025)](https://doi.org/10.1093/rof/rfaf016); [Dubinsky, Johannes, Kaeck and Seeger (2019)](https://doi.org/10.1093/rfs/hhy060); [Trolle and Schwartz (2010), EPFL copy](http://infoscience.epfl.ch/record/148475).
- [Investing.com EIA crude inventories calendar](https://www.investing.com/economic-calendar/eia-crude-oil-inventories-75) (depth and terms unverified).

### Idea K (with C)
- [Sharpe, Sinha and Hollrah, IJF](https://doi.org/10.1016/j.ijforecast.2022.04.008); [Clements and Reade (2020)](https://doi.org/10.1016/j.ijforecast.2019.08.013); [Ericsson (2016)](https://doi.org/10.17016/IFDP.2015.1152); [Filippou, Mitchell and Nguyen (2023)](https://doi.org/10.26509/frbc-wp-202320); [Müller (2022), Empirical Economics 62(5)](https://doi.org/10.1007/s00181-021-02100-9).
- [Baumeister, Huber, Lee and Ravazzolo (2025), "Forecasting Natural Gas Prices in Real Time", JAE](https://doi.org/10.1002/jae.70018) — accepted 8 September 2025; NBER WP 33156; CEPR DP 19669; Ravazzolo is Dr Gifuni's co-author.
- [Brown, Cakir Melek, Matschke and Sattiraju (2023), "The Missing Tail Risk in Option Prices", Kansas City Fed RWP 23-02](https://www.kansascityfed.org/Research%20Working%20Papers/documents/9442/rwp23-02browncakirmelekmatschkesattiraju.pdf) — DOI 10.18651/RWP2023-02; left-tail under-prediction by option-implied densities.
- [Agovic (2026), Chalmers MSc thesis](https://hdl.handle.net/20.500.12380/310948) — empirical prediction intervals for STEO errors 2004-2024; does not score the published bands.
- [Prokopczuk, Symeonidis and Wese Simen (2017), JBF 81](https://doi.org/10.1016/j.jbankfin.2017.05.003) — negative oil variance risk premium; Trolle and Schwartz (2010) as above. Kelly (1956), "A New Interpretation of Information Rate", Bell System Technical Journal 35(4); Cover and Thomas, Elements of Information Theory, chapter 6.
- [Chinn and Coibion (2014)](https://doi.org/10.1002/fut.21615); [Ellwanger and Snudden (2023)](https://doi.org/10.5547/01956574.44.4.rell); [Baumeister and Kilian (2014)](https://doi.org/10.1111/iere.12074).
- [Loughran-McDonald Master Dictionary](https://sraf.nd.edu/loughranmcdonald-master-dictionary/) (academic-use licence).
- [EIA (2009), Energy price volatility and forecast uncertainty](https://www.eia.gov/outlooks/steo/special/pdf/2009_sp_05.pdf); [EIA archived WTI uncertainty charts](https://www.eia.gov/outlooks/steo/archives/uncertainty/uncertainty_past_wti.pdf) (labels only; numeric bounds in the Market Prices and Uncertainty Report text, reached from the STEO archive page); [World Bank Commodity Markets Outlook forecasts](https://www.worldbank.org/en/research/commodity-markets/price-forecasts).

### Idea L
- [Benchimol and Mellina (2026), CAMA WP 29/2026](https://ideas.repec.org/p/een/camaaa/2026-29.html); [Acosta, Ajello, Bauer, Loria and Miranda-Agrippino (2025), FRBSF WP 2025-30](https://www.frbsf.org/wp-content/uploads/wp2025-30.pdf) (USMPD; followed by FRBSF Economic Letter 2026-08).
- Perez-Segura and Vigfusson (2016), "The Relationship Between Oil Prices and Inflation Compensation", Fed IFDP Notes, 6 April 2016 (URL not confirmed); Hammoudeh and Reboredo (2018), Energy Economics 75, 484-491; Celasun, Ratnovski and Mihet (2012), IMF WP 12/89.
- Ruman, Junttila and Sahlström (2026), JIFMIM 111, 102370 — **unverified by any route; may not exist**; resolve [the DOI](https://doi.org/10.1016/j.intfin.2026.102370) in week 1 or drop it. The FRBSF Economic Letter 2025-30 attributed to Miyamoto, Najjar, Nguyen and Sergeyev was not found and has been removed; Miyamoto, Nguyen and Sergeyev's FRBSF working paper "How Oil Shocks Propagate" is about propagation, not breakevens.
- Knüppel and Schultefrankenfeld (2012), IJCB 8(3), 87-139; Davtyan and Kalozdi (2025), UAB WP 25-15; ECB Working Paper 3227 (May 2026) on gas shocks and market-based euro-area inflation expectations.

### Idea I
- [Alessandri and Gazzani (2025), JME 151](https://doi.org/10.1016/j.jmoneco.2025.103749); [Colombo and Toni (2025), LEM WP 2025/20](https://www.lem.sssup.it/WPLem/files/2025-20.pdf); [Pagano Giorgianni (2025/26), arXiv 2510.03792](https://arxiv.org/abs/2510.03792); [Goodell, Gurdgiev, Paltrinieri and Piserà (2023)](https://doi.org/10.1016/j.eneco.2023.106838); [Huszár, Kotró and Tan (2023), Energy Economics 127](https://doi.org/10.1016/j.eneco.2023.107052) (corrected from a non-existent JFR attribution); [Ferriani and Gazzani (2023), International Economics 174](https://doi.org/10.1016/j.inteco.2023.04.006); Li, Chuang and Gupta (2026), Pretoria WP 202609 (read the abstract first).
- Yahoo TTF=F: the CME Dutch TTF contract in USD/MMBtu, first trade 12 July 2021; not a pre-2021 source. Investing.com and the fgeerolf.com mirror are candidate free sources whose terms forbid redistribution.

### Idea B
- [Engelberg (2008), SSRN 1107998](https://doi.org/10.2139/ssrn.1107998); [Jeong and Ahn (2025), Energy Economics 141](https://doi.org/10.1016/j.eneco.2024.108105); [Loughran, McDonald and Pragidis (2019), IRFA 63](https://doi.org/10.1016/j.irfa.2019.03.008); [Cao and Robe (2022), JFM 42(2)](https://doi.org/10.1002/fut.22283); [Armesto, Hernández-Murillo and Owyang (2009), JMCB](https://doi.org/10.1111/j.1538-4616.2008.00186.x).
- EIA This Week in Petroleum archive (discontinued 29 October 2025, archive retained) and Natural Gas Weekly Update archive (from January 2002) are reached from the EIA pages above; Dukascopy 1-minute data are free for personal use and may not be redistributed.

### Not found
- Last year's top-marked Strathclyde economics dissertation: undergraduate dissertations are not published and no prize-winner list was found. Ask Dr Gifuni or the department, as the email does.

---

## Glossary

- **Event study.** Measure how a price moves in a short window around a dated announcement, compared with ordinary days.
- **Surprise.** The released number minus what the market expected (a consensus forecast), or the price jump in a tight window around a release.
- **Känzig surprise.** The change in oil futures prices in a narrow window around OPEC announcements (Känzig 2021), used as a shock series or instrument for oil supply news.
- **Instrument / IV (instrumental variable).** Use an exogenous event, something the market did not cause, to isolate one source of price variation; 2SLS is the two-step regression that does it.
- **Placebo.** Run the same test on days or series where nothing should happen; an "effect" there means the design is broken.
- **Difference-in-differences (DiD).** Compare the change in a treated series across a regime date with the change in an untreated control over the same dates.
- **Dollar factor.** The part of every currency's move against the dollar that is really the dollar moving; purge it with a basket of currencies unrelated to the shock.
- **HAC (Newey-West, Hodrick) standard errors.** Standard errors that stay valid when regression errors are autocorrelated and heteroskedastic, as with overlapping multi-month forecast errors; Hodrick (1992) behaves better in small samples with overlapping horizons; Hansen-Hodrick errors are the overlapping-horizon variant. Date-clustered errors do the same across units on one date; Driscoll-Kraay errors handle correlation across countries and over time in a panel.
- **Block bootstrap.** Resample the data in blocks of consecutive observations so that autocorrelation is preserved in the resamples.
- **Permutation test.** Reshuffle the dates or labels, recompute the statistic many times, and read the p-value off that distribution.
- **Mincer-Zarnowitz regression.** Regress the outcome on the forecast; an unbiased, efficient forecast gives intercept 0 and slope 1.
- **Nordhaus test and fixed-event forecasts.** A fixed-event forecast targets one date (next year's demand) and is revised each month; Nordhaus (1987) tests whether successive revisions are uncorrelated, as an efficient forecaster's should be.
- **Coibion-Gorodnichenko regression.** Regress forecast errors on forecast revisions; a positive slope means forecasters under-react to news (information rigidity).
- **Vintage.** The version of a forecast or data series as it stood on a given date, so that nothing published later leaks into the test.
- **MSPE ratio.** Mean squared prediction error of a model divided by that of a benchmark (usually no-change); below one means the model is better.
- **Diebold-Mariano (DM) test with the HLN correction.** Tests whether two forecasts' average loss differs; Harvey, Leybourne and Newbold (1997) correct its small-sample size at longer horizons.
- **Clark-West test.** A version of the DM test for nested models that removes the bias against the larger model caused by estimating extra parameters.
- **Forecast encompassing.** Regress the outcome on two forecasts together; if one gets a weight of zero, the other already contains all its information.
- **Model Confidence Set (MCS).** A procedure that keeps the set of models that cannot be told apart from the best at a given confidence level.
- **CRPS (continuous ranked probability score).** The average squared distance between the forecast's cumulative distribution and the step function at the outcome; lower is better; for a point forecast it equals the absolute error.
- **Log score.** The log of the density the forecast placed on the outcome; higher is better. The average difference in log score between two forecasts is the Kelly growth rate.
- **PIT histogram.** Probability integral transform: for each outcome, the probability the forecast density placed on values at or below what happened. If the density is right, these numbers are uniform between 0 and 1 and the histogram is flat.
- **Berkowitz test.** Converts PITs to normal scores and tests jointly for mean zero, variance one and no autocorrelation: a likelihood-ratio test of calibration.
- **Knüppel test.** A calibration test on moments of the PITs that stays valid when forecasts overlap at horizons beyond one step.
- **Christoffersen tests.** Checks that a stated 95% band contains the outcome 95% of the time (unconditional coverage) and that misses do not cluster (independence).
- **Calibration and coverage.** A band is calibrated if its stated probability matches the realised frequency; coverage is that realised frequency.
- **Risk-neutral density.** The distribution implied by option prices; it includes risk premia, so it is not a forecast of what will happen.
- **Variance risk premium (VRP).** Implied variance (what options charge) minus the variance then realised; negative on average for oil, meaning options over-price variance.
- **Lognormal density.** The distribution of a price whose log is normally distributed; one volatility number and a centre define it.
- **GARCH and HAR.** Two standard models for time-varying volatility: GARCH updates variance from past squared returns and past variance; HAR regresses realised variance on its daily, weekly and monthly averages.
- **OVX.** Cboe's 30-day implied volatility index for crude oil, built from USO options and interpolated between two expiries.
- **Kelly growth.** The long-run growth rate of a bettor's bankroll when each bet is sized to maximise expected log wealth (Kelly 1956). If you hold density p and are offered the benchmark density q as fair odds, expected log growth equals the average of log p minus log q at the outcomes, the log-score gap, which is the Kullback-Leibler divergence of p from q. It is an identity, not a tradeable profit.
- **Fractional Kelly.** Betting a fixed fraction of the Kelly stake to allow for estimation error.
- **Sharpe ratio and drawdown.** Average excess return divided by its standard deviation; the largest peak-to-trough loss of a bankroll path.
- **Pre-registration.** Writing down the hypothesis, the primary test and the rule before looking at the outcome data.
- **Minimum detectable effect.** The smallest effect a test could find with reasonable probability given the sample and the noise; reporting it stops a wide-interval null being dressed up as a result.
- **White reality check.** A bootstrap test of whether the best of many rules tried beats the benchmark once you account for having searched over all of them.
- **Romano-Wolf.** A step-down procedure controlling the chance of any false rejection across a family of tests, with more power than Bonferroni because it uses the correlation between tests.
- **Bayesian forecast combination and posterior weight.** Weighting two forecasters by how likely each one's track record makes the data; the weight updates as evidence arrives.
- **Beta-binomial posterior.** The textbook Bayesian update of a probability (here, that an announcement is delivered) from counts of past successes and failures.
- **Breakeven inflation.** Nominal bond yield minus inflation-linked yield; the market's inflation expectation plus risk and liquidity premia.
- **TIPS liquidity premium.** The part of a breakeven that reflects how hard inflation-linked bonds are to trade; it collapsed in late 2008 and March 2020 and must be controlled for.
- **DV01.** The change in a position's value for a one-basis-point move in yield; used to turn a beta into a hedge notional.
- **Cheap talk.** A costless message from a sender with a known incentive; the receiver should discount it.
- **Theory of storage.** Low inventories make prices more sensitive to news, so volatility should be higher when the tanks are empty.
- **Front-month and settlement window.** The nearest futures contract; the end-of-day period over which the exchange sets the official closing price (ICE Endex gas: 17:05-17:15 CET).
- **LNG, feedgas, regasification, cargo.** Liquefied natural gas; the gas flowing into US LNG export plants (feedgas near nameplate capacity means exports are at their limit); the terminal process in Europe that turns the liquid back into gas; one shipload.
- **LDA.** Latent Dirichlet allocation, a statistical topic model that represents each document as a mixture of word clusters learned from the corpus.
- **Loughran-McDonald dictionary.** A finance-specific word list (negative, positive, uncertainty, weak and strong modal words) used to score text; licensed for academic use.
- **Flesch-Kincaid and Gunning fog.** Readability formulas based on sentence length and word length.
- **TOSI.** Dr Gifuni's text-based oil sentiment index, the first principal component of his BERT and VADER news indices.
- **SV-BVAR.** A Bayesian vector autoregression with stochastic volatility, his main forecasting model.
- **AUROC.** Area under the receiver operating characteristic curve; a measure of directional forecast accuracy.
- **TTF, NBP, Henry Hub.** The Dutch, British and US natural gas benchmark prices.
- **EIA, STEO, MPUR, WPSR, TWIP, NGWU.** The US Energy Information Administration; its monthly Short-Term Energy Outlook; the Market Prices and Uncertainty Report supplement that states the band bounds; the Weekly Petroleum Status Report (Wednesday 10:30 ET); This Week in Petroleum (prose, 1:00 pm, discontinued October 2025); the Natural Gas Weekly Update (Thursday afternoon).
- **MOMR, OMR.** OPEC's Monthly Oil Market Report; the IEA's Oil Market Report.
- **SPR.** The US Strategic Petroleum Reserve.
- **LDI crisis.** The September-October 2022 forced selling of gilts by pension funds running liability-driven investment strategies.
- **Brexit template.** Dr Gifuni's public design: dated announcements, daily reactions across 15 economies, HAC and bootstrap inference, placebo days, then spillovers.
- **VAR and structural VAR.** A vector autoregression regresses several series on their own and each other's lags; a structural VAR adds identifying assumptions so the shocks can be named (oil supply, aggregate demand, oil-specific demand, as in Kilian 2009). "Kilian-style oil VAR" means that four-variable design.
- **OLS, |t|, R-squared.** Ordinary least squares is the standard regression fit; |t| is the absolute t-statistic (above 2 is the usual 5% threshold); R-squared is the share of variance the regression explains.
- **Reduced form and first stage.** The reduced form is the direct regression of the outcome on the shock; the first stage is the regression of the endogenous variable on the instrument; the IV estimate is the one divided by the other.
- **Fixed effects.** Dummy variables for each unit (currency, country) in a pooled panel, so that only within-unit variation identifies the coefficient.
- **Threshold or regime regression.** A regression whose slope is allowed to change when a state variable (feedgas utilisation, oil relative to a budget cut-off) crosses a pre-specified value; a kink is the same idea with a continuous slope change.
- **Orthogonalise.** Regress one variable on another and keep the residual, so that the residual carries only the information the second variable does not.
- **Recursive standardisation.** Standardising an index at each date with only the mean and variance observed up to that date, so no future information leaks in.
- **PCA (principal components).** A method that combines several correlated indices into one series carrying most of their common variation; the first principal component is that series.
- **Cointegration.** Two price levels that wander but stay tied together over time; integration studies test this on levels and say nothing about identified news.
- **Unit root and spurious regression.** A series whose shocks never die out (near-unit-root) can produce apparently strong regressions between unrelated series; working in changes with HAC errors avoids this.
- **Stationary bootstrap.** A block bootstrap with random block lengths, which keeps each resampled series stationary.
- **ARIMA.** A standard single-series time-series model (autoregressive, differenced, moving-average), used here to build a model-based inventory forecast as the surprise benchmark when no consensus is free.
- **Wilcoxon test.** A non-parametric test of whether a sample of returns is centred on zero, without assuming normality.
- **Herding test.** Tests whether a forecaster's revisions move towards other forecasters' numbers beyond what its own information warrants.
- **Consensus.** The average of analysts' forecasts of a scheduled release, collected by vendors and economic calendars; actual minus consensus is the surprise.
- **Call and put options, strike, notional.** A call pays if the price ends above the strike, a put if it ends below; the notional is the size of the position. The Energy Price Guarantee behaved like a call on gas written by the Treasury; the SPR refill band like a put on WTI written by the government.
- **Variance swap (synthetic).** A position whose payoff is realised variance minus a fixed level; "synthetic" here means built from OVX changes and futures returns rather than traded options, so the edge it shows is an upper bound.
- **Diffusive variance and additivity.** The ordinary day-to-day variance of a price; event variance is the extra variance a scheduled release delivers, and the OVX design assumes the two add up within the 30-day window.
- **Buffer stock, Salant, Krugman-Rotemberg, target zone.** Salant (1983) shows a finite stockpile defending a price can be attacked and exhausted; Krugman and Rotemberg extend the logic to limited reserves. A target zone (Svensson 1991) is the exchange-rate version with an obligated central bank, which is why it does not transfer directly to a discretionary SPR buyer.
- **Elasticity; basis point.** The percentage change in one variable per 1% change in another; one hundredth of a percentage point.
- **Futures curve, deferred contracts, roll.** The set of futures prices across expiries; contracts expiring after the front month; switching a continuous series from the expiring contract to the next (roll rules fix the date and the join).
- **Bid-ask spread and drift.** The gap between the price to buy and to sell, the first trading cost; drift is a slow price movement after the immediate reaction to a release.
- **MIDAS and MF-VAR.** Mixed-data-sampling regressions and mixed-frequency VARs use daily or weekly inputs to forecast a monthly target; Dr Gifuni's 2023 paper found they add little for monthly oil prices.
- **EPU, GPR, OPU.** The Economic Policy Uncertainty index (Baker, Bloom and Davis), the Geopolitical Risk index (Caldara and Iacoviello) and the Oil Price Uncertainty index: text-based uncertainty measures used as controls.
- **BERT and VADER.** The two text-scoring methods behind TOSI: a neural language model and a rule-based sentiment lexicon.
- **Prior and posterior.** In Bayesian updating, the belief before the data and after it; the beta-binomial posterior above is one example.
- **FOMC and USMPD.** The Federal Open Market Committee, the Fed's rate-setting body; the US Monetary Policy Event-Study Database of intraday surprises around its announcements (Acosta et al. 2025).
- **NYMEX, CME, ICE Endex.** The New York Mercantile Exchange (part of CME Group), where WTI and Henry Hub futures trade; ICE Endex is the Dutch exchange where TTF trades.
- **CFD.** A contract for difference, a broker-quoted derivative tracking a price; Dukascopy's minute data are CFD quotes, not exchange prices.
- **Bcf and MMBtu.** Billion cubic feet (the unit of the EIA storage number); million British thermal units (the unit of Henry Hub and the CME TTF contract, against EUR/MWh for ICE TTF).
- **Degree-days.** Heating or cooling degree-days, a weather measure that drives gas demand and so predicts storage changes.
- **API report.** The American Petroleum Institute's weekly inventory estimate, released on Tuesday evenings, the day before the EIA's WPSR; it sits inside the Tuesday-close-to-Wednesday-close window.
- **Commitments of Traders (COT).** The CFTC's weekly report of futures positions by trader type.
- **JODI and IEF.** The Joint Organisations Data Initiative oil database and the International Energy Forum that publishes it, along with monthly comparisons of agency forecasts.
- **GIE AGSI+ and ALSI+.** Gas Infrastructure Europe's daily databases of European gas storage and LNG-terminal inventories.
- **ONS SAP.** The Office for National Statistics' series of the System Average Price of gas, the daily UK (NBP) wholesale price.
- **Energy Price Guarantee, index-linked gilts, RPI.** The UK government's 2022-23 cap on household energy unit prices; UK government bonds whose payments rise with the Retail Prices Index; RPI breakevens are the UK equivalent of US breakevens.
- **Mini-budget.** The UK fiscal statement of 23 September 2022 that triggered the gilt sell-off and the LDI crisis.
