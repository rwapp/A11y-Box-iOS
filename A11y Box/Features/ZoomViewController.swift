//
//  ZoomViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 16/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak private var focusLabel: UILabel!

    override func viewDidLoad() {
        UIAccessibility.registerGestureConflictWithZoom()
    }

    @IBAction
    func focusPressed() {
        // Listing 8-12
        UIAccessibility.zoomFocusChanged(zoomType: .insertionPoint,
                                         toFrame: focusLabel.frame,
                                         in: self.view)
    }
}
