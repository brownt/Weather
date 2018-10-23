//
//  WeatherServiceProtocol.swift
//  Weather
//
//  Created by Toby Brown on 23/10/2018.
//  Copyright © 2018 TAB. All rights reserved.
//

import Foundation

protocol WeatherServiceProtocol {

    func getWeather(forCity: String, completion: @escaping (_ weather: CurrentWeather?, _ error: Error?) -> Void)

}
