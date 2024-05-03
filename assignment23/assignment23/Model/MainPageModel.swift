//
//  MainPageModel.swift
//  assignment23
//
//  Created by nuca on 03.05.24.
//

struct MainPageModel: Decodable {
    struct Data: Decodable {
        var fact: String
    }
    var data: [Data]
}
