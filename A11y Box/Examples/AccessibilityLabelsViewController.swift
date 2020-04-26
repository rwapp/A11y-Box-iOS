//
//  AccessibilityLabelsViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit
import SwiftUI

class AccessibilityLabelsViewController: UIViewController {

    @IBOutlet weak private var accessibilityLabelElement: UILabel!
    @IBOutlet weak private var containerView: UIView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Listing 6-3
        accessibilityLabelElement.accessibilityLabel = "EXAMPLE.LABELS.ACCESSIBILITY_LABEL".localized()

        let swiftUIView = UIHostingController(rootView: SwiftUILabel())
        addChild(swiftUIView)
        swiftUIView.view.frame = containerView.bounds
        containerView.addSubview(swiftUIView.view)
        swiftUIView.didMove(toParent: self)
    }
}
