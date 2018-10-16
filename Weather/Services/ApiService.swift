//
//  ApiService.swift
//  Weather
//
//  Created by Toby Brown on 15/10/2018.
//  Copyright © 2018 TAB. All rights reserved.
//

import Foundation

class ApiService {

//Get some data from the API

    private let openWeatherMapBaseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "b2303b5f4bda6b6ed6658ba9fb4afcf4"

    func getDecodedData(forCity: String) {

        // Create URL session to converse with Open Weather Map.
        let session = URLSession.shared
        let jsonURL = "\(openWeatherMapBaseURL)?q=\(forCity),uk&APPID=\(openWeatherMapAPIKey)"

        // Get weather data.
        guard let url = URL(string: jsonURL) else {
            return
        }
        session.dataTask(with: url) {data,response,error in
            if let error = error {
                // Deal with server request error
                print("Error:\n\(error)")
            }
            else {
                guard let data = data else {
                    return
                }
                do {
                    // Create a data object with the data
                    let decoder = JSONDecoder()
                    let currentWeather = try decoder.decode(CurrentWeather.self, from: data)
                    print(currentWeather)
                } catch let error {
                    // Problem with decoding
                    print("Error with data: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
