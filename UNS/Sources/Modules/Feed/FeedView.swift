//
//  FeedView.swift
//  UNS
//
//  Created by San Byn Nguyen on 28.12.2019.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

class FeedView: UIViewController {
    var presenter: FeedPresenterViewProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.start()
    }
}


