# r/hiphopheads Network Dataset Documentation
This subfolder hosts the [**r/hiphopheads Network Dataset**](hhh_network_dataset.csv), which tracks relationships between artists through mutual song appearances. 

## Codebook
Variable | Description
---------|-------------
`artist_name`| Entity (artist, band, etc) name. *String*.
`artist_uri`| Unique entity identifier for primary entity on album or track. *String*.
`artist_genres`| Genre categories for primary entity. *String. Multiple genres are delimited by commas.*.
`artist_followers`| Count of Spotify users following primary entity. *Numeric*.
`album_name`| Release name (album, EP, single). *String*.
`album_uri`| Unique release identifer. *String*.
`track_name`| Track name. *String*.
`track_uri`| Unique track identifier. *String*.
`track_popularity`| Spotify-calculated metric based on track plays. *Numeric. Ranges from 0 to 100.*
`track_feature`| Secondary entity name(s) if track includes features. *String. Multiple entities are delimited by commas.*
`track_release_date`| Date of track upload to Spotify. *MM/DD/YYYY Date.*


# Data Collection
A form of snowball sampling was used to construct this dataset, with the [r/hiphopheads](https://www.reddit.com/r/hiphopheads/) "favorite artists" list as a starting point. Discography data was pulled for each artist on this list, with all unique featured artists identified. Discographies were then pulled for all featured artists, after data cleaning.

## API Usage
All data included here were gathered using the [`spotifyr`](https://github.com/charlie86/spotifyr) library in [R](https://www.r-project.org/). 