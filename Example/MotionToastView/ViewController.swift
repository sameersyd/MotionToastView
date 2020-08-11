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
        MotionToast(message: "You are not in the location. Try again", toastType: .warning, duration: .long, toastStyle: .style_pale, toastGravity: .centre)
    }
    
    @IBAction func infoButt(_ sender: UIButton) {
        MotionToast(message: "You have failed to complete the trip", toastType: .info, duration: .long, toastStyle: .style_pale, toastGravity: .top)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

