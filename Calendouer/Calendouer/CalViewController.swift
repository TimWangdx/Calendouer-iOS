//
// CalViewController.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/2.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit
import SnapKit


class CalViewController: UIViewController {
    
    let bakView: UIView = {
        let bakView: UIView = UIView()
        bakView.backgroundColor = RGBA(r: 76, g: 175, b: 80, a: 1)
        return bakView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialView()
        addViews()
        settingLayout()
    }
    
    private func initialView() {
        
    }
    
    private func addViews() {
        view.addSubview(bakView)
    }
    
    private func settingLayout() {
        bakView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(260)
        }
    }
}

