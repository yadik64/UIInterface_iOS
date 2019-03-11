//
//  FriendsController.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 07/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit


var userFriendsArray = [
    Friends(name: "Джеймс Алан Хэтфилд", foto: "fotohetvield"),
    Friends(name: "Стивен Пол (Стив) Джобс", foto: "fotojobs"),
    Friends(name: "Ральф «Сонни» Баргер", foto: "fotobarger")
]

class FriendsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Мои Друзья"

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
        let fotoName = userFriendsArray[indexPath.row].fotoFriend
        
        cell.nameFriendLabel.text = name
        cell.nameIconImage.createIconAvatar(image: fotoName)
        
        return cell
    }

}
