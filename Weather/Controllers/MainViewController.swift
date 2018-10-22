//
//  MainViewController.swift
//  Weather
//
//  Created by Toby Brown on 10/10/2018.
//  Copyright © 2018 TAB. All rights reserved.
//
import Foundation
import Promises

class MainViewController: UIViewController {

    let weatherService = WeatherService()

    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBAction func getWeatherButton(_ sender: Any) {
        displayTemp()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func displayTemp() {
        self.weatherService.getWeather(forCity: "Slough") { (weather, error) in
            if let error = error {
                print("Error getting weather: \(error.localizedDescription)")
                return
            }
            guard let weather = weather else {
                return
            }
            print(weather)
            DispatchQueue.main.async{
                self.placeLabel.text = weather.name
                self.weatherTypeLabel.text = weather.weather[0].main
                self.temperatureLabel.text = weather.temperature.tempNow?.description
            }
        }
    }
}
