//
//  CustomTextField.swift
//  BitcoinPricePrediction
//
//  Created by Sara Babaei on 1/26/21.
//  Copyright © 2021 Sara Babaei. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomTextView: UITextView, UITextViewDelegate {
    
    @IBInspectable var placeholder: String? {
        didSet {
            self.text = placeholder
        }
    }
    
    @IBInspectable var placeholderColor: UIColor = Color.gray.componentColor {
        didSet {
            self.textColor = placeholderColor
        }
    }
    
    @IBInspectable var sidePadding: CGFloat = 15 {
        didSet {
            self.textContainerInset = UIEdgeInsets(top: 15, left: sidePadding, bottom: 5, right: sidePadding)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
}

extension UITextView {
    func fetchInput() -> String? {
        if self.textColor != Color.gray.componentColor,
            let caption = self.text?.trimmingCharacters(in: .whitespaces) {
            return caption.count > 0 ? caption : nil
        }
        return nil
    }
}
