//
//  CurrentWeather.swift
//  MapWeather
//
//  Created by Grace Njoroge on 11/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import Foundation

struct TodayWeather {
  let temp: Double
  let icon: String
  let wind: Double
  let rain: Double
  let humidity: Int
}

// MARK: - Weather
struct CurrentWeather: Codable {
    let coord: Coord
    let weather: [WeatherElement]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys?
    let timezone, id: Int
    let name: String
    let cod: Int
    let rain: Rain?
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

struct Rain: Codable {
  let the3H: Double?
  let the1h: Double?

    enum CodingKeys: String, CodingKey {
      case the3H = "3h"
      case the1h = "1h"
    }
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int?
    let country: String?
    let sunrise, sunset: Int?
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}
