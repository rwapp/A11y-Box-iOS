//
//  HearingDevicesViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 23/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class HearingDevicesViewController: UIViewController {

    @IBOutlet weak private var hearingAidStatusLabel: UILabel!

    // Listing 10-1
    var hearingDeviceStatus: UIAccessibility.HearingDeviceEar {
        return UIAccessibility.hearingDevicePairedEar
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        hearingDevicesChanged()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(hearingDevicesChanged),
                                               name: UIAccessibility.hearingDevicePairedEarDidChangeNotification,
                                               object: nil)
    }

    @objc
    func hearingDevicesChanged() {
        if hearingDeviceStatus.contains(.left) {
            // left ear device paired
            hearingAidStatusLabel.text = "FEATURE.HEARING_DEVICES.LEFT".localized()
        }
        if hearingDeviceStatus.contains(.right) {
            // right ear device paired
            hearingAidStatusLabel.text = "FEATURE.HEARING_DEVICES.RIGHT".localized()
        }
        if hearingDeviceStatus.contains(.both) {
            // both ear devices paired
            hearingAidStatusLabel.text = "FEATURE.HEARING_DEVICES.BOTH".localized()
        }
        if hearingDeviceStatus.isEmpty {
            // no hearing devices paired
            hearingAidStatusLabel.text = "FEATURE.HEARING_DEVICES.NONE".localized()
        }
    }
}
