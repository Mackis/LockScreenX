//
//  LockScreenVC.swift
//  LockScreenX
//
//  Created by Malcolm Kumwenda on 2017/09/15.
//  Copyright © 2017 Byte Orbit. All rights reserved.
//

import UIKit
import SwiftIcons
import SnapKit

class LockScreenVC: UIViewController {
    
    // MARK: - UI Components
    private lazy var bgImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "imgLockScreen")
        return iv
    }()
    
    private lazy var detailContainer: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        return v
    }()
    
    
    // Labels
    private lazy var timeLabel: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = Theme.fonts.futuraMedium(size: 70)
        let date = Date()
        return l
    }()
    
    private lazy var dateLabel: UILabel = {
        let l = UILabel()
        l.textColor = .white
        let dF = DateFormatter()
        dF.dateFormat = "EEEE, dd MMMM"
        let thisDay = dF.string(from: Date())
        l.text = thisDay
        l.font = Theme.fonts.avenirMedium(size: 25)
        return l
    }()
    
    private lazy var eventTitle: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.text = "Apple Special Honouring Steve"
        l.numberOfLines = 0
        l.font = Theme.fonts.avenirBlack(size: 26)
        return l
    }()
    
    private lazy var eventDateLabel: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.text = "Tomorrow at 20:00".uppercased()
        l.numberOfLines = 0
        l.font = Theme.fonts.avenirBlack(size: 16)
        return l
    }()
    
    private lazy var eventDescriptionLabel: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = Theme.fonts.avenirLight(size: 16)
        l.numberOfLines = 0
        l.text = "Apple will unveil the next iPhone. 10 years after the first ever iPhone."
        return l
    }()
    
    private lazy var arrowBtn: UIButton = {
        let b = UIButton()
        b.setIcon(icon: .dripicon(.arrowThinRight), iconSize: 40, color: .white, forState: .normal)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        displayTime()
        Timer.scheduledTimer(timeInterval: 1,
                             target: self,
                             selector: #selector(self.displayTime),
                             userInfo: nil,
                             repeats: true)
    }
    
    func setupView(){
        // Background View
        view.addSubview(bgImageView)
        bgImageView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        // Detail Container View
        view.addSubview(detailContainer)
        detailContainer.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(180)
        }
        
        detailContainer.addSubview(arrowBtn)
        arrowBtn.snp.makeConstraints{ make in
            make.right.equalToSuperview().inset(Theme.inset.double)
            make.width.equalTo(50)
            make.height.equalTo(35)
            make.bottom.equalToSuperview().inset(Theme.inset.double)
        }
        
        detailContainer.addSubview(eventDescriptionLabel)
        eventDescriptionLabel.snp.makeConstraints{ make in
            make.left.equalToSuperview().inset(Theme.inset.triple)
            make.bottom.equalToSuperview().inset(Theme.inset.double)
            make.right.equalTo(arrowBtn.snp.left)
            make.height.equalTo(45)
        }
        
        detailContainer.addSubview(eventTitle)
        eventTitle.snp.makeConstraints{ make in
            make.left.width.equalTo(eventDescriptionLabel)
            make.height.equalTo(80)
            make.bottom.equalTo(eventDescriptionLabel.snp.top)
        }
        
        detailContainer.addSubview(eventDateLabel)
        eventDateLabel.snp.makeConstraints{ make in
            make.left.equalTo(eventTitle)
            make.height.equalTo(20)
            make.right.equalToSuperview()
            make.bottom.equalTo(eventTitle.snp.top)
        }
        
        view.addSubview(timeLabel)
        timeLabel.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(Theme.inset.triple)
            make.left.equalToSuperview().inset(Theme.inset.double)
            make.width.lessThanOrEqualToSuperview()
            make.height.equalTo(80)
        }
        
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints{ make in
            make.top.equalTo(timeLabel.snp.bottom).inset(Theme.inset.single)
            make.left.equalTo(timeLabel).inset(Theme.inset.single)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(40)
        }
    }
    
    // MARK: - Methods
    @objc func displayTime(){
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.hour, .minute], from: Date())
        let hour = components.hour!
        let minute = components.minute!
        timeLabel.text = String("\(hour):\(String(format:"%02d",minute))")
    }
    
}
