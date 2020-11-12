//
//  APIError.swift
//  MapWeather
//
//  Created by Grace Njoroge on 11/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import Foundation

enum WeatherApiError: Error {
  case requestFailed
  case invalidData
  case jsonParsingFailure(message: String)
}
