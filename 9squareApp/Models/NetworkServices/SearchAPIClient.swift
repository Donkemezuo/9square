//
//  SearchAPIClient.swift
//  9squareApp
//
//  Created by Genesis Mosquera on 2/12/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation
final class SearchAPIClient {
    static func getVenue(latitude: String, longitude: String, category: String, completionHandler: @escaping(AppError?, [VenueStruct]?) -> Void) {


  

        let URL = "https://api.foursquare.com/v2/venues/search?client_id=\(SecretKeys.yazID3)&client_secret=\(SecretKeys.yazSecret3)&v=20180323&ll=\(latitude),\(longitude)&query=\(category)"


        NetworkHelper.shared.performDataTask(endpointURLString: URL, httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let error = appError {
                completionHandler(error, nil)
            }
            if let data = data {
                do {
                    let venueInfo = try
                        JSONDecoder().decode(FourSquareModel.self, from: data)
                    completionHandler(nil, venueInfo.response.venues)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
    

