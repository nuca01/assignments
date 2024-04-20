//
//  NewsData.swift
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
    
    //camel case-ზე გადაყვანა
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case time = "Time"
        case url = "Url"
        case type = "Type"
        case photoUrl = "PhotoUrl"
        case photoAlt = "PhotoAlt"
    }
}

struct NewsData: Decodable {
    var list: [News]

    //camel case-ზე გადაყვანა
    enum CodingKeys: String, CodingKey {
        case list = "List"
    }
}
