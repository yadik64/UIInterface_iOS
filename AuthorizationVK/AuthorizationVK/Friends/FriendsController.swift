//
//  FriendsController.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 07/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit


//var userFriendsArray = [
//    Friends(name: "Джеймс Алан Хэтфилд", foto: "fotohetvield"),
//    Friends(name: "Стивен Пол (Стив) Джобс", foto: "fotojobs"),
//    Friends(name: "Ральф «Сонни» Баргер", foto: "fotobarger"),
//    Friends(name: "Джеймс Алан Хэтфилд", foto: "fotohetvield"),
//    Friends(name: "Стивен Пол (Стив) Джобс", foto: "fotojobs"),
//    Friends(name: "Ральф «Сонни» Баргер", foto: "fotobarger")
//]

class FriendsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var userFriendDictionary = [String: [Friends]]()
    private var sectionName = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for friend in Friends.userFriendsArray {
            if var value = userFriendDictionary[friend.friendStartChar] {
                value.append(friend)
                userFriendDictionary[friend.friendStartChar] = value
            } else {
                userFriendDictionary[friend.friendStartChar] = [friend]
                if !sectionName.contains(friend.friendStartChar) {
                    sectionName.append(friend.friendStartChar)
                }
            }
        }
        
        Friends.userFriendsArray = Friends.userFriendsArray.sorted(by: {$0.friendStartChar < $1.friendStartChar})
        sectionName = sectionName.sorted()
        title = "Мои Друзья"

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "fotoCollectionSegue" else {
            return
        }
        
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        let key = sectionName[indexPath.section]
        guard let friend = userFriendDictionary[key] else {
            return
        }
        
        let friendFotoController = segue.destination as! FriendFotoController
        
        friendFotoController.friendData = friend[indexPath.row]
    }

}

extension FriendsController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return userFriendDictionary.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let key = sectionName[section]
        guard let numberOfRows = userFriendDictionary[key]?.count else {
            return 0
        }

        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = FriendsCell.className()
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FriendsCell
        let key = sectionName[indexPath.section]
        guard let friend = userFriendDictionary[key] else { return cell }
        let fotoName = friend[indexPath.row].fotoFriend
        
        cell.nameFriendLabel.text = friend[indexPath.row].nameFriend
        cell.nameIconImage.image = UIImage(named: fotoName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionName[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionName
    }

}
