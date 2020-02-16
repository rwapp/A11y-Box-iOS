//
//  SwitchViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 16/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class SwitchViewController: UIViewController {

    private var switchStutus = false

    @IBOutlet weak private var customSwitch: UIButton!

    // Listing 8-17
    var switchLabelStatus: Bool {
        return UIAccessibility.isOnOffSwitchLabelsEnabled
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setSwitchBackground()
        customSwitch.layer.cornerRadius = 8.0

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(switchLabelsChanged),
                                               name: UIAccessibility.onOffSwitchLabelsDidChangeNotification,
                                               object: nil)
    }

    private func setSwitchBackground() {
        customSwitch.backgroundColor = switchStutus ? .green : .red
        if switchLabelStatus {
            customSwitch.setTitle(switchStutus ? "On" : "Off", for: .normal)
        } else {
            customSwitch.setTitle("", for: .normal)
        }
    }

    @IBAction
    func switchToggled() {
        switchStutus.toggle()
        setSwitchBackground()
    }

    @objc
    func switchLabelsChanged() {
        // check switchLabelStatus for current status
        // add on/off labels to your controls as needed.
        setSwitchBackground()
    }
}
