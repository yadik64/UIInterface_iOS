//
//  FriendsController.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 07/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

var userFriendsArray = [
    Friends(name: "Джеймс Алан Хэтфилд", icon: "hetvield"),
    Friends(name: "Стивен Пол (Стив) Джобс", icon: "jobs"),
    Friends(name: "Ральф «Сонни» Баргер", icon: "barger")
]

class FriendsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "fotoCollectionSegue" else {
            return
        }
        
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        let friendData = userFriendsArray[indexPath.row]
        
        let friendFotoController = segue.destination as! FriendFotoController
        
        friendFotoController.friendData = friendData
    }

}

extension FriendsController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userFriendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = FriendsCell.className()
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FriendsCell
        
        let name = userFriendsArray[indexPath.row].nameFriend
        let icon = UIImage(named: userFriendsArray[indexPath.row].iconFriend)
        
        cell.nameFriendLabel.text = name
        cell.nameIconImage.image = icon
        
        return cell
    }
}
