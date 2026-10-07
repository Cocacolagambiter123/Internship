# Your top five dissertation ideas, ranked

You were right: the earlier shortlist mostly re-ran designs that already exist. Your working title has a second problem. Gifuni's own MF-VAR vs MIDAS paper found that mixed-frequency text adds little. A "text + MIDAS for gas" dissertation would ask him to supervise something he has already found weak. The ranking below puts originality first, then fit with his work, feasibility, interview value and fit with you.

## Last year's top dissertation

I could not find it. Strathclyde does not publish undergraduate dissertations, and the department does not list its best-dissertation prize winners online. Ask Gifuni whether he can share an anonymised copy, or what made it stand out. Ask the honours coordinator for the marking grid too.

His own work points to what he rewards:
- a new measure built from raw text;
- rigorous out-of-sample testing: forecast error against a no-change forecast, formal tests of the difference (Diebold-Mariano), scores for the full forecast distribution (CRPS) and for direction (AUROC), with crisis periods tested separately;
- honest reporting of results that do not work;
- MATLAB code someone else can rerun;
- relevance to policy.

## 1. Reading the tell: are Norwegian gas outage return dates biased forecasts?

- **Question:** When Gassco, the operator of the Norwegian gas pipeline network, announces an unplanned outage, is its stated return date an unbiased forecast? Do Dutch (TTF) and British gas prices react to that date, or to a date corrected for Gassco's track record?
- **Why it is original:** The reviewer rated it fully new.
  - The closest work is a 2026 GitHub study of 376 Gassco messages. It found no average price reaction, but it never checked the stated durations against what happened.
  - Valitov and Maier (2020, *Energy Economics*) study power-plant outages but take the announced end dates as given.
  - What is new: scoring the operator's return date as a forecast.
- **Why Gifuni will like it:**
  - It is a forecasting paper that uses his own evaluation methods.
  - It is about gas, which is in his supervision brief but in none of his papers.
  - Each notice has a free-text remarks field ("duration uncertain"). That lets you re-test his finding that text-based uncertainty measures forecast poorly, in a setting where they might work.
- **Data:** Gassco's outage-notice platform (umm.gassco.no); ENTSOG pipeline flows; National Gas Data Portal (British gas price and interconnector flows); GIE AGSI+ storage data; daily TTF prices.
- **Method:**
  1. Regress the actual outage length on the announced length.
  2. Model which outages get extended and how long restarts take.
  3. Build a corrected forecast step by step through time and score it against the announced dates.
  4. Test whether the gap between the announced and corrected lengths moves TTF and British gas prices, using planned maintenance as a placebo.
- **Main risk:** Gassco's archive may only cover 2024-26, about 150-170 outages. Treat week 1 as a data check: download the export, email Gassco for older history, and start recording the live feed.
- **Interview line:** "I scored Norwegian pipeline operators as forecasters and tested whether gas traders already read their tell."

## 2. Does the news know something the oil options market doesn't?

- **Question:** Does Gifuni's oil sentiment index (TOSI) improve one-month forecasts of the full range of WTI futures prices, beyond the range the options market already implies (measured by the OVX volatility index)? How fast would a Kelly bettor's bankroll have grown trading the difference?
- **Why it is original:** Partly done.
  - Høg and Tsiaras (2011) compare options-based oil price distributions with time-series models, but use no text.
  - Cao, Wang and Yu (2025) build a news-based oil volatility index.
  - No one has scored text against the options market's own distribution.
- **Why Gifuni will like it:** His paper has two gaps: it never measures money made, and it never compares against what markets expect. This fills both, using his public code and data.
- **Data:** His GitHub repository (TOSI, reliable up to August 2023); OVX from FRED (series OVXCLS); EIA NYMEX futures prices (available up to April 2024).
- **Method:** Three stages, each a complete result on its own:
  1. Rerun his model against a tougher benchmark, the month-end price (from Ellwanger and Snudden).
  2. Compare forecasts from the options market, a time-series model, and the same model plus TOSI. Report the cumulative score gap as a Kelly bankroll, plus a realistic trading strategy after costs.
  3. Optionally, test whether text uncertainty predicts the gap between implied and actual volatility.
