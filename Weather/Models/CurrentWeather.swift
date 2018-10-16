//
//  CurrentWeather.swift
//  Weather
//
//  Created by Toby Brown on 15/10/2018.
//  Copyright © 2018 TAB. All rights reserved.
//

struct CurrentWeather: Codable {
    let coord: Coord
    let weather: [WeatherType]
    let temperature: Temp

    enum CodingKeys: String, CodingKey {
        case coord
        case weather
        case temperature = "main"
    }
}
