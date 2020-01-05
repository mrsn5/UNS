//
//  FeedView.swift
//  UNS
//
//  Created by San Byn Nguyen on 28.12.2019.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

class FeedView: UIViewController {
    
    // MARK:- Properties
    let module: FeedModule = FeedModule()
    var presenter: FeedPresenterViewProtocol!
    @IBOutlet weak var feedTable: UITableView!
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.module.build(self)
        self.presenter.start()
    }
}

extension FeedView: FeedViewPresenterProtocol {
    
}


