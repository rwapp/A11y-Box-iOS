//
//  OrderedTraversalView.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

@IBDesignable
class OrderedTraversalView: UIView {

    @IBOutlet weak var header1: UILabel!
    @IBOutlet weak var header2: UILabel!
    @IBOutlet weak var header3: UILabel!
    @IBOutlet weak var detail1: UILabel!
    @IBOutlet weak var detail2: UILabel!
    @IBOutlet weak var detail3: UILabel!

    // Listing 6-18
    override var accessibilityElements: [Any]? {
        set {}
        get {
            return [header1!,
                    detail1!,
                    header2!,
                    detail2!,
                    header3!,
                    detail3!]
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        let view = UINib(nibName: "OrderedTraversalView",
                         bundle: Bundle.main).instantiate(withOwner: self,
                                                          //swiftlint:disable:next force_cast
                            options: nil).first as! UIView

        view.frame = bounds
        addSubview(view)
    }
}
