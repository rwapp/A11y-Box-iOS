//
//  AccessibilityElementsViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 08/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class AccessibilityElementsViewController: UIViewController {

    @IBOutlet weak private var hiddenElement: UILabel!
    @IBOutlet weak private var accessibleElement: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Listing 6-1
        hiddenElement.isAccessibilityElement = false
        accessibleElement.isAccessibilityElement = true
    }
}
