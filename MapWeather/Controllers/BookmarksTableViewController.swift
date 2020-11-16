//
//  BookmarksTableViewController.swift
//  MapWeather
//
//  Created by Grace Njoroge on 13/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

//user should be able to remove a bookmark
import UIKit
import MapKit



class BookmarksTableViewController: UITableViewController {

  let cellId = "cell"
  let defaults = UserDefaults.standard
  var currentLocation:CLLocationCoordinate2D!
  var alertText = ""
  var bookmarkedCities = [String]()
  weak var delegate: GetCityNameAndCoordinates?

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    setBookmarkName()
  }

  fileprivate func setBookmarkName() {
    let alert = UIAlertController(title: "Optional bookmark name", message: "", preferredStyle: .alert)
    alert.addTextField { (textField) in
      textField.placeholder = "Bookmark name"
    }
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
      let textField = alert?.textFields![0]// Force unwrapping because we know it exists.
      let city = textField?.text ?? ""
      self.alertText = city
    }))

    let savedCity = defaults.string(forKey: "citySaved") ?? ""
    let latSaved = defaults.double(forKey: "LatCoord") ?? 0.0
    let longSaved = defaults.double(forKey: "LongCoord") ?? 0.0
    currentLocation = CLLocationCoordinate2D(latitude: latSaved, longitude: longSaved)

    bookmarkedCities.append("\(currentLocation)")
    self.present(alert, animated: true, completion: nil)
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Bookmarked"
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bookmarkedCities.count
  }


  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    cell.selectionStyle = .none
    let cityName = defaults.object(forKey: "SavedArray") as? [String] ?? [String]()

    cell.textLabel?.text = alertText ?? bookmarkedCities[indexPath.row]
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let newVC = CurrentWeatherViewController()
    newVC.getDeets(cityname: alertText, coord: currentLocation)
    navigationController?.pushViewController(newVC, animated: true)
  }

}
