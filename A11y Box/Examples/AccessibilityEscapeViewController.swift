//
//  AccessibilityEscapeViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class AccessibilityEscapeViewController: UIViewController {

    lazy var alert = alertView()

    @IBAction
    func showAlert() {
        view.addSubview(alert)
    }

    private func alertView() -> CustomModalAlert {
        let alert = CustomModalAlert(frame: view.frame)
        alert.delegate = self
        alert.accessibilityViewIsModal = true

        alert.center = view.center
        self.alert = alert
        return alert
    }
}

extension AccessibilityEscapeViewController: CustomModalAlertDelegate {
    func dismiss() {
        alert.removeFromSuperview()
    }
}
