//
//  MainViewController.swift
//  Weather
//
//  Created by Toby Brown on 10/10/2018.
//  Copyright © 2018 TAB. All rights reserved.
//
import Foundation
import UIKit

class MainViewController: UIViewController {

    let apiService = ApiService()

    override func viewDidLoad() {
        super.viewDidLoad()

        apiService.getDecodedData(forCity: "Slough")
    }
}
