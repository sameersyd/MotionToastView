//
//  MotionToastView.swift
//  MotionToast
//
//  Created by Sameer Nawaz on 10/08/20.
//  Copyright © 2020 Femargent Inc. All rights reserved.
//

import UIKit

class MTVibrant: UIView {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var circleImg: UIImageView!
    @IBOutlet weak var toastView: UIView!
    @IBOutlet weak var circleView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        circleView.layer.cornerRadius = circleView.bounds.size.width/2
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let bundle = Bundle(for: MTVibrant.self)
        let viewFromXib = bundle.loadNibNamed("MTVibrant", owner: self, options: nil)![0] as! UIView
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
                headLabel.textColor = loadColor(name: "white_green")
                circleImg.image = loadImage(name: "success_icon")
                toastView.backgroundColor = loadColor(name: "green_dark")
                break
            case .error:
                headLabel.text = "Error"
                headLabel.textColor = loadColor(name: "white_red")
                circleImg.image = loadImage(name: "error_icon")
                toastView.backgroundColor = loadColor(name: "red_dark")
                break
            case .warning:
                headLabel.text = "Warning"
                headLabel.textColor = loadColor(name: "white_yellow")
                circleImg.image = loadImage(name: "warning_icon")
                toastView.backgroundColor = loadColor(name: "yellow_dark")
                break
            case .info:
                headLabel.text = "Info"
                headLabel.textColor = loadColor(name: "white_blue")
                circleImg.image = loadImage(name: "info_icon")
                toastView.backgroundColor = loadColor(name: "blue_dark")
                break
        }
    }
    
    func loadImage(name: String) -> UIImage? {
        let podBundle = Bundle(for: MTVibrant.self)
        if let url = podBundle.url(forResource: "MotionToastView", withExtension: "bundle") {
            let bundle = Bundle(url: url)
            return UIImage(named: name, in: bundle, compatibleWith: nil)
        }
        return nil
    }
    
    func loadColor(name: String) -> UIColor? {
        let podBundle = Bundle(for: MTVibrant.self)
        if let url = podBundle.url(forResource: "MotionToastView", withExtension: "bundle") {
            let bundle = Bundle(url: url)
            return UIColor(named: name, in: bundle, compatibleWith: nil)
        }
        return nil
    }
}
