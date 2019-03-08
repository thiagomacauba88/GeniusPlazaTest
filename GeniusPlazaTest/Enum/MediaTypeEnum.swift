//
//  ProductEnumReference.swift
//  Beneficio
//
//  Created by TechMaxi on 04/03/19.
//  Copyright © 2019 ValeCard. All rights reserved.
//

import UIKit

class MediaTypeEnum {

    enum MediaTypeDescription: String {
        case appleMusic =  "Apple Music"
        case itunesMusic =  "iTunes Music"
        case iosApps =  "iOS Apps"
        case macApps =  "Mac Apps"
        case audioBooks = "Audiobooks"
        case books = "Books"
        case tvShows = "TV Shows"
        case movies = "Movies"
        case itunesU = "iTunes U"
        case podcasts = "Podcasts"
        case musicVideos = "Music Videos"
    }
    
    func mediaTypeUrl(for mediaTypeDescription: String) -> String {
        switch mediaTypeDescription {
        case MediaTypeEnum.MediaTypeDescription.appleMusic.rawValue:
            return "apple-music/coming-soon"
        case MediaTypeEnum.MediaTypeDescription.itunesMusic.rawValue:
            return "itunes-music/hot-tracks"
        case MediaTypeEnum.MediaTypeDescription.iosApps.rawValue:
            return "ios-apps/new-apps-we-love"
        case MediaTypeEnum.MediaTypeDescription.macApps.rawValue:
            return "macos-apps/top-free-mac-apps"
        case MediaTypeEnum.MediaTypeDescription.audioBooks.rawValue:
            return "audiobooks/top-audiobooks"
        case MediaTypeEnum.MediaTypeDescription.books.rawValue:
            return "books/top-free"
        case MediaTypeEnum.MediaTypeDescription.tvShows.rawValue:
            return "tv-shows/top-tv-episodes"
        case MediaTypeEnum.MediaTypeDescription.movies.rawValue:
            return "movies/top-movies"
        case MediaTypeEnum.MediaTypeDescription.itunesU.rawValue:
            return "itunes-u/top-itunes-u-courses"
        case MediaTypeEnum.MediaTypeDescription.podcasts.rawValue:
            return "podcasts/top-podcasts"
        case MediaTypeEnum.MediaTypeDescription.musicVideos.rawValue:
            return "music-videos/top-music-videos"
        default:
            return ""
        }
    }
}
