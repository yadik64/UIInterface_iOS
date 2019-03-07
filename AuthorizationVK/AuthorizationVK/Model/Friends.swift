//
//  Friends.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 07/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import Foundation

struct Friends {
    
    var nameFriend: String
    var iconFriend: String
    var fotoFriend: String
    
    init(name: String, icon: String) {
        self.nameFriend = name
        self.iconFriend = icon
        self.fotoFriend = "foto" + icon
    }
}
