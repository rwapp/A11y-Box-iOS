//
//  AccessibilityLanguageViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class AccessibilityLanguageViewController: UIViewController {

    @IBOutlet weak private var accessibilityLanguageElement: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Listing 6-15
        accessibilityLanguageElement.accessibilityLanguage = "es-419"
    }
}
