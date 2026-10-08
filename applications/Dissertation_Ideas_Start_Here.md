# Dissertation ideas: start here (one page)

Read this first. The detail is in two longer files:

- [`Dissertation_Ideas_Ranked_and_Extended.md`](Dissertation_Ideas_Ranked_and_Extended.md): the rankings, the verdict on your existing five, every new idea with all its pros and cons, the final ranking, the email to Dr Gifuni, how the top two map to marking criteria, sources and a glossary. About 25,000 words.
- [`Dissertation_Ideas_Full_Detail.md`](Dissertation_Ideas_Full_Detail.md): the complete working draft behind it, with full method menus, week-by-week plans and chapter budgets.

Two honesty notes. The scores come from three independent model-generated scoring passes (a hedge-fund researcher persona, a prop-trading persona and a Strathclyde examiner persona), not from people; treat them as a structured opinion. And the environment that prepared this could not open most data websites, so claims about what a dataset contains rest on search-engine snippets unless marked verified. The week-1 data check is the first real task for whichever idea you pick.

## Your existing five, ranked

**By originality:** 1. Who is short gas? (Energy Price Guarantee in gilts), 2. Reading the tell (Gassco return dates), 3. Calling the cartel's bluff, 4. TOSI vs OVX, 5. Could the newspapers call OPEC?

**By quant appeal:** 1. Who is short gas?, 2. Reading the tell, 3. TOSI vs OVX, 4. Calling the cartel's bluff, 5. Could the newspapers call OPEC? (the first four tie on score; the order follows where each pass placed them).

**Do they cover everything? No.** All three passes said the same. Keep "Who is short gas?" as a reserve (original and on-brief, but it sits inside the 2022 mini-budget and pension-fund crisis). Keep "Reading the tell" only if Gassco sends you outage history older than 2024. Drop TOSI vs OVX (it re-runs Dr Gifuni's own model and index, which neither a prize committee nor a quant counts as original), drop Calling the cartel's bluff (it needs a paid terminal), drop Could the newspapers call OPEC? (a one-regression robustness check on someone else's instrument).

## The new ideas that matter most

1. **J. Who Hedges the Barrel?** On the days OPEC speaks, does a petro-currency's oil beta shrink, kink or turn one-sided when its government hedges oil for it: Norway's pre-announced krone conversions for the oil fund (against unhedged Canada), Russia's 2017-2022 budget rule that bought dollars only above a cut-off oil price, and Mexico's annual put hedge? Free, small, partly verified data (Känzig's OPEC-day surprises, daily FX from FRED or the ECB, three hand-collected institutional tables). Weak point: no text component and FX is not Dr Gifuni's field, so frame it as his topic 3 (institutions responding to commodity price projections). Ranked first by all three passes.
2. **A. The Atlantic Switch.** The EIA's US gas storage number lands 35 minutes before TTF settles; use it as an instrument for how much of a US gas shock crosses the Atlantic, and show the pass-through switches on only when an LNG cargo is worth loading. Best desk story on the list. Weak point: free daily TTF history before about 2017-2021 is unverified and the effect may be too small to detect.
3. **F. Does the Dealer Lie About the Deck?** Score 25 years of OPEC's monthly demand forecasts, vintage by vintage, against the EIA and against OPEC's own later numbers; test whether the bias tracks OPEC's production stance and whether the market has learned to discount it. Free data, Dr Gifuni's forecast-evaluation toolkit, a text chapter in his idiom. Weak point: depth of the OPEC report archive and a lot of hand extraction.
4. **G. Pricing the Wednesday.** The Tuesday-to-Wednesday close is the only step of the week that takes an EIA report out of OVX's 30-day window without changing its trading-day count, so a free index and a calendar give you the options market's price for one report; test whether it is fair. Highest quant appeal and highest feasibility; cannot fail on data. Weak point: the headline drop is already published and supervisor fit is the lowest.
5. **K. The Forecaster's Tell.** Every month the EIA prints a WTI point forecast, an options-implied 95% band and two pages of prose. Build the text dataset, test whether the published bands are calibrated and whether re-centring them on the EIA's own number changes that, and test whether the EIA's hedging language predicts its own misses. Highest Dr Gifuni fit of the strong ideas (9.0); directly re-tests his finding that text-based uncertainty measures forecast poorly. Weak point: the text result is probably a null, so the band work must lead.
6. **E. The Government Put.** A ledger of what the US Strategic Petroleum Reserve promised versus delivered since 1985, whether traders learned to discount the announcer, and whether the 2022 "$67-72 refill" floor was ever priced. Original and on topic 3; weak point: very small samples and 2022 confounding.

Five more (D, L, I, B and the two carried-forward reserves) are in the main document with shorter notes. One was dropped outright (H, under-identified).

## Recommendation

**Pitch J, with K as the fallback.** J is the only idea scoring 8 or above on originality, quant appeal and prize potential while staying feasible; its predictions can be written down before you touch the data, which is what a prize committee and a quant interviewer both reward. K is the idea Dr Gifuni is most likely to find personally interesting and most able to supervise from his public work alone. Reserves: A if the TTF data pass week 1 and you want the strongest gas-desk story; G if you decide the quant interview matters more than supervisor fit.

## This week

1. Do J's week-1 check (section 4 of the main document): download Känzig's and Degasperi's files, merge daily FX, run the simplest regression of NOK and CAD on the OPEC-day surprise, locate the Norges Bank krone-conversion table (a search snippet suggests it runs back to 2000; confirm) and read Rüth et al. (2026) to make sure it does not already include fiscal rules.
2. Spend two evenings on K's check: 24 STEO PDFs, the Market Prices and Uncertainty Report band bounds, OVX and WTI from FRED.
3. Read the conclusion of Dr Gifuni's open-access International Journal of Forecasting paper and chapters 2-4 of his thesis. Only then send the email in section 5 of the main document, and ask for the anonymised top dissertation and the marking grid.

Nothing in these files is dissertation text. They are ideas, plans and checks; the work is yours.
