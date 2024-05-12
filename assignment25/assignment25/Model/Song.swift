//
//  Song.swift
//  assignment25
//
//  Created by Nuca on 11.05.24.
//

import Foundation

final class Song: SongDelegate {
    var title: String
    var artist: String
    var length: Double
    var playedTime: Double {
        didSet {
            checkIfPlayedTimeIsValid()
        }
    }
    var cover: String
    
    init(title: String, artist: String, length: Double, playedTime: Double, cover: String) {
        self.title = title
        self.artist = artist
        self.length = length
        self.playedTime = playedTime
        self.cover = cover
    }
    
    private func checkIfPlayedTimeIsValid() {
        if playedTime > length || playedTime < 0 {
            playedTime = 0
        }
    }
}
