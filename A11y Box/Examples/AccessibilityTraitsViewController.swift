//
//  AccessibilityTraitsViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class AccessibilityTraitsViewController: UIViewController {

    @IBOutlet weak private var traitButton: UILabel!
    @IBOutlet weak private var traitLink: UILabel!
    @IBOutlet weak private var traitHeader: UILabel!
    @IBOutlet weak private var traitSearch: UILabel!
    @IBOutlet weak private var traitImage: UILabel!
    @IBOutlet weak private var traitSelected: UILabel!
    @IBOutlet weak private var traitPlaysSound: UIButton!
    @IBOutlet weak private var traitKey: UIButton!
    @IBOutlet weak private var traitStatic: UILabel!
    @IBOutlet weak private var traitNotEnabled: UIButton!
    @IBOutlet weak private var traitUpdatesFrequently: UILabel!
    @IBOutlet weak private var traitStartsMedia: UIButton!
    @IBOutlet weak private var traitAdjustable: UIView!
    @IBOutlet weak private var traitSummaryElement: UIView!
    @IBOutlet weak private var traitDirectInteraction: UIView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        traitButton.accessibilityTraits.insert(.button)
        traitLink.accessibilityTraits.insert(.link)
        traitHeader.accessibilityTraits.insert(.header)
        traitSearch.accessibilityTraits.insert(.searchField)
        traitSearch.accessibilityTraits.insert(.image)
        traitSelected.accessibilityTraits.insert(.selected)
        traitKey.accessibilityTraits.insert(.keyboardKey)
        traitStatic.accessibilityTraits.insert(.staticText)
        traitNotEnabled.accessibilityTraits.insert(.notEnabled)
        traitUpdatesFrequently.accessibilityTraits.insert(.updatesFrequently)
        traitStartsMedia.accessibilityTraits.insert(.startsMediaSession)
        traitAdjustable.accessibilityTraits.insert(.adjustable)
        traitSummaryElement.accessibilityTraits.insert(.summaryElement)
        traitDirectInteraction.accessibilityTraits.insert(.allowsDirectInteraction)

    }
}
