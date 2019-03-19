//
//  NewsCell.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 17/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var imagePostView: UIImageView!
    @IBOutlet weak var textPostLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
