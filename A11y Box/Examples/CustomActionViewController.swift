//
//  CustomActionViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class CustomActionViewController: UIViewController {}

class SliderContainer: UIView {

    @IBOutlet weak private var title: UILabel!
    @IBOutlet weak private var slider: UISlider!

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        isAccessibilityElement = true
        accessibilityTraits.update(with: .adjustable)
    }

    // Listing 6-20
    override var accessibilityCustomActions: [UIAccessibilityCustomAction]? {
        set {}
        get {
            return [UIAccessibilityCustomAction(name: "10 travelers") { customAction in
                self.slider.value = 10
                return true
                }]
        }
    }

    override var accessibilityLabel: String? {
        set {}
        get {
            return "Travelers"
        }
    }

    override var accessibilityValue: String? {
        set {}
        get {
            return "\(Int(slider.value))"
        }
    }

    @IBAction
    func sliderValueChanged() {
        let rounded = Int((slider?.value ?? 1) + 0.5)
        slider.value = Float(rounded)
        title.text = "Travelers: \(rounded)"
        UIAccessibility.post(notification: .announcement, argument: "\(rounded)")
    }

    override func accessibilityDecrement() {
        slider.accessibilityDecrement()
    }

    override func accessibilityIncrement() {
        slider.accessibilityIncrement()
    }
}
