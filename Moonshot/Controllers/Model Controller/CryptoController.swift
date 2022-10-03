//
//  CryptoController.swift
//  Moonshot
//
//  Created by Matheus Oliveira on 10/3/22.
//

import Foundation

class CryptoController {
    //MARK: - SOT
    static var cryptos: [Crypto] = []
    
    //MARK: - Properties
    private static let baseURLString: String? = "https://api.coingecko.com/"
    private static let keyCoinsComponent = "api/v3/coins"
    private static let keyListComponent = "/list"
    
    //MARK: - CRUD
    static func fetchCrypto(completion: @escaping (Bool) -> Void) {
        guard let baseURL = baseURLString else {return completion(false)}
        let coinsURL = baseURL + keyCoinsComponent
        let finalURL = coinsURL + keyListComponent
        print(finalURL)
    }
}
