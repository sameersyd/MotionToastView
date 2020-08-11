//
//  Extension.swift
//  MotionToast
//
//  Created by Sameer Nawaz on 10/08/20.
//  Copyright © 2020 Femargent Inc. All rights reserved.
//

import UIKit

public enum ToastType {
    case success
    case error
    case warning
    case info
}

public enum ToastDuration {
    case short
    case long
}

public enum ToastGravity {
    case top
    case centre
    case bottom
}

public enum ToastStyle {
    case style_vibrant
    case style_pale
}

extension UIViewController {
    
    public func MotionToast(message: String, toastType: ToastType, duration: ToastDuration? = .short, toastStyle: ToastStyle? = .style_vibrant, toastGravity: ToastGravity? = .bottom, toastCornerRadius: Int? = 0) {
        
        guard let window = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene})
                                .compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first else { return }
        
        var toastDuration = 2.0
        switch duration {
            case .short: toastDuration = 2.0;break
            case .long: toastDuration = 4.0;break
            case .none: break
        }
        
        var toastView: UIView?
        switch toastStyle {
            case .style_vibrant: toastView = toastStyle_vibrant(message: message, toastType: toastType, toastGravity: toastGravity!, toastCornerRadius: toastCornerRadius!, view: view);break
            case .style_pale: toastView = toastStyle_pale(message: message, toastType: toastType, toastGravity: toastGravity!, view: view);break
            case .none: break
        }
        
        window.addSubview(toastView!)
        
        UIView.animate(withDuration: 1.0, delay: toastDuration, animations: {
            toastView!.alpha = 0
        }) { (_) in
            toastView!.removeFromSuperview()
        }
    }
}

func toastStyle_vibrant(message: String, toastType: ToastType, toastGravity: ToastGravity, toastCornerRadius: Int, view: UIView) -> MTVibrant {
    
    var gravity = CGRect(x: 0.0, y: view.frame.height - 130.0, width: view.frame.width, height: 83.0)
    
    switch toastGravity {
        case .top: gravity = CGRect(x: 0.0, y: 80.0, width: view.frame.width, height: 83.0);break
        case .centre: gravity = CGRect(x: 0.0, y: ((view.frame.height / 2) - 41) , width: view.frame.width, height: 83.0);break
        case .bottom: gravity = CGRect(x: 0.0, y: view.frame.height - 130.0, width: view.frame.width, height: 83.0);break
    }
    
    let toastView = MTVibrant(frame: gravity)
    
    switch toastType {
        case .success:
            toastView.headLabel.text = "Success"
            toastView.headLabel.textColor = UIColor(named: "white_green")
            toastView.circleImg.image = UIImage(named: "success_icon")
            toastView.toastView.backgroundColor = UIColor(named: "green_dark")
            break
        case .error:
            toastView.headLabel.text = "Error"
            toastView.headLabel.textColor = UIColor(named: "white_red")
            toastView.circleImg.image = UIImage(named: "error_icon")
            toastView.toastView.backgroundColor = UIColor(named: "red_dark")
            break
        case .warning:
            toastView.headLabel.text = "Warning"
            toastView.headLabel.textColor = UIColor(named: "white_yellow")
            toastView.circleImg.image = UIImage(named: "warning_icon")
            toastView.toastView.backgroundColor = UIColor(named: "yellow_dark")
            break
        case .info:
            toastView.headLabel.text = "Info"
            toastView.headLabel.textColor = UIColor(named: "white_blue")
            toastView.circleImg.image = UIImage(named: "info_icon")
            toastView.toastView.backgroundColor = UIColor(named: "blue_dark")
            break
    }
    
    toastView.msgLabel.text = message
    toastView.toastView.layer.cornerRadius = CGFloat(toastCornerRadius)
    
    return toastView
}

func toastStyle_pale(message: String, toastType: ToastType, toastGravity: ToastGravity, view: UIView) -> MTPale {
    
    var gravity = CGRect(x: 0.0, y: view.frame.height - 130.0, width: view.frame.width, height: 83.0)
    
    switch toastGravity {
        case .top: gravity = CGRect(x: 0.0, y: 80.0, width: view.frame.width, height: 83.0);break
        case .centre: gravity = CGRect(x: 0.0, y: ((view.frame.height / 2) - 41) , width: view.frame.width, height: 83.0);break
        case .bottom: gravity = CGRect(x: 0.0, y: view.frame.height - 130.0, width: view.frame.width, height: 83.0);break
    }
    
    let toastView = MTPale(frame: gravity)
    
    switch toastType {
        case .success:
            toastView.headLabel.text = "Success"
            toastView.circleImg.image = UIImage(named: "success_icon_white")
            toastView.sideBarView.backgroundColor = UIColor(hex: "6FCF97")
            toastView.circleView.backgroundColor = UIColor(hex: "6FCF97")
            toastView.toastView.backgroundColor = UIColor(named: "alpha_green_dark")
            break
        case .error:
            toastView.headLabel.text = "Error"
            toastView.circleImg.image = UIImage(named: "error_icon_white")
            toastView.sideBarView.backgroundColor = UIColor(hex: "EB5757")
            toastView.circleView.backgroundColor = UIColor(hex: "EB5757")
            toastView.toastView.backgroundColor = UIColor(named: "alpha_red_dark")
            break
        case .warning:
            toastView.headLabel.text = "Warning"
            toastView.circleImg.image = UIImage(named: "warning_icon_white")
            toastView.sideBarView.backgroundColor = UIColor(hex: "F2C94C")
            toastView.circleView.backgroundColor = UIColor(hex: "F2C94C")
            toastView.toastView.backgroundColor = UIColor(named: "alpha_yellow_dark")
            break
        case .info:
            toastView.headLabel.text = "Info"
            toastView.circleImg.image = UIImage(named: "info_icon_white")
            toastView.sideBarView.backgroundColor = UIColor(hex: "2F80ED")
            toastView.circleView.backgroundColor = UIColor(hex: "2F80ED")
            toastView.toastView.backgroundColor = UIColor(named: "alpha_blue_dark")
            break
    }
    
    toastView.msgLabel.text = message
    
    return toastView
}

func bundledImage(named: String, view: UIView) -> UIImage? {
    let image = UIImage(named: named)
    if image == nil {
        return UIImage(named: named, inBundle: Bundle(forClass: MyBasePodClass.classForCoder()), compatibleWithTraitCollection: nil)
    } // Replace MyBasePodClass with yours
    return image
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
