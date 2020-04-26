//
//  GuidedAccessViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class GuidedAccessViewController: UIViewController {

    @IBOutlet weak private var guidedAccessStatusLabel: UILabel!
    @IBOutlet weak private var deleteButton: UIButton!
    @IBOutlet weak private var settingsButton: UIButton!

    var guidedAccessStatus: Bool {
        return UIAccessibility.isGuidedAccessEnabled
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateGALabel()

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(guidedAccessChanged),
                                       name: UIAccessibility.guidedAccessStatusDidChangeNotification,
                                       object: nil)

        notificationCenter.addObserver(self,
                                       selector: #selector(deleteChanged(_:)),
                                       name: NSNotification.Name(rawValue: Restriction.delete.rawValue),
                                       object: nil)

        notificationCenter.addObserver(self,
                                       selector: #selector(settingsChanged(_:)),
                                       name: NSNotification.Name(rawValue: Restriction.settings.rawValue),
                                       object: nil)
    }

    private func updateGALabel() {
        if guidedAccessStatus {
            guidedAccessStatusLabel.text = "FEATURE.GUIDEDACCESS.ENABLED".localized()
        } else {
            guidedAccessStatusLabel.text = "FEATURE.GUIDEDACCESS.DISABLED".localized()
        }
    }

    @objc
    func guidedAccessChanged() {
        updateGALabel()
    }

    @objc
    func deleteChanged(_ notification: Notification) {
        let status = notification.object as! Bool
        deleteButton.isHidden = !status
    }

    @objc
    func settingsChanged(_ notification: Notification) {
        let status = notification.object as! Bool
        settingsButton.isHidden = !status
    }
}

// Listing 7-3
enum Restriction: String, CaseIterable {
    case settings = "com.myCompany.myApp.restriction.settings"
    case delete = "com.myCompany.myApp.restriction.delete"
}

// Listing 7-4
extension Restriction {
    var title: String {
        switch self {
        case .settings:
            return "Settings"
        case .delete:
            return "Delete"
        }
    }

    var detail: String {
        switch self {
        case .settings:
            return "Allow changing settings"
        case .delete:
            return "Allow permanent deletion of items"
        }
    }
}

extension AppDelegate: UIGuidedAccessRestrictionDelegate {

    // Listing 7-6
    func guidedAccessRestriction(withIdentifier restrictionIdentifier: String,
                                 didChange newRestrictionState: UIAccessibility.GuidedAccessRestrictionState) {

        switch restrictionIdentifier {
        case Restriction.settings.rawValue:
            if newRestrictionState == .deny {
                // remove settings feature
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Restriction.settings.rawValue),
                                                object: false)
            } else {
                // add settings feature
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Restriction.settings.rawValue),
                                                object: true)
            }

        case Restriction.delete.rawValue:
            if newRestrictionState == .deny {
                // remove delete feature
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Restriction.delete.rawValue),
                                                object: false)
            } else {
                // add delete feature
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Restriction.delete.rawValue),
                                                object: true)
            }
        default:
            break
        }
    }

    // listing 7-5
    var guidedAccessRestrictionIdentifiers: [String]? {
        return Restriction.allCases.map { $0.rawValue }
    }

    func textForGuidedAccessRestriction(withIdentifier restrictionIdentifier: String) -> String? {
        return Restriction(rawValue: restrictionIdentifier)?.title
    }

    func detailTextForGuidedAccessRestriction(withIdentifier restrictionIdentifier: String) -> String? {
        return Restriction(rawValue: restrictionIdentifier)?.detail
    }
}
