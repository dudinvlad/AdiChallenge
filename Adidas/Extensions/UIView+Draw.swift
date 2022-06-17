//
//  UIView+Draw.swift
//  Adidas
//
//  Created by Vladislav Dudin on 16.06.2022.
//

import Foundation
import UIKit

extension UIView {
    func cornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
