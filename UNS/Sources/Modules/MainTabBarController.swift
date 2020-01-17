//
//  MainTabBarController.swift
//  UNS
//
//  Created by San Byn Nguyen on 17.01.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, Storyboarded {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [FeedModule().build()]
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
