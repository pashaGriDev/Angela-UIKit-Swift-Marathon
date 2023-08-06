//
//  WeatherModel.swift
//  Clima-Angela
//
//  Created by Павел Грицков on 22.02.23.
//

import Foundation

struct WeatherModel {
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
}
