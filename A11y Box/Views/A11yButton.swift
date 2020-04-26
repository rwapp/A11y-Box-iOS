//
//  Button.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class A11yButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()

        setTitleColor(UIColor.white, for: .normal)
        titleLabel?.textAlignment = .center

        // Listing 8-14
        titleLabel?.adjustsFontForContentSizeCategory = true
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel?.numberOfLines = 0

        backgroundColor = UIColor(named: "highlight")

        layer.cornerRadius = 8.0
        clipsToBounds = true

        let labelPaddingBottom = NSLayoutConstraint(item: titleLabel as Any,
                                                    attribute: .bottom,
                                                    relatedBy: .equal,
                                                    toItem: self,
                                                    attribute: .bottom,
                                                    multiplier: 1,
                                                    constant: 4)
        addConstraint(labelPaddingBottom)

        let labelPaddingRight = NSLayoutConstraint(item: titleLabel as Any,
                                                   attribute: .right,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .right,
                                                   multiplier: 1,
                                                   constant: 4)
        addConstraint(labelPaddingRight)

        let labelPaddingTop = NSLayoutConstraint(item: titleLabel as Any,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: self,
                                                 attribute: .top,
                                                 multiplier: 1,
                                                 constant: 4)
        addConstraint(labelPaddingTop)

        let labelPaddingLeft = NSLayoutConstraint(item: titleLabel as Any,
                                                    attribute: .left,
                                                    relatedBy: .equal,
                                                    toItem: self,
                                                    attribute: .left,
                                                    multiplier: 1,
                                                    constant: 4)
        addConstraint(labelPaddingLeft)

        let heightConstraint = NSLayoutConstraint(item: self,
                                                  attribute: .height,
                                                  relatedBy: .greaterThanOrEqual,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: 44.0)
        addConstraint(heightConstraint)

        setNeedsLayout()
    }
}
