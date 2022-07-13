//
//  InsetTextField.swift
//  mingle
//
//  Created by Jong on 2022/07/11.
//

import UIKit

class InsetTextField: UITextField {
    var insetX: CGFloat = 6 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    var insetY: CGFloat = 6 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX , dy: insetY)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX , dy: insetY)
    }
}
