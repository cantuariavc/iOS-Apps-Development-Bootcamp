//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didCoinPriceUpdate(_ coinManager: CoinManager, _ coin: Coin)
    func didCoinPriceUpdateError(_ error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "C4F174B0-E302-44A1-B7CA-62FAA6EB6AAC"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        performRequest("\(baseURL)/\(currency)?apikey=\(apiKey)")

    }

    func performRequest(_ urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    self.delegate?.didCoinPriceUpdateError(error)
                } else if let data = data {
                    self.parseJSON(data)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinAPI.self, from: data)
            let coin = Coin(quote: decodedData.asset_id_quote, rate: String(format: "%.1f", decodedData.rate))
            self.delegate?.didCoinPriceUpdate(self, coin)
        } catch {
            self.delegate?.didCoinPriceUpdateError(error)
        }
    }
    
}
