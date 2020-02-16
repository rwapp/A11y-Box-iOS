//
//  TextViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 16/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet weak private var boldTextStatusLabel: UILabel!
    @IBOutlet weak private var customFontLabel: UILabel!

    // Listing 8-13
    var boldTextStatus: Bool {
        get{
            return UIAccessibility.isBoldTextEnabled
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateBoldTextLabel()
        setupCustomFontLabel()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(boldTextChanged),
                                               name: UIAccessibility.boldTextStatusDidChangeNotification,
                                               object: nil)
    }

    private func setupCustomFontLabel() {
        // Listing 8-16
        let font = UIFont(name: "AmericanTypewriter", size: 17)
        let bodyMetrics = UIFontMetrics(forTextStyle: .body)
        customFontLabel.font = bodyMetrics.scaledFont(for: font!)
        customFontLabel.adjustsFontForContentSizeCategory = true
    }

    private func updateBoldTextLabel() {
        if boldTextStatus {
            boldTextStatusLabel.text = "FEATURE.TEXT.BOLD_ON".localized()
        } else {
            boldTextStatusLabel.text = "FEATURE.TEXT.BOLD_OFF".localized()
        }
    }

    @objc
    func boldTextChanged() {
        // check boldTextStatus for current status.
        // switch to bold fonts or assets as appropriate
        updateBoldTextLabel()
    }
}
