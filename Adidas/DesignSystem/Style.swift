//
//  Style.swift
//  Adidas
//
//  Created by Vladislav Dudin on 15.06.2022.
//

//import Foundation

import UIKit

enum Style {
    // MARK: - Label -
    enum Label {
        struct ColoredLabel: Applicable {
            var titleColor: UIColor
            var font: UIFont
            var numberOfLines: Int = 1
            var textAlignment: NSTextAlignment = .left

            func apply(_ object: UILabel) {
                object.textColor = titleColor
                object.font = font
                object.numberOfLines = numberOfLines
                object.textAlignment = textAlignment
            }
        }
    }

    // MARK: - Stack -
    enum Stack {
        struct DefaulStack: Applicable {
            let spacing: CGFloat
            let axis: NSLayoutConstraint.Axis
            var alignment: UIStackView.Alignment = .fill
            var distribution: UIStackView.Distribution = .fill

            func apply(_ object: UIStackView) {
                object.spacing = spacing
                object.alignment = alignment
                object.distribution = distribution
                object.axis = axis
            }
        }
    }

    // MARK: - TextField -
    enum TextField {
        struct ColoredTextField: Applicable {
            let color: UIColor
            let font: UIFont
            var borderColor: UIColor?

            func apply(_ object: UITextField) {
                object.borderStyle = .none
                object.textColor = color
                object.font = font

                if let borderColor = self.borderColor {
                    object.layer.borderColor = borderColor.cgColor
                    object.layer.borderWidth = 1
                }
            }
        }
    }

    // MARK: - Font -
    enum Font {
        static let system14: UIFont = .systemFont(ofSize: 14)
    }
}
