//
//  DetailsPageViewModel.swift
//  assignment21
//
//  Created by nuca on 24.04.24.
//
protocol DetailsPageViewModelDelegate {
    func getOfficialName() -> String
    func getCommonName() -> String
    func getFlagsAlt() -> String
    func getIndependance() -> String
    func getRegion() -> String
    func getArea() -> String
    func getMapsGoogleMaps() -> String
    func getMapsOpenStreetMaps() -> String
    func getStartOfWeek() -> String
}

class DetailsPageViewModel {
    var country: Country?
    
    func getOfficialName() -> String {
        country?.name?.official ?? "unavailable"
    }
    func getCommonName() -> String {
        country?.name?.common ?? "unavailable"
    }
    func getFlagsAlt() -> String {
        country?.flags?.alt ?? "unavailable"
    }
    func getIndependance() -> String {
        country?.independent?.description ?? "unavailable"
    }
    func getRegion() -> String {
        country?.region ?? "unavailable"
    }
    func getArea() -> String {
        if let area = country?.area {
            return String(area)
        } else {
            return "unavailable"
        }
    }
    func getMapsGoogleMaps() -> String {
        country?.maps?.googleMaps ?? "https://lh6.googleusercontent.com/Bu-pRqU_tWZV7O3rJ5nV1P6NjqFnnAs8kVLC5VGz_Kf7ws0nDUXoGTc7pP87tyUCfu8VyXi0YviIm7CxAISDr2lJSwWwXQxxz98qxVfMcKTJfLPqbcfhn-QEeOowjrlwX1LYDFJN"
    }
    func getMapsOpenStreetMaps() -> String {
        country?.maps?.openStreetMaps ?? "https://lh6.googleusercontent.com/Bu-pRqU_tWZV7O3rJ5nV1P6NjqFnnAs8kVLC5VGz_Kf7ws0nDUXoGTc7pP87tyUCfu8VyXi0YviIm7CxAISDr2lJSwWwXQxxz98qxVfMcKTJfLPqbcfhn-QEeOowjrlwX1LYDFJN"
    }
    func getStartOfWeek() -> String {
        country?.startOfWeek ?? "unavailable"
    }
    
}
