//
//  WeatherController.swift
//  Clima-Angela
//
//  Created by Павел Грицков on 21.02.23.
//

import UIKit
import CoreLocation

class WeatherController: UIViewController {
    
    let weatherView = WeatherView()
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        view = weatherView
        weatherManager.delegate = self
        weatherView.searchTextField.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weatherView.searchButton.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        weatherView.locationButton.addTarget(self, action: #selector(locationPressed), for: .touchUpInside)
        
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        print("viewWillLayoutSubviews")
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        print("viewDidLayoutSubviews")
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning")
    }
    
    deinit {
        print("deinit")
    }
    
    @objc func locationPressed() {
        locationManager.requestLocation()
    }
}

extension WeatherController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            // останавливает как только местоположение получено
            locationManager.stopUpdatingLocation()
            let lat = lastLocation.coordinate.latitude
            let lon = lastLocation.coordinate.longitude
            weatherManager.fetchWeather(lat, lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

// MARK: - WeatherManagerDelegate

extension WeatherController: WeatherManagerDelegate {
    func didUpdateIcon(_ weatherManager: WeatherManager, iconData: Data) {
        DispatchQueue.main.async {
            let image = UIImage(data: iconData)
            self.weatherView.weatherImageView.image = image
        }
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, wetherModel: WeatherModel) {
        DispatchQueue.main.async {
            self.weatherView.cityNameLabel.text = wetherModel.cityName
            self.weatherView.tempLabel.text = wetherModel.temperatureString
        }
    }
    
    func didFailwithError(_ error: Error) {
        print(error)
    }
}

// MARK: - UITextFieldDelegate

extension WeatherController: UITextFieldDelegate {
    
    @objc func searchPressed() {
        weatherView.searchTextField.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let cityName = textField.text {
            weatherManager.fetchWeather(cityName)
        }
        
        textField.text = ""
        textField.placeholder = "Search"
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "enter name city"
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
