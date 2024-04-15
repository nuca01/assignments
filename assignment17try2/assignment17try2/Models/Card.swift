//
//  Card.swift
//  assignment17try2
//
//  Created by nuca on 14.04.24.
//

import Foundation

class Card {
//MARK: - Properties
    var icon: String?
    var title: String?
    var description: String?
    
//MARK: - Initilizers
    init(icon: String? = nil, title: String? = nil, description: String? = nil) {
        self.icon = icon
        self.title = title
        self.description = description
    }
}
