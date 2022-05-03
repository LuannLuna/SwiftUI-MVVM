//
//  WeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Luann Luna on 03/05/22.
//

import Foundation

struct WeatherViewModel {
    private let weather: Weather
    
    init(weather: Weather) {
        self.weather = weather
    }
    let id: UUID = UUID()
    var temperature: Double { weather.temperature }
    var city: String { weather.city }
    var icon: String { weather.icon }
    var sunrise: Date { weather.sunrise }
    var sunset: Date { weather.sunset }
    
    func getTemperatureByUnit(unit: TemperatureUnit) -> Double {
        switch unit {
        case .celsius:
            return weather.temperature - 273.15
        case .fahrenheit:
            return 1.8 * (weather.temperature - 273) + 32
        case .kelvin:
            return weather.temperature
        }
    }
}
