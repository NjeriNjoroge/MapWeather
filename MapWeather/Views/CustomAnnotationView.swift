//
//  CustomAnnotationView.swift
//  MapWeather
//
//  Created by Grace Njoroge on 16/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotationView: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?

  init(coordinate: CLLocationCoordinate2D, title: String) {
     self.coordinate = coordinate
     self.title = title
   }
}
