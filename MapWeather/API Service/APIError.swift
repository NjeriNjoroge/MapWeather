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

//protocol ApiResource {
//  associatedtype ModelType: Decodable
//  var methodPath: String { get }
//}
//
//extension ApiResource {
//  var url: URL {
//    var components = URLComponents(string: "https://api.stackexchange.com/2.2")!
//    components.path = methodPath
//    components.queryItems = [
//      URLQueryItem(name: "site", value: "stackoverflow"),
//      URLQueryItem(name: "order", value: "desc"),
//      URLQueryItem(name: "sort", value: "votes"),
//      URLQueryItem(name: "tagged", value: "ios")
//    ]
//    return components.url!
//  }
//}
//
//protocol NetworkRequest: AnyObject {
//  associatedtype ModelType
//  func decode(_ data: Data) -> ModelType?
//  func load(withCompletion completion: @escaping (ModelType?) -> Void)
//}
//extension NetworkRequest {
//  fileprivate func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
//    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
//    let task = session.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
//      guard let data = data else {
//        completion(nil)
//        return
//      }
//      completion(self?.decode(data))
//    })
//    task.resume()
//  }
//}
