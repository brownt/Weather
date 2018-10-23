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

    let weatherService = AppContext.weatherService
    private(set) var weatherViewModel: WeatherViewModel?

    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    @IBAction func getWeatherButton(_ sender: Any) {
        displayWeather()
    }

    var searchResult: CurrentWeather? {
        didSet {
            guard let searchResult = searchResult else { return }
            weatherViewModel = WeatherViewModel.init(currentWeather: searchResult)
            DispatchQueue.main.async {
                self.updateLabels()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayWeather()
    }
}

extension MainViewController {

    private func updateLabels() {
        guard let weatherViewModel = weatherViewModel else { return }
        placeLabel.text = weatherViewModel.placeString
        weatherTypeLabel.text = weatherViewModel.weatherTypeString
        temperatureLabel.text = weatherViewModel.temperatureString
        lastUpdateLabel.text = weatherViewModel.lastUpdatedString
    }

    func displayWeather() {
        self.weatherService.getWeather(forCity: "Slough") { (weather, error) in
            if let error = error {
                print("Error getting weather: \(error.localizedDescription)")
                return
            }
            guard let weather = weather else {
                return
            }
            self.searchResult = weather
        }
    }
}
