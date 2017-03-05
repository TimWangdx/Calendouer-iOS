//
//  TabViewController.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/5.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit
import SwipeableTabBarController

class TabViewController: SwipeableTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedViewController = viewControllers?[0]
    }
}
