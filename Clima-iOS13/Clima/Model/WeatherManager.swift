//
//  WeatherManager.swift
//  Clima
//
//  Created by Vinícius Cantuária on 22/08/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManageDelegate {
    func didWeatherUpdated(_ weatherManage: WeatherManager, _ weather: WeatherModel)
    func didWeatherUpdateError(_ error: Error)
}


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=2f0ddcfac16517f680836b4da2a8d8bd&units=metric"
    
    var delegate: WeatherManageDelegate?
    
    func fetchWeather(_ cityName: String) {
        performRequest("\(weatherURL)&q=\(cityName)")
    }
    
    func fetchWeather(_ lat: CLLocationDegrees, _ lon: CLLocationDegrees) {
        performRequest("\(weatherURL)&lat=\(lat)&lon=\(lon)")
    }
    
    func performRequest(_ urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                } else if data != nil {
                    self.parseJSON(data!)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherAPI.self, from: data)
            let conditionId = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let city = decodedData.name
            
            let weather = WeatherModel(conditionId: conditionId, temperature: temp, cityName: city)
            
            self.delegate?.didWeatherUpdated(self, weather)
            
        } catch {
            self.delegate?.didWeatherUpdateError(error)
        }
    }
}
