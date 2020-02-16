//
//  AccessibilityHintsViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class AccessibilityHintsViewController: UIViewController {

    @IBOutlet weak private var accessibilityHintElement: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Listing 6-7
        accessibilityHintElement.accessibilityHint = "EXAMPLE.HINTS.HINT".localized()
    }
}
