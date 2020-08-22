#' spotifyr::search_spotify() wrapper
#'
#' @param artists A string vector of artist names to search
#' @param authorization Spotify API token as required by `spotifyr`
#'
#' @return A dataframe of each artist name and Spotify uri
#' @export
#'
#' @examples
query_artists_flat <- function(artists, authorization = get_spotify_access_token()){
  if (!is.character(artists)){
    stop("'artists' must be a character vector of artist names", call. = TRUE)
  }
  artist_list <- list()
  for (i in 1:length(artists)){
    temp <- try(search_spotify(artists[[i]], type = "artist", limit = 1))
    if(inherits(temp, "try-error")){
      next
    }
    Sys.sleep(0.25)
    temp$genres[[1]] <- str_c(temp$genres[[1]], collapse = ", ")
    artist_list[[i]] <- temp
  }
  artists_df <- do.call(rbind, artist_list)
  return(artists_df)
}

#' spotifyr::get_artist_albums() wrapper
#'
#' @param artist_uris A string vector of artist uri identifiers to query
#' @param authorization Spotify API token as required by `spotifyr`
#'
#' @return A dataframe of albums for each artist
#' @export
#'
#' @examples
query_albums_flat <- function(artist_uris, authorization = get_spotify_access_token()){
  if (!is.character(artist_uris)){
    stop("'artist_uris' must be a character vector of artist Spotify uri identifiers", call. = TRUE)
  }
  album_list <- list()
  for(i in 1:length(artist_uris)){
    temp <- try(get_artist_albums(artist_uris[[i]], 
                                  include_groups = c("album", "single"), 
                                  market = "US"))
    if(inherits(temp, "try-error")){
      next
    }
    Sys.sleep(0.25) # Pause to avoid breaking the API calls
    temp$artist <- NA
    
    if (!is.null(nrow(temp))){
      for (j in 1:nrow(temp)){
        temp$artist[[j]] <- str_c(temp[j,3][[1]][["name"]], collapse = ", ")
      }
      album_list[[i]] <- temp
    } else {
      next
    }
  }
  albums_df <- do.call(rbind, album_list)
  return(albums_df)
}

#' spotifyr::get_album_tracks and spotifyr::get_track wrapper
#'
#' @param album_uris A string vector of album uri identifiers to query
#' @param albu,_names A string vector of album names associated with each album uri
#' @param authorization Spotify API token as required by `spotifyr`
#'
#' @return
#' @export
#'
#' @examples
query_tracks_flat <- function(album_uris, album_names, authorization = get_spotify_access_token()){
  if (!is.character(album_uris)){
    stop("'album_uris' must be a character vector of album Spotify uri identifiers", call. = TRUE)
  }
  if (!is.character(album_names)){
    stop("'album_names' must be a character vector of album names associated with 'album_uris'", call. = TRUE)
  }
  if (length(album_uris) != length(album_names)){
    stop("'album_names' and 'album_uris' must be character vectors of the same length'", call. = TRUE)
  }
  tracklists_list <- list()
  for (i in 1:length(album_uris)){
    df_temp <- try(get_album_tracks(album_uris[[i]]))
    if(inherits(df_temp, "try-error")){
      next
    }
    Sys.sleep(0.25) # Pause to avoid breaking the API calls
    df_temp$track_artists <- NA
    df_temp$album_name <- NA
    df_temp$track_popularity <- NA
    for (j in 1:nrow(df_temp)){
      df_temp$album_name <- album_names[[i]]
      list_temp <- get_track(df_temp$id[[j]])
      Sys.sleep(0.25)
      df_temp$track_popularity[[j]] <- list_temp[["popularity"]]
      df_temp$track_artists[[j]] <- str_c(list_temp[["artists"]][["name"]], collapse = ", ")
    }
    tracklists_list[[i]] <- df_temp
  }
  tracklists_df <- do.call(rbind, tracklists_list)
  return(tracklists_df)
}





