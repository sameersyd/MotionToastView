//
//  MTPale.swift
//  MotionToast
//
//  Created by Sameer Nawaz on 10/08/20.
//  Copyright © 2020 Femargent Inc. All rights reserved.
//

import UIKit

class MTPale: UIView {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var circleImg: UIImageView!
    @IBOutlet weak var toastView: UIView!
    @IBOutlet weak var sideBarView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        sideBarView.layer.cornerRadius = 3
        toastView.layer.cornerRadius = 12
        circleView.layer.cornerRadius = circleView.bounds.size.width/2
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let bundle = Bundle(for: MTPale.self)
        let viewFromXib = bundle.loadNibNamed("MTPale", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    
    func addPulseEffect() {
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.duration = 1
        pulseAnimation.fromValue = 0.7
        pulseAnimation.toValue = 1
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .greatestFiniteMagnitude
        circleImg.layer.add(pulseAnimation, forKey: "animateOpacity")
    }
    
    func setupViews(toastType: ToastType) {
        switch toastType {
            case .success:
                headLabel.text = "Success"
                circleImg.image = loadImage(name: "success_icon_white")
                sideBarView.backgroundColor = UIColor(red: 242.0, green: 201.0, blue: 76.0, alpha: 1.0)
                circleView.backgroundColor = UIColor(red: 242.0, green: 201.0, blue: 76.0, alpha: 1.0)
                toastView.backgroundColor = loadColor(name: "alpha_green_dark")
                break
            case .error:
                headLabel.text = "Error"
                circleImg.image = loadImage(name: "error_icon_white")
                sideBarView.backgroundColor = UIColor(red: 235.0, green: 87.0, blue: 87.0, alpha: 1.0)
                circleView.backgroundColor = UIColor(red: 235.0, green: 87.0, blue: 87.0, alpha: 1.0)
                toastView.backgroundColor = loadColor(name: "alpha_red_dark")
                break
            case .warning:
                headLabel.text = "Warning"
                circleImg.image = loadImage(name: "warning_icon_white")
                sideBarView.backgroundColor = UIColor(red: 242.0, green: 201.0, blue: 76.0, alpha: 1.0)
                circleView.backgroundColor = UIColor(red: 242.0, green: 201.0, blue: 76.0, alpha: 1.0)
                toastView.backgroundColor = loadColor(name: "alpha_yellow_dark")
                break
            case .info:
                headLabel.text = "Info"
                circleImg.image = loadImage(name: "info_icon_white")
                sideBarView.backgroundColor = UIColor(red: 47.0, green: 128.0, blue: 237.0, alpha: 1.0)
                circleView.backgroundColor = UIColor(red: 47.0, green: 128.0, blue: 237.0, alpha: 1.0)
                toastView.backgroundColor = loadColor(name: "alpha_blue_dark")
                break
        }
    }
    
    func loadImage(name: String) -> UIImage? {
        let podBundle = Bundle(for: MTPale.self)
        if let url = podBundle.url(forResource: "MotionToastView", withExtension: "bundle") {
            let bundle = Bundle(url: url)
            return UIImage(named: name, in: bundle, compatibleWith: nil)
        }
        return nil
    }
    
    func loadColor(name: String) -> UIColor? {
        let podBundle = Bundle(for: MTPale.self)
        if let url = podBundle.url(forResource: "MotionToastView", withExtension: "bundle") {
            let bundle = Bundle(url: url)
            return UIColor(named: name, in: bundle, compatibleWith: nil)
        }
        return nil
    }
}
