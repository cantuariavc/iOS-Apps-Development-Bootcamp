//
//  CoinAPI.swift
//  ByteCoin
//
//  Created by Vinícius Cantuária on 03/09/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinAPI: Decodable {
    let asset_id_quote: String
    let rate: Double
}
