//
//  AccessibilityHiddenViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class AccessibilityHiddenViewController: UIViewController {

    @IBOutlet weak private var hiddenElement: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Listing 6-16
        hiddenElement.isAccessibilityElement = false
    }
}
