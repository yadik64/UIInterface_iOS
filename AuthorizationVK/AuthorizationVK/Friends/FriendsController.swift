//
//  FriendsController.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 07/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class FriendsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    private var userFriendDictionary = [String: [Friends]]()
    static var sectionName: [String] {
        get {
            var charArray = [String]()
            for friend in Friends.userFriendsArray {
                if !charArray.contains(friend.friendStartChar){
                    charArray.append(friend.friendStartChar)
                }
            }
            return charArray.sorted()
        }
    }

    override func loadView() {
        super.loadView()

        for friend in Friends.userFriendsArray {
            if var value = userFriendDictionary[friend.friendStartChar] {
                value.append(friend)
                userFriendDictionary[friend.friendStartChar] = value
            } else {
                userFriendDictionary[friend.friendStartChar] = [friend]
            }
        }

        Friends.userFriendsArray = Friends.userFriendsArray.sorted(by: {$0.friendStartChar < $1.friendStartChar})

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Мои Друзья"
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Введите Имя или Фамилию"
        navigationItem.searchController = searchController
        definesPresentationContext = true

    }

    @IBAction func pressChar(_ sender: CharControl) {
        if sender.selectedChar == "search" {
            searchController.searchBar.becomeFirstResponder()
        }
        
        guard !isFiltering() else { return }
        guard let section = FriendsController.sectionName.index(of: sender.selectedChar!) else {
            return
        }
        
        let indexPath = IndexPath(row: 0, section: section)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    //MARC: - SearchControll Methods
    
    private func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        Friends.filterFriendsArray = Friends.userFriendsArray.filter({(friends : Friends) -> Bool in
            return friends.nameFriend.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    private func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "fotoCollectionSegue" else {
            return
        }
        
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        if isFiltering() {
            let friendFotoController = segue.destination as! FriendFotoController
            friendFotoController.friendData = Friends.filterFriendsArray[indexPath.row]
        } else {
        
        let key = FriendsController.sectionName[indexPath.section]
        guard let friend = userFriendDictionary[key] else {
            return
        }
        
        let friendFotoController = segue.destination as! FriendFotoController
        
        friendFotoController.friendData = friend[indexPath.row]
        }
    }

}

//MARK: - UITableViewDataSourse

extension FriendsController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if isFiltering() {
            return 1
        }
        
        return userFriendDictionary.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering() {
            return Friends.filterFriendsArray.count
        }
        
        let key = FriendsController.sectionName[section]
        guard let numberOfRows = userFriendDictionary[key]?.count else {
            return 0
        }

        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = FriendsCell.className()
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FriendsCell
        
        if isFiltering() {
            let fotoName = Friends.filterFriendsArray[indexPath.row].fotoFriend
            cell.nameIconImage.image = UIImage(named: fotoName)
            cell.nameFriendLabel.text = Friends.filterFriendsArray[indexPath.row].nameFriend
            return cell
        }
        
        let key = FriendsController.sectionName[indexPath.section]
        guard let friend = userFriendDictionary[key] else { return cell }
        let fotoName = friend[indexPath.row].fotoFriend
        
        cell.nameFriendLabel.text = friend[indexPath.row].nameFriend
        cell.nameIconImage.image = UIImage(named: fotoName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isFiltering() {
            return "Результат поиска:"
        }
        return FriendsController.sectionName[section]
    }

}

//MARK: - UISearchResultUpdating

extension FriendsController : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    
}


let array: [(title : String, emblem : UIImageView)] = []
