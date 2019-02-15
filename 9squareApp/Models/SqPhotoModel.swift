//
//  SqPhotoModel.swift
//  9squareApp
//
//  Created by Genesis Mosquera on 2/15/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

struct SqPhotoModel: Codable {
    let response: ResponseWrapper
}

struct ResponseWrapper: Codable {
    let photos: PhotoWrap
}

struct PhotoWrap: Codable {
    let items: [ItemWrapper]
}

struct ItemWrapper: Codable {
    let prefix: String
    let suffix: String
}
