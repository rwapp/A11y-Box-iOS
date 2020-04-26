//
//  ExamplesDatasource.swift
//  A11y Box
//
//  Created by Rob Whitaker on 08/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

enum ExamplesDatasource: Int, CaseIterable {

    case accessibilityElements
    case accessibilityLabels
    case accessibilityValues
    case accessibilityHints
    case accessibilityLanguage
    case accessibilityHidden
    case accessibilityViewIsModal
    case accessibilityTraversalOrder
    case accessibilityEscape
    case accessibilityShortcuts
    case accessibilityFocus
    case navigation
    case inputLabels
    case swiftUIStack

    var identifier: String {
        switch self {
        case .accessibilityElements:
            return "accessibilityElements"
        case .accessibilityLabels:
            return "accessibilityLabels"
        case .accessibilityValues:
            return "accessibilityValues"
        case .accessibilityHints:
            return "accessibilityHints"
        case .accessibilityLanguage:
            return "accessibilityLanguage"
        case .accessibilityHidden:
            return "accessibilityHidden"
        case .accessibilityViewIsModal:
            return "accessibilityViewIsModal"
        case .accessibilityTraversalOrder:
            return "accessibilityTraversalOrder"
        case .accessibilityEscape:
            return "accessibilityEscape"
        case .accessibilityShortcuts:
            return "accessibilityShortcuts"
        case .accessibilityFocus:
            return "accessibilityFocus"
        case .navigation:
            return "navigation"
        case .inputLabels:
            return "inputLabels"
        case .swiftUIStack:
            return "swiftUIStack"
        }
    }

    func viewController() -> UIViewController {
        let viewController: UIViewController

        switch self {
        case .accessibilityElements:
            viewController = AccessibilityElementsViewController()
        case .accessibilityLabels:
            viewController = AccessibilityLabelsViewController()
        case .accessibilityValues:
            viewController = AccessibilityValuesViewController()
        case .accessibilityHints:
            viewController = AccessibilityHintsViewController()
        case .accessibilityLanguage:
            viewController = AccessibilityLanguageViewController()
        case .accessibilityHidden:
            viewController = AccessibilityHiddenViewController()
        case .accessibilityViewIsModal:
            viewController = AccessibilityViewIsModalViewController()
        case .accessibilityTraversalOrder:
            viewController = TraversalOrderViewController()
        case .accessibilityEscape:
            viewController = AccessibilityEscapeViewController()
        case .accessibilityShortcuts:
            viewController = CustomActionViewController()
        case .accessibilityFocus:
            viewController = AccessibilityFocusViewController()
        case .navigation:
            viewController = NavigationStyleViewController()
        case .inputLabels:
            viewController = UserInputLabelsViewController()
        case .swiftUIStack:
            viewController = UIHostingController(rootView: SwiftUIStack())
        }

        viewController.title = title()

        return viewController
    }

    func title() -> String {
        let key = "EXAMPLE.\(self.identifier).TITLE"
        return key.localized()
    }
}
