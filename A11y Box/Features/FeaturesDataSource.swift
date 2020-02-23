//
//  FeaturesDataSource.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import Foundation
import UIKit

enum FeaturesDataSource: Int, CaseIterable {

    case guidedAccess
    case voiceOver
    case text
    case zoom
    case transparency
    case switchLabels
    case increasedContrast
    case differentiateColor
    case smartInvert
    case grayscale
    case animation
    case spokenContent
    case darkMode
    case assistiveTouch

    var identifier: String {
        switch self {
        case .guidedAccess:
            return "guidedAccess"
        case .voiceOver:
            return "voiceOver"
        case .text:
            return "text"
        case .zoom:
            return "zoom"
        case .transparency:
            return "transparency"
        case .switchLabels:
            return "switch"
        case .increasedContrast:
            return "increasedContrast"
        case .differentiateColor:
            return "differentiateColor"
        case .smartInvert:
            return "smartInvert"
        case .grayscale:
            return "grayscale"
        case .animation:
            return "animation"
        case .spokenContent:
            return "spokenContent"
        case .darkMode:
            return "darkMode"
        case .assistiveTouch:
            return "assistiveTouch"
        }
    }

    func viewController() -> UIViewController {
        let viewController: UIViewController

        switch self {
        case .guidedAccess:
            viewController = GuidedAccessViewController()
        case .voiceOver:
            viewController = VoiceOverViewController()
        case .text:
            viewController = TextViewController()
        case .zoom:
            viewController = ZoomViewController()
        case .transparency:
            viewController = TransparencyViewController()
        case .switchLabels:
            viewController = SwitchViewController()
        case .increasedContrast:
            viewController = DarkerColorsViewController()
        case .differentiateColor:
            viewController = DifferentiateColorsViewController()
        case .smartInvert:
            viewController = SmartInvertViewController()
        case .grayscale:
            viewController = GrayscaleViewController()
        case .animation:
            viewController = ReduceMotionViewController()
        case .spokenContent:
            viewController = SpokenContentViewController()
        case .darkMode:
            viewController = DarkModeViewController()
        case .assistiveTouch:
            viewController = AssistiveTouchViewController()
        }

        viewController.title = title()

        return viewController
    }

    func title() -> String {
        let key = "FEATURE.\(self.identifier).TITLE"
        return key.localized()
    }
}
