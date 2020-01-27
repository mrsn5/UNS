//
//  Storyboarded.swift
//  UNS
//
//  Created by San Byn Nguyen on 17.01.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self) // "MyApp.MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
