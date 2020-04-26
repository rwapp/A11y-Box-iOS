//
//  SpokenContentViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 22/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class SpokenContentViewController: UIViewController {

    @IBOutlet private weak var speakScreenStatusLabel: UILabel!
    @IBOutlet private weak var speakSelectionStatusLabel: UILabel!

    // Listing 8-24
    var speakSelectionStatus: Bool {
        return UIAccessibility.isSpeakSelectionEnabled
    }

    // Listing 8-25
    var speakScreenStatus: Bool {
        return UIAccessibility.isSpeakScreenEnabled
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateSelectionLabel()
        updateScreenLabel()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(speakSelectionChanged),
                                               name: UIAccessibility.speakSelectionStatusDidChangeNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(speakScreenChanged),
                                               name: UIAccessibility.speakScreenStatusDidChangeNotification,
                                               object: nil)

    }

    private func updateSelectionLabel() {
        if speakSelectionStatus {
            speakSelectionStatusLabel.text = "FEATURE.SPOKEN_CONTENT.SPEAK_SELECTION.ENABLED".localized()
        } else {
            speakSelectionStatusLabel.text = "FEATURE.SPOKEN_CONTENT.SPEAK_SELECTION.DISABLED".localized()
        }
    }

    private func updateScreenLabel() {
        if speakScreenStatus {
            speakScreenStatusLabel.text = "FEATURE.SPOKEN_CONTENT.SPEAK_SCREEN.ENABLED".localized()
        } else {
            speakScreenStatusLabel.text = "FEATURE.SPOKEN_CONTENT.SPEAK_SCREEN.DISABLED".localized()
        }
    }

    @objc
    func speakSelectionChanged() {
        // check speakSelectionStatus for current status.
        updateSelectionLabel()
    }

    @objc
    func speakScreenChanged() {
        // check speakScreenStatus for current status.
        updateScreenLabel()
    }

    // Listing 8-26
    override func accessibilityScroll(_ direction: UIAccessibilityScrollDirection) -> Bool {
        if lastPage() {
            return false
        }

        navigationController?.pushViewController(nextPage(),
                                                 animated: true)
        
        UIAccessibility.post(notification: .pageScrolled,
                             argument: nil)
        
        return true
    }

    func nextPage() -> UIViewController {
        // return your next content view controller
        return SpokenContentViewController()
    }

    func lastPage() -> Bool {
        // return true if this is the last page of this content
        return false
    }
}
