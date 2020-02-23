//
//  ShakeToUndoViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 23/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class ShakeToUndoViewController: UIViewController {

    @IBOutlet private weak var shakeToUndoStatusLabel: UILabel!

    var shakeToUndoStatus: Bool {
        return UIAccessibility.isShakeToUndoEnabled
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateStatusLabel()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(shakeToUndoChanged),
                                               name: UIAccessibility.shakeToUndoDidChangeNotification,
                                               object: nil)
    }

    private func updateStatusLabel() {
        if shakeToUndoStatus {
            shakeToUndoStatusLabel.text = "FEATURE.SHAKE_TO_UNDO.ENABLED".localized()
        } else {
            shakeToUndoStatusLabel.text = "FEATURE.SHAKE_TO_UNDO.DISABLED".localized()
        }
    }

    @objc
    func shakeToUndoChanged() {
        // check shakeToUndoStatus for current status.
        // increase the prominence of undo features.
        updateStatusLabel()
    }
}
