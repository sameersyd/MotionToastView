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
        
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.duration = 1
        pulseAnimation.fromValue = 0.7
        pulseAnimation.toValue = 1
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .greatestFiniteMagnitude
        circleImg.layer.add(pulseAnimation, forKey: "animateOpacity")
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
    
    func setupViews(toastType: ToastType) {
        let bundle = Bundle(for: type(of: self))
        switch toastType {
            case .success:
                headLabel.text = "Success"
                headLabel.textColor = UIColor(named: "white_green", in: bundle, compatibleWith: nil)!
                circleImg.image = loadImage(name: "success_icon")
                toastView.backgroundColor = UIColor(named: "green_dark", in: bundle, compatibleWith: nil)!
                break
            case .error:
                headLabel.text = "Error"
                headLabel.textColor = UIColor(named: "white_red", in: bundle, compatibleWith: nil)!
                circleImg.image = loadImage(name: "error_icon")
                toastView.backgroundColor = UIColor(named: "red_dark", in: bundle, compatibleWith: nil)!
                break
            case .warning:
                headLabel.text = "Warning"
                headLabel.textColor = UIColor(named: "white_yellow", in: bundle, compatibleWith: nil)!
                circleImg.image = loadImage(name: "warning_icon")
                toastView.backgroundColor = UIColor(named: "yellow_dark", in: bundle, compatibleWith: nil)!
                break
            case .info:
                headLabel.text = "Info"
                headLabel.textColor = UIColor(named: "white_blue", in: bundle, compatibleWith: nil)!
                circleImg.image = loadImage(name: "info_icon")
                toastView.backgroundColor = UIColor(named: "blue_dark", in: bundle, compatibleWith: nil)!
                break
        }
    }
    
    func loadImage(name: String) -> UIImage? {
        let podBundle = Bundle(for: MTVibrant.self)
        if let url = podBundle.url(forResource: "MotionToastView", withExtension: "bundle") {
            let bundle = Bundle(url: url)
            return UIImage(named: name, in: bundle, compatibleWith: nil)
        }
        print("MotionToastView")
        return nil
    }
}
