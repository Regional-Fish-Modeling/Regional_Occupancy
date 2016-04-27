# Regional_Occupancy
BUGS models for regional occ research

## Fish Data Used

### Penn State

Multistate Aquatic Resources Information System (MARIS)

1991 - 2011


### Conte

Presence-Absence by Stream Reach summed over years 1991-2010. Regardless of sampling intensity (spatial or temporal).

|  state  |  data_source  |  n_reaches  |  min_yr  |  max_yr  |  range_yrs  |
|:-------:|:-------------:|:-----------:|:--------:|:--------:|:-----------:|
|   CT    |    CTDEEP     |    1267     |   1991   |   2010   |     19      |
|   CT    |     NYDEC     |      2      |   1991   |   2010   |     19      |
|   MA    |    CTDEEP     |      9      |   1991   |   2010   |     19      |
|   MA    |     MADFW     |     321     |   1991   |   2010   |     19      |
|   MA    |     NYDEC     |      4      |   2008   |   2010   |      2      |
|   MD    |     Hitt      |      2      |   1991   |   2010   |     19      |
|   MD    |     PFBC      |      1      |   1991   |   2010   |     19      |
|   ME    |     MEIFW     |    1881     |   1991   |   2010   |     19      |
|   NH    |    CTDEEP     |      1      |   1991   |   2010   |     19      |
|   NH    |     MADFW     |      4      |   1991   |   2010   |     19      |
|   NH    |     MEIFW     |      6      |   1995   |   2010   |     15      |
|   NH    |     VTFWD     |      1      |   1991   |   2010   |     19      |
|   NJ    |     NYDEC     |      2      |   1992   |   1994   |      2      |
|   NY    |    CTDEEP     |      3      |   1991   |   2010   |     19      |
|   NY    |     MADFW     |      2      |   2008   |   2010   |      2      |
|   NY    |     NYDEC     |    4350     |   1991   |   2010   |     19      |
|   PA    |     Hitt      |      5      |   1999   |   2005   |      6      |
|   PA    |     NYDEC     |      6      |   1991   |   2010   |     19      |
|   PA    |     PFBC      |     857     |   1991   |   2010   |     19      |
|   RI    |    CTDEEP     |      2      |   1991   |   2010   |     19      |
|   VT    |     MADFW     |      1      |   2004   |   2004   |      0      |
|   VT    |     NYDEC     |      1      |   1995   |   1995   |      0      |
|   VT    |     VTFWD     |     319     |   1991   |   2010   |     19      |
|   NA    |     MEIFW     |      6      |   2007   |   2007   |      0      |
|   NA    |     VTFWD     |      2      |   2006   |   2009   |      3      |


## Approach

Penn State - Bayesian, EDU random effects

Conte - Frequentist, AIC, HUC10 random effects

## Penn State Results

![](Figures/DeWeber_Wagner_Results_Table.tiff)


## Conte Results

<table style="text-align:center"><tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left"></td><td><em>Dependent variable:</em></td></tr>
<tr><td></td><td colspan="1" style="border-bottom: 1px solid black"></td></tr>
<tr><td style="text-align:left"></td><td>Prob. Occ (SE)</td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">Constant</td><td>0.314<sup>***</sup> (0.110)</td></tr>
<tr><td style="text-align:left">area</td><td>-0.416<sup>***</sup> (0.059)</td></tr>
<tr><td style="text-align:left">summer_prcp_mm</td><td>0.385<sup>***</sup> (0.098)</td></tr>
<tr><td style="text-align:left">meanJulyTemp</td><td>-0.706<sup>***</sup> (0.072)</td></tr>
<tr><td style="text-align:left">forest</td><td>0.413<sup>***</sup> (0.069)</td></tr>
<tr><td style="text-align:left">surfcoarse</td><td>0.165<sup>***</sup> (0.059)</td></tr>
<tr><td style="text-align:left">allonnet</td><td>-0.291<sup>***</sup> (0.057)</td></tr>
<tr><td style="text-align:left">devel_hi</td><td>-0.100<sup>*</sup> (0.057)</td></tr>
<tr><td style="text-align:left">agriculture</td><td>-0.664<sup>***</sup> (0.100)</td></tr>
<tr><td style="text-align:left">area:summer_prcp_mm</td><td>0.022 (0.050)</td></tr>
<tr><td style="text-align:left">meanJulyTemp:forest</td><td>-0.034 (0.050)</td></tr>
<tr><td style="text-align:left">summer_prcp_mm:forest</td><td>0.127<sup>**</sup> (0.058)</td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left">Observations</td><td>9,706</td></tr>
<tr><td style="text-align:left">Log Likelihood</td><td>-3,909.899</td></tr>
<tr><td style="text-align:left">Akaike Inf. Crit.</td><td>7,873.797</td></tr>
<tr><td style="text-align:left">Bayesian Inf. Crit.</td><td>8,067.671</td></tr>
<tr><td colspan="2" style="border-bottom: 1px solid black"></td></tr><tr><td style="text-align:left"><em>Note:</em></td><td style="text-align:right"><sup>*</sup>p<0.1; <sup>**</sup>p<0.05; <sup>***</sup>p<0.01</td></tr>
</table>

## Comparison

AUC

Metric              | Penn State | Conte |
|:------------------|:----------:|:----------:|
| AUC Training      | 0.79       | 0.95*      |
| AUC Validation    | 0.78       | 0.75       |

* indication of overfitting through extensive AIC?


## Limitations of Studies

* No colonization-extinction (static, not dynamic models)
* No standardized effort
* No detection correction

