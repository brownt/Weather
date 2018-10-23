//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Toby Brown on 23/10/2018.
//  Copyright © 2018 TAB. All rights reserved.
//

import Foundation

struct WeatherViewModel {

    let currentWeather: CurrentWeather
    private(set) var placeString = ""
    private(set) var lastUpdatedString = ""
    private(set) var weatherTypeString = ""
    private(set) var temperatureString = ""

    init(currentWeather: CurrentWeather) {
        self.currentWeather = currentWeather
        updateProperties()
    }

    private mutating func updateProperties() {
        placeString = setPlaceString(currentWeather: currentWeather)
        weatherTypeString = setWeatherTypeString(currentWeather: currentWeather)
        temperatureString = setTemperatureString(currentWeather: currentWeather)
        lastUpdatedString = setLastUpdatedString(currentWeather: currentWeather)
    }
}

extension WeatherViewModel {

    private func setPlaceString(currentWeather: CurrentWeather) -> String {
        return "Location: \(currentWeather.name)"
    }

    private func setTemperatureString(currentWeather: CurrentWeather) -> String {
        return "Current temp: \(temperatureToString(temp: currentWeather.temperature.tempNow))°C"
    }

    private func setWeatherTypeString(currentWeather: CurrentWeather) -> String {
        return "Current weather: \(currentWeather.weather[0].main)"
    }

    private func setLastUpdatedString(currentWeather: CurrentWeather) -> String {
        return "Last updated: \(formatDateTime(interval: currentWeather.lastUpdate))"
    }

    private func formatDateTime(interval: Double) -> String {
        let date = Date(timeIntervalSince1970: interval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, hh:mm"
        return dateFormatter.string(from: date)
    }

    private func temperatureToString(temp: Double) -> String {
        let roundNum = Int(temp.rounded(.toNearestOrAwayFromZero))
        return String(roundNum)
    }
}



