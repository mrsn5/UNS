//
//  FeedView.swift
//  UNS
//
//  Created by San Byn Nguyen on 28.12.2019.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit
import os.log

class FeedView: UIViewController, ViewProtocol, Storyboarded {
    
    // MARK:- Properties
    var presenter: FeedPresenterViewProtocol!
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        os_log("FeedView.viewDidLoad()", log: .lifecycle, type: .info)
        super.viewDidLoad()
        self.presenter.start()
        self.view.backgroundColor = UIColor.blue
    }
    
}

extension FeedView: FeedViewPresenterProtocol {
    func setup() {
        
    }
}


