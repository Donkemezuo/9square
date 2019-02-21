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
    
    //private static let filename = "FavoriteRestaurant.plist"
    
    static public func fetchFavoriteFromDocumentsDirectory(collection: String) -> [FaveRestaurant] {
        var restaurants = [FaveRestaurant]()
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: collection).path
        
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    restaurants = try PropertyListDecoder().decode([FaveRestaurant].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("data is nil")
                
            }
        } else {
            print("filename \(collection) does not exist")
        }
        return restaurants
    }

    static public func saveToDocumentDirectory(newFavoriteRestaurant: FaveRestaurant, collection: String) -> (success: Bool, error: Error?) {
        var favoriteRestaurants = fetchFavoriteFromDocumentsDirectory(collection: collection)
        favoriteRestaurants.append(newFavoriteRestaurant)
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: collection)
        do {
            let data = try PropertyListEncoder().encode(favoriteRestaurants)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
            return (false, error)
        }
        return (true, nil)
    }
    static func delete(favoriteRestaurant: FaveRestaurant, atIndex index: Int, collection: String) {
        var favoriteRestaurants = fetchFavoriteFromDocumentsDirectory(collection: collection)
        favoriteRestaurants.remove(at: index)
        
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: collection)
        do {
            let data = try PropertyListEncoder().encode(favoriteRestaurants)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
}
