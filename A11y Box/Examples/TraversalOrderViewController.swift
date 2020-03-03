//
//  TraversalOrderViewController.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class TraversalOrderViewController: UIViewController {

    @IBOutlet weak private var orderedTraversal: OrderedTraversalView!
    @IBOutlet weak private var unorderedTraversal: UnorderedTraversalView!
    @IBOutlet weak private var componentTraversal: ComponentTraversalView!
    
    override func viewDidLoad() {
        self.componentTraversal.tileDetails = [("Heading 1", "Detail 1"),
                                               ("Heading 2 ", "Detail 2"),
                                               ("Heading 3", "Detail 3")]
    }
}
