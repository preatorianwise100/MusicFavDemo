//
//  Music.swift
//  MusicFav
//
//  Created by Jose David Bustos H on 11/8/19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import Foundation

struct Music: Codable {
    let resultCount: Int
    let results: [Result]
}
struct Result : Codable{
    
    var wrapperType : String?
    var kind : String?
    var artistId : Int?
    var collectionId : Int?
    var trackId  : Int?
    var artistName : String?
    var collectionName : String?
    var trackName : String?
    var collectionCensoredName : String?
    var trackCensoredName : String?
    var artistViewUrl : String?
    var collectionViewUrl : String?
    var trackViewUrl : String?
    var previewUrl : String?
    var artworkUrl30 : String?
    var artworkUrl60 : String?
    var artworkUrl100 : String?
    var collectionPrice : Double?
    var trackPrice : Double?
    var collectionHdPrice : Double?
    var trackHdPrice : Double?
    var releaseDate : String?
    var collectionExplicitness : String?
    var trackExplicitness : String?
    var discCount : Int?
    var discNumber : Int?
    var trackCount : Int?
    var trackNumber : Int?
    var trackTimeMillis : Int?
    var country : String?
    var currency : String?
    var primaryGenreName : String?
    var contentAdvisoryRating : String?
    var shortDescription : String?
    var longDescription : String?
}
