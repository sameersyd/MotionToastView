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
    
    public func MotionToast(message: String, toastType: ToastType, duration: ToastDuration? = .short, toastStyle: ToastStyle? = .style_vibrant, toastGravity: ToastGravity? = .bottom, toastCornerRadius: Int? = 0, pulseEffect: Bool? = true) {
        
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
            case .style_vibrant: toastView = toastStyle_vibrant(message: message, toastType: toastType, toastGravity: toastGravity!, toastCornerRadius: toastCornerRadius!, view: view, pulseEffect: pulseEffect!);break
            case .style_pale: toastView = toastStyle_pale(message: message, toastType: toastType, toastGravity: toastGravity!, view: view, pulseEffect: pulseEffect!);break
            case .none: break
        }
        
        window.addSubview(toastView!)
        
        UIView.animate(withDuration: 1.0, delay: toastDuration, animations: {
            toastView!.alpha = 0
        }) { (_) in
            toastView!.removeFromSuperview()
        }
    }
    
    public func MotionToast_Customisation(header: String, message: String, headerColor: UIColor, messageColor: UIColor,
                                          primary_color: UIColor, secondary_color: UIColor, icon_image: UIImage,
                                          duration: ToastDuration? = .short, toastStyle: ToastStyle? = .style_vibrant,
                                          toastGravity: ToastGravity? = .bottom, toastCornerRadius: Int? = 0, pulseEffect: Bool? = true) {
        
        guard let window = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene})
                                .compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first else { return }
        
        var toastDuration = 2.0
        switch duration {
            case .short: toastDuration = 2.0;break
            case .long: toastDuration = 4.0;break
            case .none: break
        }
        
        var toastUIView: UIView?
        switch toastStyle {
            case .style_vibrant:
                
                var gravity = CGRect(x: 0.0, y: view.frame.height - 130.0, width: view.frame.width, height: 83.0)
                switch toastGravity! {
                    case .top: gravity = CGRect(x: 0.0, y: 80.0, width: view.frame.width, height: 83.0);break
                    case .centre: gravity = CGRect(x: 0.0, y: ((view.frame.height / 2) - 41) , width: view.frame.width, height: 83.0);break
                    case .bottom: gravity = CGRect(x: 0.0, y: view.frame.height - 130.0, width: view.frame.width, height: 83.0);break
                }
                
                let toastView = MTVibrant(frame: gravity)
                if pulseEffect! { toastView.addPulseEffect() }
                toastView.toastView.layer.cornerRadius = CGFloat(toastCornerRadius!)
                
                toastView.headLabel.text = header
                toastView.headLabel.textColor = headerColor
                toastView.msgLabel.text = message
                toastView.msgLabel.textColor = messageColor
                toastView.circleImg.image = icon_image
                toastView.toastView.backgroundColor = primary_color
                toastView.circleView.backgroundColor = secondary_color
                toastUIView = toastView
                break
            
            case .style_pale:
                
                var gravity = CGRect(x: 0.0, y: view.frame.height - 130.0, width: view.frame.width, height: 83.0)
                switch toastGravity! {
                    case .top: gravity = CGRect(x: 0.0, y: 80.0, width: view.frame.width, height: 83.0);break
                    case .centre: gravity = CGRect(x: 0.0, y: ((view.frame.height / 2) - 41) , width: view.frame.width, height: 83.0);break
                    case .bottom: gravity = CGRect(x: 0.0, y: view.frame.height - 130.0, width: view.frame.width, height: 83.0);break
                }
                
                let toastView = MTPale(frame: gravity)
                if pulseEffect! { toastView.addPulseEffect() }
                toastView.toastView.layer.cornerRadius = CGFloat(toastCornerRadius!)
                
                toastView.headLabel.text = header
                toastView.headLabel.textColor = headerColor
                toastView.msgLabel.text = message
                toastView.msgLabel.textColor = messageColor
                toastView.circleImg.image = icon_image
                toastView.toastView.backgroundColor = primary_color
                toastView.circleView.backgroundColor = secondary_color
                toastView.sideBarView.backgroundColor = secondary_color
                toastUIView = toastView
                break
            case .none: break
        }
        
        window.addSubview(toastUIView!)
        
        UIView.animate(withDuration: 1.0, delay: toastDuration, animations: {
            toastUIView!.alpha = 0
        }) { (_) in
            toastUIView!.removeFromSuperview()
        }
    }
}

func toastStyle_vibrant(message: String, toastType: ToastType, toastGravity: ToastGravity, toastCornerRadius: Int, view: UIView, pulseEffect: Bool) -> MTVibrant {
    
    var gravity = CGRect(x: 0.0, y: view.frame.height - 130.0, width: view.frame.width, height: 83.0)
    switch toastGravity {
        case .top: gravity = CGRect(x: 0.0, y: 80.0, width: view.frame.width, height: 83.0);break
        case .centre: gravity = CGRect(x: 0.0, y: ((view.frame.height / 2) - 41) , width: view.frame.width, height: 83.0);break
        case .bottom: gravity = CGRect(x: 0.0, y: view.frame.height - 130.0, width: view.frame.width, height: 83.0);break
    }
    
    let toastView = MTVibrant(frame: gravity)
    toastView.setupViews(toastType: toastType)
    if pulseEffect { toastView.addPulseEffect() }
    toastView.msgLabel.text = message
    toastView.toastView.layer.cornerRadius = CGFloat(toastCornerRadius)
    return toastView
}

func toastStyle_pale(message: String, toastType: ToastType, toastGravity: ToastGravity, view: UIView, pulseEffect: Bool) -> MTPale {
    
    var gravity = CGRect(x: 0.0, y: view.frame.height - 130.0, width: view.frame.width, height: 83.0)
    switch toastGravity {
        case .top: gravity = CGRect(x: 0.0, y: 80.0, width: view.frame.width, height: 83.0);break
        case .centre: gravity = CGRect(x: 0.0, y: ((view.frame.height / 2) - 41) , width: view.frame.width, height: 83.0);break
        case .bottom: gravity = CGRect(x: 0.0, y: view.frame.height - 130.0, width: view.frame.width, height: 83.0);break
    }
    
    let toastView = MTPale(frame: gravity)
    toastView.setupViews(toastType: toastType)
    if pulseEffect { toastView.addPulseEffect() }
    toastView.msgLabel.text = message
    return toastView
}
