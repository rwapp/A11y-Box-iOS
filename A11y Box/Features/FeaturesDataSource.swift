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
        }

        viewController.title = title()

        return viewController
    }

    func title() -> String {
        let key = "FEATURE.\(self.identifier).TITLE"
        return key.localized()
    }
}
