//
//  ViewController.swift
//  Weather
//
//  Created by Toby Brown on 10/10/2018.
//  Copyright © 2018 TAB. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        getWeather(city: "Slough,uk")
    }

    //Get some JSON data from the API

    private let openWeatherMapBaseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "b2303b5f4bda6b6ed6658ba9fb4afcf4"

    func getWeather(city: String) {

        // Create URL session to converse with Open Weather Map.
        let session = URLSession.shared
        let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?q=\(city)&APPID=\(openWeatherMapAPIKey)")!

        // Get weather data.
        let dataTask = session.dataTask(with: weatherRequestURL) {data,response,error in
            if let error = error {
                // Deal with server request error
                print("Error:\n\(error)")
            }
            else {
                // Do something with the response
                print("Raw data:\n\(data!)\n")
                let dataString = String(data: data!, encoding: String.Encoding.utf8)
                print("Human-readable data:\n\(dataString!)")
            }
        }
        // Do data task
        dataTask.resume()
    }
}
