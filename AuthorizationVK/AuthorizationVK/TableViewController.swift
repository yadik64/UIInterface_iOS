//
//  TableViewController.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 04/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var array = Array(repeating: "Data", count: 10)

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "FirstTableView"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.array[indexPath.row]

        return cell
    }
    
    

    // MARK: - Navigation

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToCollectionView", sender: self)
    }


}
