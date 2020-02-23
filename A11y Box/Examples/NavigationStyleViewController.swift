//
//  NavigationStyleViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 23/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class NavigationStyleViewController: UIViewController {

    @IBOutlet weak private var combinedStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        combinedStackView.accessibilityNavigationStyle = .combined
    }

}
