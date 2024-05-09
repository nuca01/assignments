//
//  PhotoModel.swift
//  assignment24
//
//  Created by Nuca on 09.05.24.
//

import Foundation

struct PhotoModel: Decodable, Hashable {
    struct URLS: Decodable, Hashable {
        var regular: String
    }
    var width: Int
    var height: Int
    var urls: URLS
}
