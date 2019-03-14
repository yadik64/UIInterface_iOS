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
    var fotoFriend: String
    var friendStartChar: String {
        get {
            let startChar = String(secondName.prefix(1))
            return startChar
        }
    }
    var secondName: String {
        get {
            let array = nameFriend.components(separatedBy: " ")
            return array[array.count - 1]
        }
    }
    
    static var userFriendsArray: [Friends] = [
        Friends(nameFriend: "Михаил Приходько",    fotoFriend: "1"),
        Friends(nameFriend: "Роман Мотрохов",      fotoFriend: "2"),
        Friends(nameFriend: "Майя Гёссен",         fotoFriend: "3"),
        Friends(nameFriend: "Евгения Яровая",      fotoFriend: "4"),
        Friends(nameFriend: "Валерий Коротков",    fotoFriend: "5"),
        Friends(nameFriend: "Александр Сергеевич", fotoFriend: "6")
    ]
    
    
}
