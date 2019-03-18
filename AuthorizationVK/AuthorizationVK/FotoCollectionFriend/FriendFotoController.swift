//
//  FriendFotoController.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 07/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class FriendFotoController: UIViewController {
    
    var friendData: Friends?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Фото \(friendData?.nameFriend ?? "")"
    }

}

extension FriendFotoController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = FriendFotoCell.className()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FriendFotoCell
        guard friendData != nil else {
            
            cell.nameFotoImage.image = UIImage(named: "nophoto")
            return cell
        }
        
        let foto = UIImage(named: (friendData?.fotoFriend)!) 
        cell.nameFotoImage.image = foto
        
        return cell
    }
    
}

