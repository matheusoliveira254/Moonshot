//
//  CryptoController.swift
//  Moonshot
//
//  Created by Matheus Oliveira on 10/3/22.
//

import Foundation

class CoinController {
    //MARK: - SOT
    static var coins: [Coin] = []
    
    //MARK: - Properties
    private static let baseURLString = "https://api.coingecko.com/"
    private static let keyCoinsComponent = "api/v3/coins"
    private static let keyListComponent = "/list"
    
    //MARK: - CRUD
    static func fetchCrypto(completion: @escaping (Bool) -> Void) {
        guard let baseURL = URL(string: baseURLString) else {return completion(false)}
        let coinsURL = baseURL.appendingPathComponent(keyCoinsComponent)
        let finalURL = coinsURL.appendingPathComponent(keyListComponent)
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { coinData, _, error in
            if let error = error {
                print("There was an error \(error.localizedDescription)")
                completion(false)
            }
            
            guard let data = coinData else {completion(false); return}
            
            do {
                if let topLevelArrayOfCoinDictionaries = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.fragmentsAllowed) as? [[String: String]] {
                    for coinDictionary in topLevelArrayOfCoinDictionaries {
                        if let id = coinDictionary["id"], let symbol = coinDictionary["symbol"], let name = coinDictionary["name"] {
                            let parcedCoin = Coin(id: id, name: name, symbol: symbol)
                            coins.append(parcedCoin)
                        }
                    }
                    completion(true)
                }
            } catch {
                print("Error in Do/Try/Catch \(error.localizedDescription)")
                completion(false)
            }
        }.resume()
    }
}

