//
//  RestaurantDataManager.swift
//  9squareApp
//
//  Created by Genesis Mosquera on 2/15/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

final class RestaurantDataManager {
    private init() {}
    
    static private var favoriteRestaurants = [FaveRestaurant]()
    
    static public func fetchFavoriteFromDocumentsDirectory(collection: String) -> [FaveRestaurant] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: "\(collection).plist").path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    favoriteRestaurants = try PropertyListDecoder().decode([FaveRestaurant].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("data is nil")
                
            }
        } else {
            print("filename \(collection) does not exist")
        }
        return favoriteRestaurants
    }

    static public func save(collection: String) {
        favoriteRestaurants = fetchFavoriteFromDocumentsDirectory(collection: collection)
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: collection)
        do {
            let data = try PropertyListEncoder().encode(favoriteRestaurants)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    
    static public func addRestaurant(newFavoriteRestaurant: FaveRestaurant, collection: String) {
        favoriteRestaurants.append(newFavoriteRestaurant)
        save(collection: collection)
    }
    
    
//    static func delete(favoriteRestaurant: FaveRestaurant, atIndex index: Int, collection: String) {
//        var favoriteRestaurants = fetchFavoriteFromDocumentsDirectory(collection: collection)
//        favoriteRestaurants.remove(at: index)
//        
//        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: collection)
//        do {
//            let data = try PropertyListEncoder().encode(favoriteRestaurants)
//            try data.write(to: path, options: Data.WritingOptions.atomic)
//        } catch {
//            print("property list encoding error: \(error)")
//        }
//    }
}
