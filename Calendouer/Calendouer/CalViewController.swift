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
    
    let monthLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "何月"
        _label.textColor = .white
        _label.textAlignment = .left
        _label.font = DouDefalutFont
        return _label
    }()
    
    let weekdayLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "星期几"
        _label.textColor = .white
        _label.textAlignment = .center
        _label.font = DouDefalutFont
        return _label
    }()
    let weekdayView: UIView = UIView()
    
    let lunarLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "农历今夕何夕"
        _label.textColor = .white
        _label.textAlignment = .right
        _label.font = DouDefalutFont
        _label.sizeToFit()
        return _label
    }()
    
    let dayLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "1"
        _label.textColor = .white
        _label.textAlignment = .center
        _label.font = DouCalendarFont
        _label.sizeToFit()
        return _label
    }()
    
    let cityLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "城市"
        _label.textColor = .white
        _label.textAlignment = .right
        _label.font = DouDefalutFont
        return _label
    }()
    
    let updateTimeLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "更新：更新日期"
        _label.textColor = .white
        _label.textAlignment = .right
        _label.font = DouDefalutFont
        return _label
    }()
    
    let weatherLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "天气，天气"
        _label.textColor = .white
        _label.textAlignment = .left
        _label.font = DouDefalutFont
        return _label
    }()
    
    let degreeLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "温度 | 温度"
        _label.textColor = .white
        _label.textAlignment = .left
        _label.font = DouDefalutFont
        return _label
    }()
    
    let weatherImageView: UIImageView = {
        let _imageView: UIImageView = UIImageView(image: UIImage(named: "cloudy"))
        _imageView.contentMode = .scaleAspectFit
        return _imageView
    }()
    
    var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialView()
        addViews()
        settingLayout()
    }
    
    
    private func initialView() {
        view.backgroundColor = DouBackGray
        
        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.plain)
        tableView.backgroundColor = DouBackGray
        tableView.separatorColor = UIColor.clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: CardTableViewCellId, bundle: nil), forCellReuseIdentifier: CardTableViewCellId)
    }
    
    private func addViews() {
        view.addSubview(bakView)
        bakView.addSubview(monthLabel)
        bakView.addSubview(weekdayView)
        bakView.addSubview(weekdayLabel)
        bakView.addSubview(lunarLabel)
        bakView.addSubview(dayLabel)
        bakView.addSubview(cityLabel)
        bakView.addSubview(weatherLabel)
        bakView.addSubview(degreeLabel)
        bakView.addSubview(updateTimeLabel)
        bakView.addSubview(weatherImageView)
        
        view.addSubview(tableView)
    }
    
    private func settingLayout() {
        bakView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(260)
        }
        monthLabel.snp.makeConstraints { (make) in
            make.left.equalTo(bakView.snp.left).offset(60)
            make.top.equalTo(bakView.snp.top).offset(42)
        }
        lunarLabel.snp.makeConstraints { (make) in
            make.right.equalTo(bakView.snp.right).offset(-60)
            make.centerY.equalTo(monthLabel)
        }
        weekdayView.snp.makeConstraints { (make) in
            make.left.equalTo(monthLabel.snp.right)
            make.right.equalTo(lunarLabel.snp.left)
            make.centerY.equalTo(monthLabel)
            make.height.equalTo(20)
        }
        weekdayLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(weekdayView)
            make.centerY.equalTo(monthLabel)
        }
        dayLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(bakView)
            make.top.equalTo(weekdayLabel.snp.bottom).offset(15)
        }
        cityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dayLabel.snp.bottom)
            make.right.equalTo(dayLabel.snp.left).offset(-13)
        }
        updateTimeLabel.snp.makeConstraints { (make) in
            make.right.equalTo(cityLabel.snp.right)
            make.top.equalTo(cityLabel.snp.bottom).offset(15)
        }
        weatherLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(cityLabel)
            make.left.equalTo(dayLabel.snp.right).offset(13)
        }
        degreeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(updateTimeLabel)
            make.left.equalTo(weatherLabel)
        }
        weatherImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(dayLabel)
            make.height.equalTo(40)
            make.bottom.equalTo(updateTimeLabel.snp.bottom)
        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(bakView.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.bottom.equalTo(view.snp.bottom)
            make.right.equalTo(view.snp.right)
        }
    }
}

extension CalViewController: UITableViewDelegate {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension CalViewController: UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell()
        cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCellId, for: indexPath) as! CardTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
