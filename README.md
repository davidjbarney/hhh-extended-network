# Overview
This project maps the social network structure of popular hip hop artists through track features.

Data is collected via the [Spotify API](https://developer.spotify.com/documentation/web-api/) using the [`spotifyr`](https://github.com/charlie86/spotifyr) library in [R](https://www.r-project.org/). 

This project is largely organized as two notebooks in the `2_scripts` subdirectory:
1. `rap-feature-network-data-pipeline.Rmd`
	* Data collection and reshaping procedure 
2. `rap-feature-network-analysis.Rmd`
	* Network construction, TBD analyses

# Disclaimer
This is a personal project, and definitely not-for-profit. Code and data in this repo comply with the [Developer Terms of Service](https://developer.spotify.com/terms/) for Spotify's API.