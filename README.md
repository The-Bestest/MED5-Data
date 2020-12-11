# MED5-Data

For results and more explanation run `AnalysisReport.Rmd`

## Thresholds

The estimates of the thresholds can be found in `thresholds.csv`. (analysed in https://github.com/The-Bestest/CleanVillainousPreprocessor)

`StartThresholdEstimate` is the the estimation of the threshold set from the first 5 trials.
`MainThresholdEstimate` is the estimation of the threshold from the rest of the trials.

If `StartThresholdEstimate` and `MainThresholdEstimate` are significantly different, it means the threshold has been manipulated to keep the participant's performance high. This is usually true for participant's first level (`Body` for odd-numbered participants and `Blocks` for even-numbered ones)..

In some cases `StartThresholdEstimate` and `MainThresholdEstimate` are the same or very close - this means no threshold correction was made during the trial. This is usually true for the particpant's second level (`Blocks` for odd-numbered participants and `Body` for even-numbered ones).