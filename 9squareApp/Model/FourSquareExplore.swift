//
//  fourSquareExplore.swift
//  9squareApp
//
//  Created by Genesis Mosquera on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

// explore

// https://api.foursquare.com/v2/venues/explore?client_id=CGSN0AWQJMTHFCUTCOVOMK4JSZHZN5VPM5RZDT3ATD5YYKRR&client_secret=4IHTGLLLEMYWB2YM3KKRZYKX1CITZEL4MYYGXURMJY3BCBKG&v=20180323&ll=40.7243,-74.0018&query=arepas&limit=1

struct FourSquareExplore: Codable {
    let response: String
    let suggestedRadius: Int
    let headerLocation: String
    let headerFullLocation: String
    let query: String
    let totalResults: Int
    let groups: [GroupWrap]
}
struct GroupWrap: Codable {
    let venue: VenueWrap
}
struct VenueWrap: Codable {
    let id: String
    let name: String
    let location: LocationWrapper
}
struct LocationWrapper: Codable {
    let lat: Double
    let lng: Double
    let formattedAddress: [String]
    let categories: [CategoryWrapper]
    let delivery: DeliveryWrap
}

struct CategoryWrapper: Codable {
    let id: String
    let name: String
    let pluralName: String
    let shortName: String
    let icon: IconsWrap
}

struct IconsWrap: Codable {
    let prefix: String
    let suffix: String
}

struct DeliveryWrap: Codable {
    let id: String
    let url: String
    let provider: ProviderWrap
}
struct ProviderWrap: Codable {
    let name: String
    let icon: IconDetails
}

struct IconDetails: Codable {
    let prefix: String
    let sizes: [Int]
    let name: String
}
