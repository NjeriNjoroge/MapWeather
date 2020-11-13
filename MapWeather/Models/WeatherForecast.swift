//
//  WeatherForecast.swift
//  MapWeather
//
//  Created by Grace Njoroge on 12/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import Foundation

struct WeatherForecast: Codable {

  let humidity: Double
  let temperature: Double
  let weatherIcon: String
  let wind: Double
  let rain: Double
}


//struct WeatherForecast: Codable {
//    let cod: String
//    let message, cnt: Int
//    let list: [List]
//    let city: City
//}
//
//// MARK: - City
//struct City: Codable {
//    let id: Int
//    let name: String
//    let coord: ForecastCoord
//    let country: String
//    let population, timezone, sunrise, sunset: Int
//}
//
//// MARK: - Coord
//struct ForecastCoord: Codable {
//    let lat, lon: Double
//}
//
//// MARK: - List
//struct List: Codable {
//    let dt: Int
//    let main: MainClass
//    let weather: [WeatherForecastElement]
//    let clouds: Clouds
//    let wind: ForecastWind
//    let visibility: Int
//    let pop: Double
//    let sys: ForecastSys
//    let dtTxt: String
//    let rain: Rain?
//
//    enum CodingKeys: String, CodingKey {
//        case dt, main, weather, clouds, wind, visibility, pop, sys
//        case dtTxt = "dt_txt"
//        case rain
//    }
//}
//
//// MARK: - MainClass
//struct MainClass: Codable {
//    let temp, feelsLike, tempMin, tempMax: Double
//    let pressure, seaLevel, grndLevel, humidity: Int
//    let tempKf: Double
//
//    enum CodingKeys: String, CodingKey {
//        case temp
//        case feelsLike = "feels_like"
//        case tempMin = "temp_min"
//        case tempMax = "temp_max"
//        case pressure
//        case seaLevel = "sea_level"
//        case grndLevel = "grnd_level"
//        case humidity
//        case tempKf = "temp_kf"
//    }
//}
//
//// MARK: - Rain
//struct Rain: Codable {
//    let the3H: Double
//
//    enum CodingKeys: String, CodingKey {
//        case the3H = "3h"
//    }
//}
//
//// MARK: - Sys
//struct ForecastSys: Codable {
//    let pod: Pod
//}
//
//enum Pod: String, Codable {
//    case d = "d"
//    case n = "n"
//}
//
//// MARK: - WeatherElement
//struct WeatherForecastElement: Codable {
//    let id: Int
//    let main: MainEnum
//    let weatherDescription: Description
//    let icon: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, main
//        case weatherDescription = "description"
//        case icon
//    }
//}
//
//enum MainEnum: String, Codable {
//    case clear = "Clear"
//    case clouds = "Clouds"
//    case rain = "Rain"
//}
//
//enum Description: String, Codable {
//    case brokenClouds = "broken clouds"
//    case clearSky = "clear sky"
//    case fewClouds = "few clouds"
//    case lightRain = "light rain"
//    case overcastClouds = "overcast clouds"
//    case scatteredClouds = "scattered clouds"
//}
//
//// MARK: - Wind
//struct ForecastWind: Codable {
//    let speed: Double
//    let deg: Int
//}
