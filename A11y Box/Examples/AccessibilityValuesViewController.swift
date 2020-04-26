//
//  AccessibilityValuesViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit
import SwiftUI

class AccessibilityValuesViewController: UIViewController {

    @IBOutlet weak private var accessibilityValueElement: UILabel!
    @IBOutlet weak private var containerView: UIView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Listing 6-5
        accessibilityValueElement.accessibilityValue = "100"

        let swiftUIView = UIHostingController(rootView: SwiftUIValue())
        addChild(swiftUIView)
        swiftUIView.view.frame = containerView.bounds
        containerView.addSubview(swiftUIView.view)
        swiftUIView.didMove(toParent: self)
    }

}
