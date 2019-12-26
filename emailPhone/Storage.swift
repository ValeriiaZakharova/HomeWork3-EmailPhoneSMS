//
//  Storage.swift
//  emailPhone
//
//  Created by Valeriia Zakharova on 23.12.2019.
//  Copyright © 2019 Valeriia Zakharova. All rights reserved.
//

import Foundation
import UIKit

class Storage {
 
    func makeUser1() -> Profile {
        
        let user1 = Profile()
        user1.name = "Kiril Trembovetskyi"
        user1.information =
        """
        iOS developer
        iOS Treiner
        """
        user1.profileImage = UIImage(named: "photo1")
        
        return user1
    }
    
    func makeUser2() -> Profile {
        
        let user2 = Profile()
        user2.name = "Aleksey Sorochan"
        user2.information =
        """
        iOS developer in future
        Photographer
        """
        user2.profileImage = UIImage(named: "photo2")
        
        return user2
    }
    func makeUser3() -> Profile {
        
        let user3 = Profile()
        user3.name = "Michail Tsyba"
        user3.information =
        """
        iOS developer in future
        Developer
        """
        user3.profileImage = UIImage(named: "photo3")
        
        return user3
    }
}
