//
//  CountryCellUpdateHelperFunctions.swift
//  assignment21
//
//  Created by nuca on 25.04.24.
//

import UIKit

extension CountryCell {
    
    func setTitleText(using country: Country) {
        if let name = country.name{
            if let common = name.common {
                titleLabel.text = common
            } else {
                titleLabel.text = "Unknown"
            }
        } else {
            titleLabel.text = "Unknown"
        }
    }
    
    func setFlagImage(using country: Country) {
        setTitleText(using: country)
        if let flags = country.flags{
            if let png = flags.png {
                ImageService.imageService.loadImageFromURL(png){ image in
                    if let image = image {
                        self.flagImage.image = image
                    } else {
                        self.flagImage.image = UIImage(named: "question mark")
                    }
                }
            } else {
                self.flagImage.image = UIImage(named: "question mark")
            }
            if let alt = flags.alt {
                flagImage.accessibilityLabel = alt
            } else {
                flagImage.accessibilityLabel = "info unavailable"
            }
        }
    }
}
