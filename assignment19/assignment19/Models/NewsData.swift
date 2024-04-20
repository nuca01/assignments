//
//  NewsResponseData.swift
//  assignment19
//
//  Created by nuca on 19.04.24.
//

import UIKit
struct News: Decodable {
    var title: String
    var time: String
    var url: String
    var type: Int
    var photoUrl: String
    var photoAlt: String
}

struct NewsData: Decodable {
    var list: [News]
}

struct NewsResponseData: Decodable {
    var success: Bool
    var data: NewsData
}
