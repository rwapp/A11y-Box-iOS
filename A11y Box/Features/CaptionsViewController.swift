//
//  CaptionsViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 23/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class CaptionsViewController: UIViewController {

    @IBOutlet weak private var captionsStatusLabel: UILabel!

    // Listing 10-3
    var captionsStatus: Bool {
        return UIAccessibility.isClosedCaptioningEnabled
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateCaptionsLabel()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(captionsStatusChanged),
                                               name: UIAccessibility.closedCaptioningStatusDidChangeNotification,
                                               object: nil)
    }

    private func updateCaptionsLabel() {
        if captionsStatus {
            captionsStatusLabel.text = "FEATURE.CAPTIONS.ENABLED".localized()
        } else {
            captionsStatusLabel.text = "FEATURE.CAPTIONS.DISABLED".localized()
        }
    }

    @objc
    func captionsStatusChanged() {
        // check captionsStatus for current status.
        // hide/show captions as requested.
        updateCaptionsLabel()
    }
}
