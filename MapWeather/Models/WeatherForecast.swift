//
//  WeatherForecast.swift
//  MapWeather
//
//  Created by Grace Njoroge on 12/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import Foundation

struct WeatherForecast {
  let temp: Double
  let icon: String
  let wind: Double
  let rain: Double
  let humidity: Int
  let forecastDate: String
}

// MARK: - Weather
struct Weather: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: ForecastCoord?
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct ForecastCoord: Codable {
    let lat, lon: Double?
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: MainClass
    let weather: [ForecastWeatherElement]
    let clouds: ForecastClouds
    let wind: ForecastWind
    let visibility: Int
    let pop: Double
    let rain: ForecastRain?
    let sys: ForecastSys?
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
    }
}

// MARK: - Clouds
struct ForecastClouds: Codable {
    let all: Int
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
struct ForecastRain: Codable {
  let the3H: Double?
  let the1h: Double?

    enum CodingKeys: String, CodingKey {
      case the3H = "3h"
      case the1h = "1h"
    }
}

// MARK: - Sys
struct ForecastSys: Codable {
    let pod: Pod?
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - WeatherElement
struct ForecastWeatherElement: Codable {
    let id: Int?
    let main: MainEnum?
    let weatherDescription: Description?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
    case moderateRain = "moderate rain"
}

// MARK: - Wind
struct ForecastWind: Codable {
  let speed: Double
  let deg: Int
  let gust: Double?
}
