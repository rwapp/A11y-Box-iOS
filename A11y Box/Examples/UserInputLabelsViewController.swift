//
//  UserInputLabelsViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 23/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class UserInputLabelsViewController: UIViewController {

    @IBOutlet weak private var playButton: UIButton!
    lazy var alert = alertView()

    private let songTitle = "Shake It Off"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Note: These strings should be localized
        playButton?.accessibilityLabel = "Play \(songTitle)"

        // Listing 9-5
        playButton?.accessibilityUserInputLabels = ["Play",
                                                    "Play song",
                                                    "Play track",
                                                    "Play \(songTitle)"]
    }

    @IBAction
    func playPressed() {
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

extension UserInputLabelsViewController: CustomModalAlertDelegate {
    func dismiss() {
        alert.removeFromSuperview()
    }
}
