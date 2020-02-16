//
//  DarkerColorsViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 16/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class DarkerColorsViewController: UIViewController {

    @IBOutlet weak private var increaseContrastStatusLabel: UILabel!
    @IBOutlet weak private var darkerColorLabel: UILabel!

    // Listing 8-19
    var darkerColorsStatus: Bool {
        return UIAccessibility.isDarkerSystemColorsEnabled
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setStatusLabel()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(darkerColorsChanged),
                                               name: UIAccessibility.darkerSystemColorsStatusDidChangeNotification,
                                               object: nil)
    }

    private func setStatusLabel() {
        if darkerColorsStatus {
            increaseContrastStatusLabel.text = "FEATURE.INCREASED_CONTRAST.INCREASED_CONTRAST_ON".localized()

        } else {
            increaseContrastStatusLabel.text = "FEATURE.INCREASED_CONTRAST.INCREASED_CONTRAST_OFF".localized()
        }

        // Listing 8-20
        let contrast = traitCollection.accessibilityContrast

        if contrast == .high {
            darkerColorLabel.textColor = UIColor.init(named: "HighContrast")
        } else {
            darkerColorLabel.textColor = UIColor.init(named: "LowContrast")
        }
    }

    @objc
    func darkerColorsChanged() {
        // check darkerColorsStatus for current status
        // replace colors/assets for high contrast alternatives
        setStatusLabel()
    }
}