- **Main risk:** There are only about 140 months to test on, and "the market wins" is the most likely answer. Commit to five tests in advance and present a market win as a finding in its own right.
- **Interview line:** "I scored a published news signal against the options market's odds and turned the forecast score into a Kelly bankroll."

## 3. Who is short gas? The Treasury's gas exposure in gilt prices, 2022-2026

- **Question:** The 2022 Energy Price Guarantee was in effect a gas call option written by the Treasury. Did it move the gas risk in gilt prices from inflation into the government's finances? Did that switch off once the scheme was cut back?
- **Why it is original:** The reviewer rated it fully new.
  - Pinter (2023, Bank of England working paper 1019) explains the 2022 gilt crisis through forced selling by pension funds (LDI), not gas.
  - Shackleton (2025) links the guarantee to gilt yields only in words, with no numbers.
- **Why Gifuni will like it:**
  - It is exactly topic 3 of his brief: how policy makers respond to commodity price crises.
  - It reuses the design of his Brexit paper, which measured bond-yield reactions around key dates.
  - His own institute, the Fraser of Allander Institute, costed the guarantee.
- **Data:** Bank of England yield curves; daily TTF and British gas prices; German government bond curve (Bundesbank); gov.uk and Ofgem for the policy dates.
- **Method:**
  1. Split each gilt move into three parts: expected interest rates, expected inflation, and a government risk premium.
  2. Measure how each part responds to gas price moves, and how that changes with the Treasury's exposure.
  3. Use oil as a placebo, since petrol was not covered by the guarantee.
  4. Compare with German and US bonds.
  5. Test out of sample on the 2026 Strait of Hormuz shock.
- **Main risk:** The September 2022 mini-budget crisis overlaps the guarantee. Report results with and without 23 September to 14 October 2022. Add a small news-text index from the Guardian so Gifuni gets his text component.
- **Interview line:** "The Treasury sold the public a call option on gas; I measured whether gilts started trading the UK as short gas."

## 4. Calling the cartel's bluff: does the market price OPEC+ promises by each member's record?

- **Question:** Does the oil futures market discount an OPEC+ production promise according to how well that member has kept past promises? Is a previously reliable member punished more when caught cheating?
- **Why it is original:** Partly done.
  - Pescatori and Nazer (2022, IMF) describe compliance but never link it to price reactions.
  - Spencer and Bredin (2019) study how the futures curve reacts to OPEC decisions, but ignore credibility.
- **Why Gifuni will like it:** It is topic 3 of his brief, oil was the subject of his PhD, and it includes a text score of how much each OPEC statement hedges.
- **Data:** Känzig's public file of OPEC announcement price reactions; OPEC press releases and Monthly Oil Market Reports; EIA Brent prices.
- **Method:**
  1. Give each member a running credibility score, updated only with information public at the time.
  2. Test whether promises from low-credibility members move only near-term prices, not later contracts.
  3. Measure how Brent reacts on the roughly 115 report days that reveal who actually cut.
- **Main risk:** There are few announcements. Add missing promises by hand, and ask the library about access to a Bloomberg or Refinitiv terminal for longer-dated futures prices.
- **Interview line:** "I built a poker-style tracker for OPEC+: a running record of who actually delivers their cuts."

## 5. Could the newspapers call OPEC?

