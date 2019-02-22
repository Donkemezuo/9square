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
    private static var collections = [CollectionsModel]()
    
    static public func fetchCollections() -> [CollectionsModel] {
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
    
    static public func save() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(collections)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    
    static public func add(newCollection: CollectionsModel) {
        if (collections.filter{ $0.collectionName == newCollection.collectionName }).isEmpty {
        collections.append(newCollection)
        save()
        }
    }
    
    static public func removeCollection(atIndex: Int) {
        collections.remove(at: atIndex)
        save()
    }
}
