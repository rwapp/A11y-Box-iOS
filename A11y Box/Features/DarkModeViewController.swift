//
//  DarkModeViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 22/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class DarkModeViewController: UIViewController {

    @IBOutlet weak private var darkModeStatusLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Listing 8-27
        let darkMode = traitCollection.userInterfaceStyle
        // Returns light, dark, or unspecified as an enum value.

        if darkMode == .dark {
            darkModeStatusLabel.text = "FEATURE.DARK_MODE.ENABLED".localized()
        } else {
            darkModeStatusLabel.text = "FEATURE.DARK_MODE.DISABLED".localized()
        }
    }
}
