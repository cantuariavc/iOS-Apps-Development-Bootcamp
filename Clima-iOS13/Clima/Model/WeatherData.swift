//
//  WeatherData.swift
//  Clima
//
//  Created by Vinícius Cantuária on 22/08/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherAPI: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Weather: Decodable {
    let id: Int
}

struct Main: Decodable {
    let temp: Float
}
