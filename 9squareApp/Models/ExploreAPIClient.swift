//
//  ExploreAPIClient.swift
//  9squareApp
//
//  Created by Genesis Mosquera on 2/12/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

final class ExploreAPIClient {
    static func exploreVenue(foodItem: String, completionHandler: @escaping (AppError?, [GroupWrap]?) -> Void) {
        let URL = "https://api.foursquare.com/v2/venues/explore?client_id=CGSN0AWQJMTHFCUTCOVOMK4JSZHZN5VPM5RZDT3ATD5YYKRR&client_secret=4IHTGLLLEMYWB2YM3KKRZYKX1CITZEL4MYYGXURMJY3BCBKG&v=20180323&ll=40.7243,-74.0018&query=\(foodItem)&limit=1"
        NetworkHelper.shared.performDataTask(endpointURLString: URL, httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let error = appError {
                completionHandler(error, nil)
            }
            if let data = data {
                do {
                    let exploreInfo = try
                        JSONDecoder().decode(FourSquareExplore.self, from: data)
                    completionHandler(nil, exploreInfo.groups)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                    
                }
            }
        }
    }
}
