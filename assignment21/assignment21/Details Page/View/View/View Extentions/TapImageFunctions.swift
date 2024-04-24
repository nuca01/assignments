//
//  TapImageFunctions.swift
//  assignment21
//
//  Created by nuca on 25.04.24.
//

import UIKit

extension DetailsPageView {
    
    @objc func firstImageTapped() {
        guard let url = URL(string: delegate!.getMapsOpenStreetMaps()) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc func secondImageTapped() {
        guard let url = URL(string: delegate!.getMapsGoogleMaps()) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
