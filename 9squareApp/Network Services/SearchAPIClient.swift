//
//  searchAPIClient.swift
//  9squareApp
//
//  Created by Genesis Mosquera on 2/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

final class SearchAPIClient {
    static func getVenue(completionHandler: @escaping(AppError?, [VenueStruct]?) -> Void) {
        let URL = "https://api.foursquare.com/v2/venues/search?client_id=CGSN0AWQJMTHFCUTCOVOMK4JSZHZN5VPM5RZDT3ATD5YYKRR&client_secret=4IHTGLLLEMYWB2YM3KKRZYKX1CITZEL4MYYGXURMJY3BCBKG&v=20180323&ll=40.7243,-74.0018&query=arepas"
        NetworkHelper.shared.performDataTask(endpointURLString: URL, httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let error = appError {
                completionHandler(error, nil)
            }
            if let data = data {
                do {
                    let venueInfo = try
                    JSONDecoder().decode(FourSquareModel.self, from: data)
                    completionHandler(nil, venueInfo.venues)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
