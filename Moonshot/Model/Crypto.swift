//
//  Crypto.swift
//  Moonshot
//
//  Created by Matheus Oliveira on 10/3/22.
//

import Foundation

class Crypto: Codable {
    let id: UUID
    let name: String
    let symbol: String
    
    init(id: UUID, name: String, symbol: String) {
        self.id = id
        self.name = name
        self.symbol = symbol
    }
}
