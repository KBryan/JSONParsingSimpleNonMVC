//
//  ViewController.swift
//  Layout
//
//  Created by KBryan on 2015-11-11.
//  Copyright © 2015 KBryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myFunkyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myFunkyLabel.layer.borderWidth = 3
        self.myFunkyLabel.layer.borderColor = UIColor.whiteColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

