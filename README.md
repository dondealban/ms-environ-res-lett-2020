# 2020 Environmental Research Letters paper
Improved estimates of mangrove cover and change reveal catastrophic deforestation in Myanmar

[![DOI](https://img.shields.io/badge/DOI-10.1088%2F1748--9326%2Fab666d-blue.svg)](https://doi.org/10.1088/1748-9326/ab666d)


## Table of Contents
- [Overview](#overview)
- [Abstract](#abstract)
- [Scripts](#scripts)
- [Citation](#citation)
- [License](#license)


<a name="overview"></a>
## Overview
This repository contains the materials used for my mangrove cover change analysis paper published in [Environmental Research Letters](https://iopscience.iop.org/journal/1748-9326) journal on March 2020. The paper, both the [main paper](https://iopscience.iop.org/article/10.1088/1748-9326/ab666d) and [supplementary material](https://iopscience.iop.org/1748-9326/15/3/034034/media/ERL_15_3_034034_suppdata.pdf), is published open-access and can be downloaded for free under a [CC BY 3.0 license](#license). The materials provided in this repository serve to supplement the published paper by creating a backup of the materials used in and developed through the study, to encourage doing better science by fostering reproducibility and transparency, and to improve the overall impact of the research—both for other researchers and my future self.

<a name="abstract"></a>
## Abstract
Mangroves are one of the world's most threatened ecosystems, and Myanmar is regarded as the current mangrove deforestation hotspot globally. Here, we use multi-sensor satellite data and Intensity Analysis to quantify and explain patterns of net and gross mangrove cover change (loss, gain, persistence) for the 1996–2016 period across all of Myanmar. Net national mangrove cover declined by 52% over 20 years, with annual net loss rates of 3.60%–3.87%. Gross mangrove deforestation was more profound: 63% of the 1996 mangrove extent had been temporarily or permanently converted by 2016. Rice, oil palm, and rubber expansion accounted for most conversion; however, our analysis revealed targeted systematic transitions of mangroves to water (presumably aquaculture) and built-up areas indicated emerging threats for mangroves from those land uses. Restoration programmes facilitated mangrove gains and represent a critical area for investment alongside protection. This study demonstrates the importance of multi-sensor satellite data for national-level mangrove change assessments, along with gross land cover transition analyses to assess landscape dynamics as well as prioritise threats and interventions in an effort to develop holistic strategies that aim to conserve important habitats.

<a name="scripts"></a>
## Scripts
The following scripts were used for implementing image processing, classification, accuracy assessment, and change analysis; and for generating figures.

#### 1. Overall Workflow
The overall workflow figure ([Fig.S1](https://github.com/dondealban/ms-environ-res-lett-2020/blob/master/figures/paper/De%20Alban%20et%20al_2020_FigS1_Overall%20Workflow.jpg) in the paper) was designed using the [yEd Graph Editor](https://www.yworks.com/products/yed) software, which uses an XML-based GraphML file format for graphs. The GraphML file used for generating the overall workflow figure is provided.

<img src="https://github.com/dondealban/ms-environ-res-lett-2020/blob/master/figures/paper/De%20Alban%20et%20al_2020_FigS1_Overall%20Workflow.jpg" width="400" />

*Scripts:* [yEd graphml](https://github.com/dondealban/ms-environ-res-lett-2020/blob/master/scripts/yEd/yEd_Overall%20Workflow.graphml) presenting the overall workflow diagram.

<a name="citation"></a>
## Citation
De Alban, J.D.T., J. Jamaludin, D.W. Wong, M.M. Than, E.L. Webb (2020). Improved estimates of mangrove cover and change reveal catastrophic deforestation in Myanmar. *Environ Res Lett.* 15(3), 034034. [doi:10.1088/1748-9326/ab666d](https://doi.org/10.1088/1748-9326/ab666d)

**BibTeX entry:**
```
@article{de_alban_improved_2020,
	title = {Improved estimates of mangrove cover and change reveal catastrophic deforestation in {Myanmar}},
	volume = {15},
  copyright = {http://creativecommons.org/licenses/by/3.0/},
	issn = {1748-9326},
	url = {https://doi.org/10.1088%2F1748-9326%2Fab666d},
	doi = {10.1088/1748-9326/ab666d},
	language = {en},
	number = {3},
	urldate = {2020-03-03},
	journal = {Environmental Research Letters},
	author = {De Alban, Jose Don T. and Jamaludin, Johanness and Wen, Donovan Wong de and Than, Maung Maung and Webb, Edward L.},
	month = mar,
	year = {2020},
	note = {Publisher: IOP Publishing},
	pages = {034034},
}
```

<a name="license"></a>
## License
Creative Commons Attribution 3.0 Unported [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/).
