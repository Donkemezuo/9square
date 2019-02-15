//
//  DataPersistenceManager.swift
//  9squareApp
//
//  Created by Genesis Mosquera on 2/15/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

final class DataPersistenceManager {
    private init() {}
    
    static func documentsDirectory() -> URL  {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    
    static func filepathToDocumentsDirectory(filename: String) -> URL {
        return documentsDirectory().appendingPathComponent(filename)
    }
}
