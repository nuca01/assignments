//
//  Country.swift
//  assignment21
//
//  Created by nuca on 24.04.24.
//

struct Country: Decodable {
//    MARK: - Properties
    var name: Name?
    var flags: Flags?
    var independent: Bool?
    var region: String?
    var area: Double?
    var maps: Maps?
    var startOfWeek: String?
    
//     MARK: - Inner Structs
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
    struct Maps: Decodable{
        var googleMaps: String?
        var openStreetMaps: String?
        enum DecodingKeys: CodingKey {
            case googleMaps, openStreetMaps
        }
    }
//    MARK: - Decoding Keys
    enum DecodingKeys: CodingKey {
        case name, flags, independent, region, area, maps, startOfWeek
    }
}
