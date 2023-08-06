//
//  WeatherManager.swift
//  Clima-Angela
//
//  Created by Павел Грицков on 22.02.23.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, wetherModel: WeatherModel)
    func didUpdateIcon(_ weatherManager: WeatherManager, iconData: Data)
    func didFailwithError(_ error: Error)
}

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    private let weatherURL =
    "https://api.openweathermap.org/data/2.5/weather?appid=\(Keys.openWeather)&units=metric"
    private let iconURL = "https://openweathermap.org/img/wn/"
    
    func fetchWeather(_ cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString) { data in
            parseJSON(data)
        }
    }
    
    func fetchWeather(_ latitude: Double,_ longitude: Double) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString) { data in
            parseJSON(data)
        }
    }
    
    func fetchIcon(_ iconName: String) {
        let urlString = "\(iconURL)\(iconName)@2x.png"
        
        let url = URL(string: urlString)!
        do {
            let dataImage = try Data(contentsOf: url)
            delegate?.didUpdateIcon(self, iconData: dataImage)
        } catch {
            print("не удалось загрузить картинку")
        }
        
//        performRequest(with: urlString) { data in
//            delegate?.didUpdateIcon(self, iconData: data)
//        }
    }
    
    private func performRequest(with urlString: String, complition: @escaping (Data) -> Void) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error {
                    delegate?.didFailwithError(error)
                    return
                }
                if let safeData = data {
                    complition(safeData)
                }
            }
            task.resume()
        } else {
            print("Failed URL!")
        }
    }
    
    private func parseJSON(_ safeData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: safeData)
            
            let name = decodeData.name
            let temp = decodeData.main.temp
            let icon = decodeData.weather[0].icon
            
            let weather = WeatherModel(cityName: name, temperature: temp)
            delegate?.didUpdateWeather(self, wetherModel: weather)
            
            // fetch icon data
            fetchIcon(icon)

        } catch {
            delegate?.didFailwithError(error)
        }
    }
}
