//
//  MyLabel.swift
//  Layout
//
//  Created by KBryan on 2015-11-11.
//  Copyright © 2015 KBryan. All rights reserved.
//

import UIKit

@IBDesignable
class MyLabel: UILabel {
    
    @IBInspectable var borderColor : CGColor  = UIColor.whiteColor().CGColor {
        didSet {
            self.layer.borderColor = borderColor
        }
        willSet {
            self.layer.borderColor = UIColor.whiteColor().CGColor
        }
    }
    @IBInspectable var borderWidth:CGFloat = 3 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
        willSet {
            self.layer.borderWidth = 2
        }
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
