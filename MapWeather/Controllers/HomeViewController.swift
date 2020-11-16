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
  }

  override func loadView() {
    super.loadView()
    setupMap()
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(openBookmarks))

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

}

extension HomeViewController: MKMapViewDelegate {

}
