//
//  Store.swift
//  WeatherAppSwiftUI
//
//  Created by Luann Luna on 03/05/22.
//

import Foundation

class Store: ObservableObject {
    
    @Published var weatherList: [WeatherViewModel] = []
    @Published var selectedUnit: TemperatureUnit = .kelvin
    
    init() {
        selectedUnit = UserDefaults.standard.unit
    }
    
    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
    }
}
