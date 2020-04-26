//
//  AccessibilityElementsViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 08/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit
import SwiftUI

class AccessibilityElementsViewController: UIViewController {

    @IBOutlet weak private var hiddenElement: UILabel!
    @IBOutlet weak private var accessibleElement: UILabel!
    @IBOutlet weak private var containerView: UIView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Listing 6-1
        hiddenElement.isAccessibilityElement = false
        accessibleElement.isAccessibilityElement = true

        let swiftUIView = UIHostingController(rootView: SwiftUIElement())
        addChild(swiftUIView)
        swiftUIView.view.frame = containerView.bounds
        containerView.addSubview(swiftUIView.view)
        swiftUIView.didMove(toParent: self)
    }
}
