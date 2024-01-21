//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Marcos Barbosa on 22/11/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not locate \(file) !!")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not convert \(file) into data")
        }
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from Bundle.")
        }
        return loaded
    }
    
}
