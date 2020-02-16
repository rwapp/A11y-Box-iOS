//
//  AccessibilityViewIsModalViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class AccessibilityViewIsModalViewController: UIViewController {

    lazy var alert = alertView()

    @IBAction
    func withButtonPressed() {
        // Listing 6-17
        alert.accessibilityViewIsModal = true

        displayAlert()
    }

    @IBAction
    func withoutButtonPressed() {
        // This is the default
        alert.accessibilityViewIsModal = false

        displayAlert()
    }

    private func displayAlert() {
        view.addSubview(alert)
    }

    private func alertView() -> CustomModalAlert {
        let alert = CustomModalAlert(frame: view.frame)
        alert.delegate = self
        alert.center = view.center
        self.alert = alert
        return alert
    }
}

extension AccessibilityViewIsModalViewController: CustomModalAlertDelegate {
    func dismiss() {
        alert.removeFromSuperview()
    }
}
