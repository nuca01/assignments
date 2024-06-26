//
//  MainViewModel.swift
//  assignment25
//
//  Created by Nuca on 11.05.24.
//

import Foundation

//protocol MainViewModelDelegate {
//}

protocol SongDelegate {
    var title: String {get}
    var artist: String {get}
    var length: Double {get}
    var playedTime: Double {get set}
    var cover: String {get}
}

final class MainViewModel {
    
    //MARK: - Properties
    private var song: SongDelegate
    
    //MARK: - Initialisers
    init(song: SongDelegate) {
        self.song = song
    }
}

//MARK: -MainViewDelegate
extension MainViewModel: MainViewDelegate {
    
    //MARK: - Methods
    func getSongTitle() -> String {
        song.title
    }
    
    func getSongArtist() -> String {
        song.artist
    }
    
    func getSongLength() -> Double {
        song.length
    }
    
    func getSongCoverImageName() -> String {
        song.cover
    }
    
    func getSongPlayedTime() -> Double {
        song.playedTime
    }
    
    func setSongPlayedTime(with time: Double) {
        song.playedTime = time
    }
}
