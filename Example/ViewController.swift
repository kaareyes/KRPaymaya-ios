//
//  ViewController.swift
//  Example
//
//  Created by Amiel Reyes on 10/9/19.
//  Copyright © 2019 AmielReyes. All rights reserved.
//

import UIKit
import krPayMaya

class ViewController: UIViewController {
    @IBOutlet weak var checkoutAction: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func checkOut(_ sender: Any) {
        PayMayaSDK.shared.showCreditCardInput()
    }
    
}

