//
//  UserGroupsController.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 06/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class UserGroupsController: UIViewController {
    
    var userGroupsArray = [
        Group(nameGroup: "iOS Developers", nameIcon: "appleIcon"),
        Group(nameGroup: "Free Rider", nameIcon: "freeRiderIcon"),
        Group(nameGroup: "Saratov News", nameIcon: "saratovNewsIcon"),
        Group(nameGroup: "Tattoo", nameIcon: "tattooIcon")
    ]
    
//    var userGroupsArray = [Group]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func editRowsButton(_ sender: UIBarButtonItem) {
        tableView.isEditing = !tableView.isEditing
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        
        let segueIdetifier = "addGroup"
        guard segue.identifier == segueIdetifier else {
            return
        }
        
        let allGroupsController = segue.source as! AllGroupsController
        guard let indexPath = allGroupsController.tableView.indexPathForSelectedRow else {
            return
        }
        
        let group: Group
        if allGroupsController.isFiltering() {
            group = allGroupsController.searchResultArray[indexPath.row]
        } else {
            group = allGroupsController.dispayedGroupsArray[indexPath.row]
        }
        
        guard !userGroupsArray.contains(where: {$0 == group}) else {
            return
        }
        userGroupsArray.append(group)
        tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SegueToAllGroups" else {
            return
        }
        let allGroupsController = segue.destination as! AllGroupsController
        
        allGroupsController.dispayedGroupsArray = Array(Set(allGroupsController.allGroupsArray).subtracting(userGroupsArray))
        
        
    }

}

extension UserGroupsController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userGroupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = UserGroupsCell.className()
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! UserGroupsCell
        let iconName = userGroupsArray[indexPath.row].nameIcon
        let nameGroup = userGroupsArray[indexPath.row].nameGroup
        cell.nameIconImage.image = UIImage(named: iconName)
        cell.nameGroupLabel.text = nameGroup
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let boof = userGroupsArray[sourceIndexPath.row]
        userGroupsArray[sourceIndexPath.row] = userGroupsArray[destinationIndexPath.row]
        userGroupsArray[destinationIndexPath.row] = boof
    }
}

extension UserGroupsController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            userGroupsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension NSObject {
    static func className() -> String {
        return String(describing: self)
    }
}
