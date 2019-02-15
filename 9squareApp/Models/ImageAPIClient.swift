//
//  ImageAPIClient.swift
//  9squareApp
//
//  Created by Jane Zhu on 2/15/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

final class ImageAPIClient {
    static func getImages(venueID: String, completionHandler: @escaping ((AppError?, String?) -> Void)) {
        //TODO: interpolate current date
        let URL = "https://api.foursquare.com/v2/venues/\(venueID)/photos?client_id=\(SecretKeys.raymondID)&client_secret=\(SecretKeys.raymondSecret)&v=20190215"
        NetworkHelper.shared.performDataTask(endpointURLString: URL, httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let error = appError {
                completionHandler(error, nil)
            }
            if let data = data {
                do {
                    let imageLinkData = try JSONDecoder().decode(SqPhotoModel.self, from: data)
                    if let safeImage = imageLinkData.response.photos.items.first {
                    let imageLink = safeImage.prefix + "300x500" + safeImage.suffix
                        completionHandler(nil, imageLink)
                    }
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
