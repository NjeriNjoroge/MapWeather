//
//  CurrentWeatherViewController.swift
//  MapWeather
//
//  Created by Grace Njoroge on 12/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

  let weatherView = CurrentView()

  override func loadView() {
    super.loadView()
    weatherView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(weatherView)
    NSLayoutConstraint.activate([
      weatherView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
      weatherView.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      self.tabBarController?.title = "Today"


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
