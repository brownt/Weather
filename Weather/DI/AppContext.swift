//
//  AppContext.swift
//  Weather
//
//  Created by Toby Brown on 23/10/2018.
//  Copyright © 2018 TAB. All rights reserved.
//

import Foundation

enum AppContext: WeatherServiceComponent {
    static let weatherService = AppContext.createWeatherService()
}
