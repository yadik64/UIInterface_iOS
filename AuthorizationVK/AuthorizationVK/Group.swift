//
//  Group.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 07/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import Foundation

struct Group {
    
    var nameGroup : String
    var nameIcon : String
    
}

extension Group {
    
    static func == (left: Group, right: Group) -> Bool {
        
        guard left.nameGroup == right.nameGroup else {
            return false
        }
        return true
    }
    
}
