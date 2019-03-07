//
//  AllGroupsController.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 07/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class AllGroupsController: UIViewController {
    
    let allGroupsArray = [
        Group(nameGroup: "iOS Developers", nameIcon: "appleIcon"),
        Group(nameGroup: "Free Rider", nameIcon: "freeRiderIcon"),
        Group(nameGroup: "Saratov News", nameIcon: "saratovNewsIcon"),
        Group(nameGroup: "Tattoo", nameIcon: "tattooIcon"),
        Group(nameGroup: "Group One", nameIcon: "anotherGroupIcon"),
        Group(nameGroup: "Group Two", nameIcon: "anotherGroupIcon"),
        Group(nameGroup: "Group Three", nameIcon: "anotherGroupIcon"),
        Group(nameGroup: "Group Four", nameIcon: "anotherGroupIcon"),
        Group(nameGroup: "Group Five", nameIcon: "anotherGroupIcon"),
        Group(nameGroup: "Group News", nameIcon: "anotherGroupIcon"),
        Group(nameGroup: "Group Six", nameIcon: "anotherGroupIcon"),
        Group(nameGroup: "Group Seven", nameIcon: "anotherGroupIcon"),
        Group(nameGroup: "Group Eight", nameIcon: "anotherGroupIcon"),
        Group(nameGroup: "Group Nine", nameIcon: "anotherGroupIcon"),
        Group(nameGroup: "Group Ten", nameIcon: "anotherGroupIcon")
    ]
    var searchResultArray = [Group]()
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск групп"
        tableView.tableHeaderView = searchController.searchBar

    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        searchResultArray = allGroupsArray.filter({( group : Group) -> Bool in
            return group.nameGroup.lowercased().contains(searchText.lowercased())
        })

        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
}

extension AllGroupsController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return searchResultArray.count
        }
        
        return allGroupsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = AllGroupsCell.className()
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! AllGroupsCell
        
        let group: Group
        if isFiltering() {
            group = searchResultArray[indexPath.row]
        } else {
            group = allGroupsArray[indexPath.row]
        }

        let icon = UIImage(named: group.nameIcon)
        let nameGroup = group.nameGroup
        cell.nameIconImage.image = icon
        cell.nameGroupLabel.text = nameGroup

        return cell
    }
}

extension AllGroupsController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
