//
//  TabBarVC.swift
//  Al Akeel
//
//  Created by Mohamed on 9/28/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    @IBOutlet weak var TabBarr: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        TabBarr.layer.cornerRadius = 18
        TabBarr.clipsToBounds = true
        TabBarr.layer.masksToBounds = true
    }
    

  

}
