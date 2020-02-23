//
//  TransparencyViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 16/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class TransparencyViewController: UIViewController {

    @IBOutlet weak private var transparencyStatusLabel: UILabel!
    @IBOutlet weak private var backgroundView: UIView!

    // Listing 8-18
    var reduceTransparencyStatus: Bool {
        return UIAccessibility.isReduceTransparencyEnabled
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setTransparency()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reduceTransparencyChanged),
                                               name: UIAccessibility.reduceTransparencyStatusDidChangeNotification,
                                               object: nil)
    }

    private func setTransparency() {
        if reduceTransparencyStatus {
            backgroundView.alpha = 1
            transparencyStatusLabel.text = "FEATURE.TRANSPARENCY.TRANSPARENCY_ON".localized()
        } else {
            backgroundView.alpha = 0.5
            transparencyStatusLabel.text = "FEATURE.TRANSPARENCY.TRANSPARENCY_OFF".localized()
        }
    }

    @objc
    func reduceTransparencyChanged() {
        // check reduceTransparencyStatus for current status.
        // add opacity to views as needed.
        setTransparency()
    }
}
