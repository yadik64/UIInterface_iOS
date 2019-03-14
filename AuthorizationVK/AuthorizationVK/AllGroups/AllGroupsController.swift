//
//  AllGroupsController.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 07/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class AllGroupsController: UIViewController {
    
    var allGroupsArray = [
        Group(nameGroup: "iOS Developers", nameIcon: "appleIcon"),
        Group(nameGroup: "Free Rider", nameIcon: "freeRiderIcon"),
        Group(nameGroup: "Saratov News", nameIcon: "saratovNewsIcon"),
        Group(nameGroup: "Tattoo", nameIcon: "tattooIcon"),
        Group(nameGroup: "GeekBrains", nameIcon: "geekIcon"),
        Group(nameGroup: "Байкерский журнал СВОБОДНАЯ ДОРОГА", nameIcon: "freeRoadIcon"),
        Group(nameGroup: "Запчасти Geely Запчасти Джили", nameIcon: "geelyIcon"),
        Group(nameGroup: "ФИЛЬМЫ УЖАСОВ", nameIcon: "horrorIcon"),
        Group(nameGroup: "Мой Алабай.", nameIcon: "alabayIcon"),
        Group(nameGroup: "Чоппер или мото без пластмассы", nameIcon: "chopperIcon"),
        Group(nameGroup: "Route 66", nameIcon: "route66Icon"),
        Group(nameGroup: "Читатели Чака Паланика", nameIcon: "palahniukIcon"),
        Group(nameGroup: "Мир Высоких Технологий", nameIcon: "peaceITIcon"),
        Group(nameGroup: "Beard custom studio", nameIcon: "beardIcon"),
        Group(nameGroup: "Falcon Tuning", nameIcon: "falconIcon")
    ]
    var dispayedGroupsArray = [Group]()
    var searchResultArray = [Group]()
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск групп"
        tableView.tableHeaderView = searchController.searchBar
        
        title = "Группы"

    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        searchResultArray = dispayedGroupsArray.filter({( group : Group) -> Bool in
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
        
        return dispayedGroupsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = AllGroupsCell.className()
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! AllGroupsCell
        
        let group: Group
        if isFiltering() {
            group = searchResultArray[indexPath.row]
        } else {
            group = dispayedGroupsArray[indexPath.row]
        }

        let iconName = group.nameIcon
        let nameGroup = group.nameGroup
        cell.nameIconImage.image = UIImage(named: iconName)
        cell.nameGroupLabel.text = nameGroup

        return cell
    }
}

extension AllGroupsController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
