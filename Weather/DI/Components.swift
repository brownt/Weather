//
//  Components.swift
//  Weather
//
//  Created by Toby Brown on 23/10/2018.
//  Copyright © 2018 TAB. All rights reserved.
//

import Foundation

protocol WeatherServiceComponent {
    static var weatherService: WeatherServiceProtocol { get }
    static func createWeatherService() -> WeatherServiceProtocol
}
