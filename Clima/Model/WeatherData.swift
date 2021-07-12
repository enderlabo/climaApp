//
//  WeatherData.swift
//  Clima
//
//  Created by Laborit on 18/06/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable{
    let weather: [Weather]
    let main: Main
    let name: String
}
//any object from api, are an struct of modelData.
struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
