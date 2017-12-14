---
title       : BMI Calculator App
subtitle    : 
author      : 
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Overweight, Obesity and BMI

Body mass index (BMI) is a measure based on height and weight that applies to adult men and women, and it's useful indicator for weight status: 

<table>
<tr><td>Status</td><td width="25%">BMI</td><td width="50%">&nbsp;</td></tr>
<tr><td>Underweight</td><td>Below 18.5</td><td width="50%">&nbsp;</td></tr>
<tr><td>Normal</td><td>18.5-24.9</td><td width="50%">&nbsp;</td></tr>
<tr><td>Overweight</td><td>25.0-29.9</td><td width="50%">&nbsp;</td></tr>
<tr><td>Obesity</td><td>30.0 and Above</td><td width="50%">&nbsp;</td></tr>
</table>         

There are many potential health risks associated with being overweight or obese. In particular, obesity is common, serious and costly:

* More than one-third (34.9% or 78.6 million) of U.S. adults are obese. 
* Obesity-related conditions include heart disease, stroke, type 2 diabetes and certain types of cancer, some of the leading causes of preventable death. 
* The estimated annual medical cost of obesity in the U.S. was 147 billion USD in 2008; the medical costs for people who are obese were 1,429 USD higher than those of normal weight.

--- .class #id 

## The BMI Calculator
The BMI Calculator takes the following inputs:
* weight (in pounds)
* height in feet and/or inches

and outputs the following:
* BMI based on the weight and height. The formula is ${(weight * 703) / (height^2)}$, where height is converted into inches first.
* Weight status: underweight, normal, overweight, or obese.

---

## Example

If a user enters the following:

* weight: 150 lbs.
* height: 5 feet and 8 inches

The BMI will be:

```
## [1] 22.8
```

and the weight status will be:

```
## [1] "normal weight"
```

---

## References

* The obsecity prevalence data used in the application is from <a href="http://www.cdc.gov/obesity/data/table-adults.html">CDC web site</a>.

* The formula for BMI calculation is for adults only. For children under 19 years old, a different formula should be used and can also be found at CDC web site.

