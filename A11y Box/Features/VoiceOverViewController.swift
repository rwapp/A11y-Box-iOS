//
//  VoiceOverViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

// Listing 8-1
class VoiceOverViewController: UIViewController {

    @IBOutlet weak private var voiceOverStatusLabel: UILabel!
    @IBOutlet weak private var voPitchLabel: UILabel!
    @IBOutlet weak private var voLanguageLabel: UILabel!
    @IBOutlet weak private var voSpelledLabel: UILabel!
    @IBOutlet weak private var voPhoneticLabel: UILabel!
    @IBOutlet weak private var voPunctuationLabel: UILabel!

    var voiceOverStatus: Bool {
        return UIAccessibility.isVoiceOverRunning
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateVOLabel()
        voiceOverPitchLabel()
        voiceOverLanguageLabel()
        voiceOverSpelledLabel()
        voiceOverPhoneticLabel()
        voiceOverPunctuationLabel()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(voiceOverChanged),
                                               name: UIAccessibility.voiceOverStatusDidChangeNotification,
                                               object: nil)
    }

    private func voiceOverPitchLabel() {
        // Listing 8-6
        let attributedString = NSMutableAttributedString(string: "FEATURE.VOICEOVER.PITCH".localized())

        // Always localize your strings and perform proper range calculations. I’m hard-coding values here for brevity.
        let range = NSRange(location: 12, length: 4)
        attributedString.addAttributes([.accessibilitySpeechPitch: 1.5],
                                       range: range)

        voPitchLabel.attributedText = attributedString
        // alternatively
        // voPitchLabel.accessibilityAttributedLabel = attributedString
    }

    private func voiceOverLanguageLabel() {
        // Listing 8-7
        let attributedString = NSMutableAttributedString(string: "FEATURE.VOICEOVER.LANGUAGE".localized())

        // Always localize your strings and perform proper range calculations. I’m hard-coding values here for brevity.
        let range = NSRange(location: 21, length: 4)
        attributedString.addAttributes([.accessibilitySpeechLanguage: "es-419"],
                                       range: range)

        voLanguageLabel.attributedText = attributedString
        // alternatively
        // voLanguageLabel.accessibilityAttributedLabel = attributedString
    }

    private func voiceOverSpelledLabel() {
        // Listing 8-8
        let attributedString = NSMutableAttributedString(string: "FEATURE.VOICEOVER.SPELLED".localized())

        // Always localize your strings and perform proper range calculations. I’m hard-coding values here for brevity.
        let range = NSRange(location: 28, length: 4)
        attributedString.addAttributes([.accessibilitySpeechSpellOut: true],
                                       range: range)

        voSpelledLabel?.attributedText = attributedString
        // alternatively
        // voSpelledLabel.accessibilityAttributedLabel = attributedString
    }

    func voiceOverPhoneticLabel() {
        // listing 8-9
        voPhoneticLabel.accessibilityAttributedLabel = NSMutableAttributedString(string: "[air-bee-an-bee]",
                                                                                 attributes: [.accessibilitySpeechIPANotation: true])
    }

    func voiceOverPunctuationLabel() {
        // listing 8-10
        voPunctuationLabel.attributedText = NSMutableAttributedString(string: "print(\"Hello, World!\")",
                                                                                    attributes: [.accessibilitySpeechPunctuation: true])
    }

    @objc
    func voiceOverChanged() {
        // check voiceOverStatus for the current status.
        updateVOLabel()
    }

    private func updateVOLabel() {
        if voiceOverStatus {
            voiceOverStatusLabel.text = "FEATURE.VOICEOVER.ENABLED".localized()
        } else {
            voiceOverStatusLabel.text = "FEATURE.VOICEOVER.DISABLED".localized()
        }
    }

    @IBAction
    func changeScreeen() {
        // Listing 8-2
        UIAccessibility.post(notification: .screenChanged,
                             argument: "FEATURE.VOICEOVER.LAYOUT_CHANGED".localized())
    }

    @IBAction
    func changeLayout() {
        // Listing 8-3
        UIAccessibility.post(notification: .layoutChanged,
                             argument: voiceOverStatusLabel)
    }

    @IBAction
    func announcement() {
        // Listing 8-4
        // do something to change the view
        sleep(1)
        UIAccessibility.post(notification: .announcement,
                             argument: "FEATURE.VOICEOVER.CONNNECTIVITY".localized())
    }

    @IBAction
    func queuedAnnouncement() {
        // Listing 8-5
        let announcement = NSAttributedString(string: "FEATURE.VOICEOVER.CONNNECTIVITY".localized(),
                                              attributes: [.accessibilitySpeechQueueAnnouncement: true])
        // do something to change the view
        sleep(1)
        UIAccessibility.post(notification: .announcement, argument: announcement)
    }

}
