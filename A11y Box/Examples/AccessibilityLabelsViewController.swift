//
//  AccessibilityLabelsViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class AccessibilityLabelsViewController: UIViewController {

    @IBOutlet weak private var accessibilityLabelElement: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Listing 6-3
        accessibilityLabelElement.accessibilityLabel = "EXAMPLE.LABELS.ACCESSIBILITY_LABEL".localized()
    }
}
