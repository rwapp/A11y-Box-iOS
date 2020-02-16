//
//  AccessibilityFocusViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class AccessibilityFocusViewController: UIViewController {}

class FocusButton: Button {

    // Listing 6-21
    override func accessibilityElementDidBecomeFocused() {
        setTitle("Focussed", for: .normal)
    }

    override func accessibilityElementDidLoseFocus() {
        setTitle("Not Focussed", for: .normal)
    }
}
