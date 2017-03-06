//
//  AppDefault.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/2.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red:   r / 255.0,
                   green: g / 255.0,
                   blue:  b / 255.0,
                   alpha: a)
}


extension UIColor {
    convenience init(value: UInt, alpha: CGFloat) {
        self.init (
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}

// Color
let DouGreen: UIColor = UIColor(value: 0x4CAF50, alpha: 1)
let DouDarkGreen: UIColor = UIColor(value: 0x388E3C, alpha: 1)
let DouCardTextGray: UIColor = RGBA(r: 122, g: 122, b: 122, a: 1)
let DouBackGray: UIColor = UIColor(value: 0xFAFAFA, alpha: 1)

// Font
let DouDefalutFontName: String = ".PingFangSC-Medium"
let DouIncFontName: String = ".PingFangSC-Regular"
let DouCalendarFontName: String = "Arial-BoldMT"
let DouDefalutFont: UIFont = UIFont(name: DouDefalutFontName, size: 15)!
let DouIncFont: UIFont = UIFont(name: DouIncFontName, size: 14)!
let DouCalendarFont: UIFont = UIFont(name: DouCalendarFontName, size: 90)!

// Identity
let CardTableViewCellId: String = "CardTableViewCell"
