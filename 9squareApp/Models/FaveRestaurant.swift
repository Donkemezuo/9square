//
//  FaveRestaurant.swift
//  9squareApp
//
//  Created by Genesis Mosquera on 2/15/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

struct FaveRestaurant: Codable {
    let collectionName: String
    let restaurantName: String
    let favoritedAt: String
    let imageData: Data?
    let description: String
    let venue: String
    
    public var date: Date {
        let date = favoritedAt.date()
        return date
    }
}
