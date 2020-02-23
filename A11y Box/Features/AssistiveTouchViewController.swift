//
//  AssistiveTouchViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 23/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class AssistiveTouchViewController: UIViewController {

    @IBOutlet private weak var assistiveTouchStatusLabel: UILabel!

    // Listing 9-1
    // Note: This currently only works when guided access is also enabled. I believe this is a bug.
    var assistiveTouchStatus: Bool {
        return UIAccessibility.isAssistiveTouchRunning
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateStatusLabel()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(assistiveTouchChanged),
                                               name: UIAccessibility.assistiveTouchStatusDidChangeNotification,
                                               object: nil)
    }

    private func updateStatusLabel() {
        if assistiveTouchStatus {
            assistiveTouchStatusLabel.text = "FEATURE.ASSISTIVE_TOUCH.ENABLED".localized()
        } else {
            assistiveTouchStatusLabel.text = "FEATURE.ASSISTIVE_TOUCH.DISABLED".localized()
        }
    }

    @objc
    func assistiveTouchChanged() {
        // check assistiveTouchStatus for current status.
        // increase the prominence of gesture alternatives
        updateStatusLabel()
    }
}
