//
//  SwitchControlViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 23/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class SwitchControlViewController: UIViewController {

    @IBOutlet weak private var switchControlStatusLabel: UILabel!

    // Listing 9-3
    var switchControlStatus: Bool {
        return UIAccessibility.isSwitchControlRunning
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateStatusLabel()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(switchControlChanged),
                                               name: UIAccessibility.switchControlStatusDidChangeNotification,
                                               object: nil)
    }

    private func updateStatusLabel() {
        if switchControlStatus {
            switchControlStatusLabel.text = "FEATURE.SWITCH_CONTROL.ENABLED".localized()
        } else {
            switchControlStatusLabel.text = "FEATURE.SWITCH_CONTROL.DISABLED".localized()
        }
    }

    @objc
    func switchControlChanged() {
        // check switchControlStatus for current status.
        // increase the prominence of gesture alternatives.
        updateStatusLabel()
    }
}
