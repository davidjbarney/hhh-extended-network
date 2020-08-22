# Overview
The goal of this project is to map the extended social network of [r/hiphopheads](https://www.reddit.com/r/hiphopheads/)' favorite artists through track features using data collected via the [Spotify API](https://developer.spotify.com/documentation/web-api/).

# Project Status
Currently, this repository contains a clean dataset with all necessary data elements for network construction. These data were last updated on 2/23/2020.

The pipeline that produced the clean dataset can be found in [/implementation](/implementation). Note that this code was written in `R 3.6.2` (Dark and Stormy Night), and has not been updated for `R 4.0.0` and beyond.

Upcoming work will streamline the data pipeline, update the dataset, and build out a full network structure.

# Data
The **r/hiphopheads Network Dataset** is a relational dataset of entities produced by parsing album artists and features at the track level. The data can be found in the [/dataset](/dataset) folder of this repository.

# Disclaimer
This is a personal project, and definitely not-for-profit. Code and data in this repo comply with the [Developer Terms of Service](https://developer.spotify.com/terms/) for Spotify's API.