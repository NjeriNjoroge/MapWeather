//
//  ForecastViewController.swift
//  MapWeather
//
//  Created by Grace Njoroge on 12/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class ForecastViewController: UICollectionViewController {

//  let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
//
//  lazy var collectionView: UICollectionView = {
//    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
//    collectionView.translatesAutoresizingMaskIntoConstraints = false
//    collectionView.backgroundColor = .white

//    return collectionView
//  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    //view.backgroundColor = .white
    self.tabBarController?.title = "Forecast"
//    collectionView.delegate = self
//    collectionView.dataSource = self
    collectionView.backgroundColor = .white
   collectionView.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: ForecastCollectionViewCell.reuseIdentifier)
  }

  override func loadView() {
    super.loadView()
    setupCollectionView()
  }

  func setupCollectionView() {
    view.addSubview(collectionView)
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.topAnchor),
      collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
      collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }

}
extension ForecastViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionViewCell.reuseIdentifier, for: indexPath) as! ForecastCollectionViewCell
    return cell
  }

}

extension ForecastViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return ForecastCollectionViewCell.defaultSize
  }
}
