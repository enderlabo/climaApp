//
//  WeatherManager.swift
//  Clima
//
//  Created by Laborit on 17/06/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    //API url to used.
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=944eb8cec2373250c44ab46207400d47&units=metric"
    
    func fetchWeather(cityName: String ){
        let URLString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: URLString)
    }
    
    func fetchWeatherLatLon(latitude: CLLocationDegrees , longitude: CLLocationDegrees){
        let URLString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: URLString)
    }
    //apply delegate y/o computed
    var delegate: WeatherManagerDelegate?
    
    func performRequest(with urlString: String){
        //1. create a url, url always be no optional.
        if let url = URL(string: urlString){
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. give the session a task with closure.
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                //get data from API
                if let safeData = data {
                  let weather = self.parseJSON(safeData)
                    self.delegate?.didUpdateWeather(  weatherManager: self, weather: weather!)
                }
            }
            //4. Start the task.
            task.resume()
        }
        
    }
    //Convert data from JSON, become optional if can't get data from API
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
           let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            let name = decodeData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}
