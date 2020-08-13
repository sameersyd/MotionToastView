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
        let bundle = Bundle(for: MTPale.self)
        let viewFromXib = bundle.loadNibNamed("MTPale", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    
    func setupViews(toastType: ToastType) {
        let bundle = Bundle(for: type(of: self))
        switch toastType {
            case .success:
                headLabel.text = "Success"
                circleImg.image = UIImage(named: "success_icon_white", in: bundle, compatibleWith: nil)!
                sideBarView.backgroundColor = UIColor(hex: "6FCF97")
                circleView.backgroundColor = UIColor(hex: "6FCF97")
                toastView.backgroundColor = UIColor(named: "alpha_green_dark", in: bundle, compatibleWith: nil)!
                break
            case .error:
                headLabel.text = "Error"
                circleImg.image = UIImage(named: "error_icon_white", in: bundle, compatibleWith: nil)!
                sideBarView.backgroundColor = UIColor(hex: "EB5757")
                circleView.backgroundColor = UIColor(hex: "EB5757")
                toastView.backgroundColor = UIColor(named: "alpha_red_dark", in: bundle, compatibleWith: nil)!
                break
            case .warning:
                headLabel.text = "Warning"
                circleImg.image = UIImage(named: "warning_icon_white", in: bundle, compatibleWith: nil)!
                sideBarView.backgroundColor = UIColor(hex: "F2C94C")
                circleView.backgroundColor = UIColor(hex: "F2C94C")
                toastView.backgroundColor = UIColor(named: "alpha_yellow_dark", in: bundle, compatibleWith: nil)!
                break
            case .info:
                headLabel.text = "Info"
                circleImg.image = UIImage(named: "info_icon_white", in: bundle, compatibleWith: nil)!
                sideBarView.backgroundColor = UIColor(hex: "2F80ED")
                circleView.backgroundColor = UIColor(hex: "2F80ED")
                toastView.backgroundColor = UIColor(named: "alpha_blue_dark", in: bundle, compatibleWith: nil)!
                break
        }
    }
}
