//
//  AllGroupsController.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 07/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class AllGroupsController: UIViewController {
    
    let allGroups = [
        (nameGroup: "iOS Developers", nameIcon: "appleIcon"),
        (nameGroup: "Free Rider", nameIcon: "freeRiderIcon"),
        (nameGroup: "Saratov News", nameIcon: "saratovNewsIcon"),
        (nameGroup: "Tattoo", nameIcon: "tattooIcon"),
        (nameGroup: "Group One", nameIcon: "anotherGroupIcon"),
        (nameGroup: "Group Two", nameIcon: "anotherGroupIcon"),
        (nameGroup: "Group Three", nameIcon: "anotherGroupIcon"),
        (nameGroup: "Group Four", nameIcon: "anotherGroupIcon"),
        (nameGroup: "Group Five", nameIcon: "anotherGroupIcon"),
        (nameGroup: "Group News", nameIcon: "anotherGroupIcon"),
        (nameGroup: "Group Six", nameIcon: "anotherGroupIcon"),
        (nameGroup: "Group Seven", nameIcon: "anotherGroupIcon"),
        (nameGroup: "Group Eight", nameIcon: "anotherGroupIcon"),
        (nameGroup: "Group Nine", nameIcon: "anotherGroupIcon"),
        (nameGroup: "Group Ten", nameIcon: "anotherGroupIcon")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension AllGroupsController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let identifier = AllGroupsCell.className()
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! AllGroupsCell

        let icon = UIImage(named: allGroups[indexPath.row].nameIcon)
        let nameGroup = allGroups[indexPath.row].nameGroup

        cell.nameIconImage.image = icon
        cell.nameGroupLabel.text = nameGroup

        return cell

    }

}
