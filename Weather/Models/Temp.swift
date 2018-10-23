//
//  Temp.swift
//  Weather
//
//  Created by Toby Brown on 15/10/2018.
//  Copyright © 2018 TAB. All rights reserved.
//

struct Temp: Codable {
    let tempNow: Double
    let tempMin: Double?
    let tempMax: Double?

    enum CodingKeys: String, CodingKey {
        case tempNow = "temp"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
