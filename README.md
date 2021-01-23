# MED5-Data

For results and more explanation run `AnalysisReport.Rmd`

## Sanity check

    P3      Body: 30(6 fails)       Blocks:  30(6 fails)
    P4      Body: 30(11 fails)      Blocks:  30(13 fails)
    P5      Body: 30(11 fails)      Blocks:  30(8 fails)
    P6      Body: 30(13 fails)      Blocks:  30(11 fails)
    P7      Body: 30(1 fails)       Blocks:  14(0 fails)
    P8      Body: 30(4 fails)       Blocks:  30(1 fails)
    P9      Body: 30(7 fails)       Blocks:  30(6 fails)
    P10     Body: 30(5 fails)       Blocks:  30(14 fails)
    P11     Body: 30(10 fails)      Blocks:  30(10 fails)
    P12     Body: 30(10 fails)      Blocks:  30(8 fails)
    P13     Body: 30(4 fails)       Blocks:  30(1 fails)
    P14     Body: 30(10 fails)      Blocks:  30(10 fails)
    P15     Body: 30(1 fails)       Blocks:  30(1 fails)
    P16     Body: 30(6 fails)       Blocks:  30(1 fails)
    P17     Body: 30(2 fails)       Blocks:  30(4 fails)
    P18     Body: 30(1 fails)       Blocks:  30(10 fails)
    P19     Body: 30(1 fails)       Blocks:  30(4 fails)
    P20     Body: 30(2 fails)       Blocks:  30(5 fails)

## Thresholds

The estimates of the thresholds can be found in `thresholds.csv`. (analysed in https://github.com/The-Bestest/CleanVillainousPreprocessor)

`StartThresholdEstimate` is the the estimation of the threshold set from the first 5 trials.
`MainThresholdEstimate` is the estimation of the threshold from the rest of the trials.

If `StartThresholdEstimate` and `MainThresholdEstimate` are significantly different, it means the threshold has been manipulated to keep the participant's performance high. This is usually true for participant's first level (`Body` for odd-numbered participants and `Blocks` for even-numbered ones)..

In some cases `StartThresholdEstimate` and `MainThresholdEstimate` are the same or very close - this means no threshold correction was made during the trial. This is usually true for the particpant's second level (`Blocks` for odd-numbered participants and `Body` for even-numbered ones).
