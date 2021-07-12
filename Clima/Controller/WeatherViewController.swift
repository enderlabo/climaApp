//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    //called and init my struct here.
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //first initialice and then used.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
     
        //Validate any word inside textField.
        searchTextField.delegate = self
        //delegate property is not nil
        weatherManager.delegate = self
    }
    @IBAction func getLocation(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}
//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchBtn(_ sender: UIButton) {
        //when the user press keyword go or press the button search, the keyboard is hide.
        searchTextField.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
//    when the user end to write and pressed keyword Go, the placeHOlder going to chances to Search Your City.
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        } else {
            textField.placeholder = "Search Your City"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //use searchTextField.text to get the weather for that city.
        if  let city = searchTextField.text{
            weatherManager.fetchWeather(cityName: city)
        }
        //when the search is done, the state going to back to an empty string.
        searchTextField.text = ""
    }
}
//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
   
    func didUpdateWeather( weatherManager: WeatherManager, weather: WeatherModel){
        //show data from api and show in UI.
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate{
    
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
    //        stop locationRequest so, just call one time and then re-called when user press the button
            locationManager.stopUpdatingLocation()
                let lat = location.coordinate.latitude
                let lon = location.coordinate.longitude
            weatherManager.fetchWeatherLatLon(latitude: lat, longitude: lon)
            }
        }
        
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
