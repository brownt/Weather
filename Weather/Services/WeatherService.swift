//
//  WeatherService.swift
//  Weather
//
//  Created by Toby Brown on 15/10/2018.
//  Copyright © 2018 TAB. All rights reserved.
//

import Foundation
//import Promises
//
//enum PromiseError: Error {
//    case invalidURL
//    case urlSessionError
//}

class WeatherService {

    private let openWeatherMapBaseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "b2303b5f4bda6b6ed6658ba9fb4afcf4"

    // test Google Promises
//    func constructWeatherURL(forCity: String) -> Promise<String> {
//
//        let weatherURL = "\(openWeatherMapBaseURL)?q=\(forCity),uk&units=metric&appid=\(openWeatherMapAPIKey)"
//
//        return Promise { () -> String in
//            guard let url: URL = URL(string: weatherURL) else {
//                throw PromiseError.invalidURL
//            }
//            print("URL is: \(url)")
//            return url.absoluteString
//        }
//    }

    func getWeather(forCity: String, completion: @escaping (_ weather: CurrentWeather?, _ error: Error?) -> Void) {
//   let weatherURL = constructWeatherURL(forCity: forCity)
        let weatherURL = "\(openWeatherMapBaseURL)?q=\(forCity),uk&units=metric&appid=\(openWeatherMapAPIKey)"
        print("URL is: \(weatherURL)")
        // get the json weather data
        getJSON(urlString: weatherURL) { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return completion(nil, error)
            }
            // decode json to object
            self.createDataObject(json: data, completion: { (weather, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completion(nil, error)
                }
                return completion(weather, nil)
            })
        }
    }

    func getJSON(urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("urlString isn't a URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            guard error == nil else {
                print("No response from URL")
                return completion(nil, error)
            }
            guard let responseData = data else {
                print("No data from that URL")
                return completion(nil, error)
            }
            completion(responseData, nil)
        }
        task.resume()
    }

    func createDataObject(json: Data, completion: @escaping (_ data: CurrentWeather?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            let weather = try decoder.decode(CurrentWeather.self, from: json)
            return completion(weather, nil)
        } catch let error {
            print("Error creating data object: \(error.localizedDescription)")
            return completion(nil, error)
        }
    }

}
