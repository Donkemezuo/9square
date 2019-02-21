//
//  CollectionsDataManager.swift
//  9squareApp
//
//  Created by Jane Zhu on 2/21/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

final class CollectionsDataManager {
    private init() {}
    
    private static let filename = "Collections.plist"
    
    static public func fetchCollections() -> [CollectionsModel] {
        var collections = [CollectionsModel]()
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    collections = try PropertyListDecoder().decode([CollectionsModel].self, from: data)
                } catch {
                    print("collectionsData property list decoding error: \(error)")
                }
            } else {
                print("collectionsData data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        return collections
    }
    
    static public func save(newCollection: CollectionsModel) {
        var collections = fetchCollections()
        collections.append(newCollection)
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(collections)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
        
//        for collection in collections {
//            if collection.collectionName == newCollection.collectionName {
//                print("\(newCollection.collectionName) already exists")
//            } else {
//                collections.append(newCollection)
//                print("added to collections")
//                let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
//                do {
//                    let data = try PropertyListEncoder().encode(collections)
//                    try data.write(to: path, options: Data.WritingOptions.atomic)
//                    print("successfully added to collectionsData")
//                } catch {
//                    print("collectionsData property list encoding error: \(error)")
//                }
//            }
//        }
    }
    
    //TODO delete
    
    
}
