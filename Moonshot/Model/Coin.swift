//
//  Crypto.swift
//  Moonshot
//
//  Created by Matheus Oliveira on 10/3/22.
//

import Foundation

class Coin: Codable {
    let id: String
    let name: String
    let symbol: String
    
    init(id: String, name: String, symbol: String) {
        self.id = id
        self.name = name
        self.symbol = symbol
    }
}
