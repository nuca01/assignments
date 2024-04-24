//
//  DetailsPageViewModelDelegateExtension.swift
//  assignment21
//
//  Created by nuca on 24.04.24.
//

extension DetailsPageViewController: DetailsPageViewModelDelegate {
    func getOfficialName() -> String {
        detailsPageViewModel!.getOfficialName()
    }
    func getCommonName() -> String {
        detailsPageViewModel!.getCommonName()
    }
    func getFlagsAlt() -> String {
        detailsPageViewModel!.getFlagsAlt()
    }
    func getIndependance() -> String {
        detailsPageViewModel!.getIndependance()
    }
    func getRegion() -> String {
        detailsPageViewModel!.getRegion()
    }
    func getArea() -> String {
        detailsPageViewModel!.getArea()
    }
    func getMapsGoogleMaps() -> String {
        detailsPageViewModel!.getMapsGoogleMaps()
    }
    func getMapsOpenStreetMaps() -> String{
        detailsPageViewModel!.getMapsOpenStreetMaps()
    }
    func getStartOfWeek() -> String {
        detailsPageViewModel!.getStartOfWeek()
    }
}
