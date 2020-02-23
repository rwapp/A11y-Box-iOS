//
//  MonoAudioViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 23/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class MonoAudioViewController: UIViewController {

    @IBOutlet weak private var monoAudioStatusLabel: UILabel!

    // Listing 10-2
    var monoAudioStatus: Bool {
        return UIAccessibility.isMonoAudioEnabled
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateStatusLabel()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(monoAudioChanged),
                                               name: UIAccessibility.monoAudioStatusDidChangeNotification,
                                               object: nil)
    }

    private func updateStatusLabel() {
        if monoAudioStatus {
            monoAudioStatusLabel.text = "FEATURE.MONO_AUDIO.ENABLED".localized()
        } else {
            monoAudioStatusLabel.text = "FEATURE.MONO_AUDIO.DISABLED".localized()
        }
    }

    @objc
    func monoAudioChanged() {
        // check monoAudioStatus for current status.
        // provide alternatives if your app uses stereo audio.
        updateStatusLabel()
    }
}
