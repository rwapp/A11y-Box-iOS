//
//  SmartInvertViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 16/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class SmartInvertViewController: UIViewController {

    @IBOutlet weak private var earthImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Listing 8-22
        earthImage.accessibilityIgnoresInvertColors = true
    }
}
