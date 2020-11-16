//
//  HomeViewController.swift
//  MapWeather
//
//  Created by Grace Njoroge on 13/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {

  let annotation = MKPointAnnotation()
  let defaults = UserDefaults.standard

  lazy var mapView: MKMapView = {
    let map = MKMapView()
    //map.showsUserLocation = true //drop a pin at users current location
    map.translatesAutoresizingMaskIntoConstraints = false
    return map
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    self.title = "Home"
    mapView.delegate = self
    setUpGesture()
  }

  override func loadView() {
    super.loadView()
    setupMap()

    let helpBtn = UIBarButtonItem(image: UIImage(named: "help"), style: .plain, target: self, action: #selector(openHelpScreen))
    let settingBtn = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(openSettingScreen))

    navigationItem.setLeftBarButtonItems([helpBtn, settingBtn], animated: true)
  }

  fileprivate func setupMap() {
    view.addSubview(mapView)
    NSLayoutConstraint.activate([
      mapView.topAnchor.constraint(equalTo: view.topAnchor),
      mapView.leftAnchor.constraint(equalTo: view.leftAnchor),
      mapView.rightAnchor.constraint(equalTo: view.rightAnchor),
      mapView.heightAnchor.constraint(equalTo: view.heightAnchor)
    ])
  }

  @objc fileprivate func openBookmarks() {
    let newVC = BookmarksTableViewController()
   
    navigationController?.pushViewController(newVC, animated: true)
  }

  @objc fileprivate func openHelpScreen() {
    let newVC = HelpViewController()
    navigationController?.pushViewController(newVC, animated: true)
  }

  @objc fileprivate func openSettingScreen() {
    let newVC = SettingsViewController()
    navigationController?.pushViewController(newVC, animated: true)
  }

  func setUpGesture() {
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
    gestureRecognizer.delegate = self
    mapView.addGestureRecognizer(gestureRecognizer)
  }

}

extension HomeViewController: MKMapViewDelegate {


  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    let reuseId = "pin"
    var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
    if pinView == nil {
        pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        pinView?.canShowCallout = true

        let rightButton: AnyObject! = UIButton(type: UIButton.ButtonType.detailDisclosure)
        pinView?.rightCalloutAccessoryView = rightButton as? UIView
    }
    else {
        pinView?.annotation = annotation
    }

    return pinView
  }

  func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
    let alert = UIAlertController(title: "Add bookmark", message: "", preferredStyle: .alert)
    // 3. Grab the value from the text field, and save it when the user clicks OK.
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
      self.openBookmarks()
    }))
    let latCoord = view.annotation?.coordinate.latitude
    let longCoord = view.annotation?.coordinate.longitude
    defaults.set(latCoord, forKey: "LatCoord")
    defaults.set(longCoord, forKey: "LongCoord")
    self.present(alert, animated: true, completion: nil)
  }

}

//MARK: UIGesture Delegate
extension HomeViewController: UIGestureRecognizerDelegate {

  ///Gets the longitude and latitude of the position user tapped
  @objc func handleTap(gestureRecognizer: UITapGestureRecognizer) {

    let location = gestureRecognizer.location(in: mapView)
    let coordinate = mapView.convert(location,toCoordinateFrom: mapView)

    mapView.annotations.forEach {
     mapView.removeAnnotation($0)
    }

    ///Add annotation:
    annotation.coordinate = coordinate
    annotation.title = "\(coordinate)"
    mapView.addAnnotation(annotation)
  }
}
