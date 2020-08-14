//
//  ViewController.swift
//  MotionToastView
//
//  Created by sameersyd on 08/11/2020.
//  Copyright (c) 2020 sameersyd. All rights reserved.
//

import UIKit
import MotionToastView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func successButt(_ sender: UIButton) {
        MotionToast(message: "You have successfully completed the trip", toastType: .success)
    }
    
    @IBAction func errorButt(_ sender: UIButton) {
        MotionToast(message: "You have failed to complete the trip", toastType: .error, toastCornerRadius: 12)
    }
    
    @IBAction func warningButt(_ sender: UIButton) {
        MotionToast(message: "You are not in the location. Try again", toastType: .warning, duration: .long, toastStyle: .style_pale, toastGravity: .centre, pulseEffect: false)
    }
    
    @IBAction func infoButt(_ sender: UIButton) {
        MotionToast(message: "You have failed to complete the trip", toastType: .info, duration: .long, toastStyle: .style_pale, toastGravity: .top)
    }
    
    @IBAction func customToastButt(_ sender: UIButton) {
        MotionToast_Customisation(header: "Custom Toast", message: "It gives you more customisation options.",
                                  headerColor: UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0),
                                  messageColor: UIColor(red: 239.0, green: 239.0, blue: 239.0, alpha: 0.7),
                                  primary_color: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5),
                                  secondary_color: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0),
                                  icon_image: UIImage(named: "apple")!, duration: .long, toastStyle: .style_pale,
                                  toastGravity: .bottom, toastCornerRadius: 12, pulseEffect: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

