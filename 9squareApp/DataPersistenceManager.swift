//
//  DataPersistence.swift
//  9squareApp
//
//  Created by Jane Zhu on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

final class DataPersistenceManager {
    static func documentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    static func filepathToDocumentsDirectory(filename: String) -> URL {
        return documentsDirectory().appendingPathComponent(filename)
    }
}