- **Question:** Does news text in the weeks before an OPEC meeting predict the direction or size of the surprise in Känzig's announcement series, beyond what financial markets already knew?
- **Why it is original:** Partly done. Mori and Peersman (2024) show that financial market data predict these surprises. Whether news text adds anything beyond the markets has not been tested.
- **Why Gifuni will like it:** It joins the two strands of his PhD (news text and oil shocks) and reuses his data and code.
- **Data:** His repository (14 text indices); Känzig's repository.
- **Method:** Regress about 130-140 announcement surprises on prior news text, checking significance by reshuffling the dates. Add the Forni-Gambetti test, which checks whether supposed surprises could have been predicted, with Mori and Peersman's financial variables as controls.
- **Main risk:** The ideas are hard and there are few events. Read Forni and Gambetti (2014) first.
- **Interview line:** "I tested whether 'unforeseeable' OPEC surprises were in the newspapers first."

## Recommendation

Choose idea 1. It is the only fully new idea that is also a forecasting paper in Gifuni's own language. It brings gas into his work. It has a strategic twist: are operators more optimistic about return dates when supply is tight? Gas trading desks will recognise the story. Its weakness is data. If you cannot get Gassco's history in week 1, switch to idea 2, which uses only his public data and cannot fail.

## Suggested first email

> Dear Dr Gifuni, I would like to propose treating the return dates in Norwegian gas outage notices as forecasts, testing whether they are biased and whether TTF and NBP prices already allow for that bias, using your forecast-evaluation methods and a dictionary score of the notices' text. My fallback is testing TOSI against the forecast implied by oil options prices. Could we discuss which you think is stronger? I would also be grateful for an anonymised example of last year's top-marked dissertation, or a note on what set it apart.

## Sources used

The Gassco site, and the GitHub study (jauricestudios/norway-ttf-event-study), were blocked from this environment today, so I could not check them myself. The details on them in idea 1 come from an earlier research pass.

- https://doi.org/10.1016/j.ijforecast.2025.09.001 (Gifuni, IJF 2026)
- https://doi.org/10.2139/ssrn.4574350 (Gifuni, MF-VAR vs MIDAS)
- https://doi.org/10.2139/ssrn.4095329 (Gifuni, Brexit spillovers)
- https://github.com/gifuniluigi/ijof-wom_esui
- https://www.strath.ac.uk/courses/undergraduate/economics/ (dissertation prize)
- https://umm.gassco.no
- https://github.com/jauricestudios/norway-ttf-event-study
- https://ideas.repec.org/a/eee/eneeco/v89y2020ics0140988320301250.html (Valitov and Maier 2020)
- https://transparency.entsog.eu
- https://agsi.gie.eu
- https://doi.org/10.1002/fut.20487 (Høg and Tsiaras)
- https://doi.org/10.1002/fut.70047 (Cao, Wang and Yu)
- https://doi.org/10.5547/01956574.44.4.rell (Ellwanger and Snudden)
- https://www.eia.gov/dnav/pet/pet_pri_fut_s1_d.htm
- https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4407740 (Pinter 2023)
- https://doi.org/10.1111/ecaf.12695 (Shackleton 2025)
- https://www.bankofengland.co.uk/statistics/yield-curves
- https://doi.org/10.5089/9798400219788.001 (Pescatori and Nazer)
- https://doi.org/10.1016/j.eneco.2019.01.018 (Spencer and Bredin)
- https://github.com/dkaenzig/oilsupplynews
- https://doi.org/10.1257/aer.20190964 (Känzig 2021)
- https://doi.org/10.1016/j.jmoneco.2014.04.005 (Forni and Gambetti)
- Mori and Peersman (2024), Marco Fanno Working Paper 314 (no URL found)

## Facts checked separately

- **2026 Strait of Hormuz shock (idea 3 test period): real.** US and Israeli strikes on Iran in February 2026 closed the strait. Brent peaked intraday at $126.41 on 30 April and was around $87-92 by late August.
- **UAE exit from OPEC: real.** It was announced on 28 April 2026 and took effect on 1 May 2026. For idea 4 this is a fresh credibility event.
- **Not checked (blocked here):** how far back Gassco's outage archive goes, and the GitHub study's figures (376 messages, 2024-26). Check both yourself in week 1 before committing to idea 1.
