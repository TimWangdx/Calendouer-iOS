//
//  CardTableViewCell.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/6.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var incLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialView()
    }
    
    private func initialView() {
        self.backgroundColor = UIColor.clear
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 3
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowRadius = 3
        cardView.layer.shadowOffset = CGSize(width: 1, height: 1)
        cardView.clipsToBounds = false
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
