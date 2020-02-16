//
//  AccessibilityValuesViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class AccessibilityValuesViewController: UIViewController {

    @IBOutlet weak private var accessibilityValueElement: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Listing 6-5
        accessibilityValueElement.accessibilityValue = "100"
    }

}
