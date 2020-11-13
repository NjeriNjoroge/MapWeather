//
//  BookmarksTableViewController.swift
//  MapWeather
//
//  Created by Grace Njoroge on 13/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

//user should be able to remove a bookmark
import UIKit

class BookmarksTableViewController: UITableViewController {

  let cellId = "cell"

  let sections = ["Popular", "Bookmarked"]
  let popularCities = ["Berlin, Germany", "Paris, France", "Wanshington DC, United States", "Stockhom, Sweden", "London, England"]
  let bookmarkedCities = [String]()
  let twoDimensionalArray = [
["Berlin, Germany", "Paris, France", "Wanshington DC, United States", "Stockhom, Sweden", "London, England"],
    ["Nairobi, Kenya"]
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    return twoDimensionalArray.count
  }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sections[section]

  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return twoDimensionalArray[section].count

  }


  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    cell.selectionStyle = .none

//    let cityName = indexPath.section == 0 ? popularCities[indexPath.row] : bookmarkedCities[indexPath.row]
//    cell.textLabel?.text = cityName
    let cityName = twoDimensionalArray[indexPath.section][indexPath.row]
cell.textLabel?.text = cityName
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let _ = twoDimensionalArray[indexPath.section][indexPath.row]
    let newVC = CityScreenTabController()
    navigationController?.pushViewController(newVC, animated: true)

  }


  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */

  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */

  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

   }
   */

  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */

  /*
   // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */

}
