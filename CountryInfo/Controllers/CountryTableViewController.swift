//
//  CountryTableViewController.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 17/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController {

    // MARK: Properties
    let countryInfoController = CountryInfoController()
    var informations = [Information]()
    var countryInfo = [Information]()
    
    // MARK: Outlets
    
    @IBOutlet weak var labelCountryName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI(with: countryInfo)
    }

    func updateUI(with countryInfo: [Information]) {
        DispatchQueue.main.async {
            self.information(with: countryInfo)
            self.tableView.reloadData()
        }
    }
    
    func information(with countryInfo: [Information]) {
        labelCountryName.text = countryInfo[0].name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
