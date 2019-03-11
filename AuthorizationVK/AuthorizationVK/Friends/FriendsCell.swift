//
//  FriendsCell.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 07/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {

//    @IBOutlet weak var nameIconImage: UIImageView!
    @IBOutlet weak var nameFriendLabel: UILabel!
    @IBOutlet weak var nameIconImage: IconAvatar!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
