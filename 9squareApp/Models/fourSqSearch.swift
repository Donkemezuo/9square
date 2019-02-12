//
//  fourSqSearch.swift
//  9squareApp
//
//  Created by Genesis Mosquera on 2/12/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

// search model
// https://api.foursquare.com/v2/venues/search?client_id=CGSN0AWQJMTHFCUTCOVOMK4JSZHZN5VPM5RZDT3ATD5YYKRR&client_secret=4IHTGLLLEMYWB2YM3KKRZYKX1CITZEL4MYYGXURMJY3BCBKG&v=20180323&ll=40.7243,-74.0018&query=arepas

struct FourSquareModel: Codable {
    let response: String
    let venues: [VenueStruct]
}
struct VenueStruct: Codable {
    let id: String
    let name: String
    let contact: String?
    let location: LocationWrap
    let categories: [CategoryWrap]
}
struct LocationWrap: Codable {
    let address: String
    let crossStreet: String
    let lat: Double
    let lng: Double
    let labeledLatLngs: LLWrap
    let formattedAddress: [String]
}
struct LLWrap: Codable {
    let label: String
    let lat: Double
    let lng: Double
}

struct CategoryWrap: Codable {
    let id: String
    let name: String
    let pluralName: String
    let shortName: String
    let icon: IconWrap
}

struct IconWrap: Codable {
    let prefix: String
    let suffix: String
}
