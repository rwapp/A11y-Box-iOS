//
//  TileView.swift
//  A11y Box
//
//  Created by Martin Wright on 29/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

@IBDesignable
class TileView: UIView {
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var detail: UILabel!
    var tileDetails: (String, String)? {
        didSet {
            updateView()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        let view = UINib(nibName: "TileView",
                         bundle: Bundle.main).instantiate(withOwner: self,
                                                          //swiftlint:disable:next force_cast
                            options: nil).first as! UIView

        view.frame = bounds
        addSubview(view)
    }
    
    /// Set the entire view to read its contents as a single element
    /// Useful to avoid navigating multiple views when the are being used to represent a single piece of information
    /// This design makes it unnecessary to specify accessibilityElements array (as in the OrderedTraversal example)
    private func updateView() {
        // Set the entire tile view to be an accessibility view
        self.isAccessibilityElement = true
        // Set the entire tile view with a trait of static text
        self.accessibilityTraits = .staticText
        // Set the accessibility label to a composite value of both labels
        if let tile = tileDetails {
            header.text = tile.0
            detail.text = tile.1
            self.accessibilityLabel = "\(tile.0)  \(tile.1)"
        }
        // Disable the accessibility elements for the individual labels
        header.isAccessibilityElement = false
        detail.isAccessibilityElement = false
    }
}
