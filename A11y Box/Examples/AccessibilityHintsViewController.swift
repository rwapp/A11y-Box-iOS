//
//  AccessibilityHintsViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit
import SwiftUI

class AccessibilityHintsViewController: UIViewController {

    @IBOutlet weak private var accessibilityHintElement: UILabel!
    @IBOutlet weak private var containerView: UIView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Listing 6-7
        accessibilityHintElement.accessibilityHint = "EXAMPLE.HINTS.HINT".localized()

        let swiftUIView = UIHostingController(rootView: SwiftUIHint())
        addChild(swiftUIView)
        swiftUIView.view.frame = containerView.bounds
        containerView.addSubview(swiftUIView.view)
        swiftUIView.didMove(toParent: self)
    }
}
