//
//  Country.swift
//  assignment20
//
//  Created by nuca on 22.04.24.
//
struct Name: Decodable {
    var official: String?
    var common: String?
    enum DecodingKeys: CodingKey {
        case official, common
    }
}
struct Flags: Decodable {
    var png: String?
    var alt: String?
    enum DecodingKeys: CodingKey {
        case png, alt
    }
}
struct Country: Decodable {
    var name: Name?
    var flags: Flags?
    
    enum DecodingKeys: CodingKey {
        case name, flags
    }
}

