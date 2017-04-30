//
//  RoundTextField.swift
//  VukChat
//
//  Created by Vuk on 4/30/17.
//  Copyright © 2017 Vuk. All rights reserved.
//

import UIKit


@IBDesignable
class RoundTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0 { //ovo nula je samo default vrednost
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0 //sece sve sto je van kruga ostalo
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var bgColor: UIColor? {
        didSet {
            backgroundColor = bgColor
        }
    }

    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            let rawString = attributedPlaceholder?.string != nil ? attributedPlaceholder!.string : ""
            let str = NSAttributedString(string: rawString, attributes: [NSForegroundColorAttributeName : placeholderColor!])
            attributedPlaceholder = str
        }
    }
}
