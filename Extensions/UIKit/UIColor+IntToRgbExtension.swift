//
//  UIColor+IntToRgbExtension.swift
//  RBCoreDataStack
//
//  Created by Rahmi on 15.12.2018.
//  Copyright © 2018 rbozdag. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    public convenience init<T>(rgbValue: T, alpha: CGFloat = 1) where T: BinaryInteger {
        guard rgbValue > 0 else {
            self.init(red: 0, green: 0, blue: 0, alpha: alpha)
            return
        }

        guard rgbValue < 0xFFFFFF else {
            self.init(red: 1, green: 1, blue: 1, alpha: alpha)
            return
        }

        let r: CGFloat = CGFloat(((rgbValue & 0xFF0000) >> 16) / 0xFF)
        let g: CGFloat = CGFloat((rgbValue & 0x00FF00) >> 8 / 0xFF)
        let b: CGFloat = CGFloat((rgbValue & 0x0000FF) / 0xFF)
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
