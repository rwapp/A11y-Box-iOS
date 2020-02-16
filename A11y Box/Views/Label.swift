//
//  Label.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

class Label: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        numberOfLines = 0
        adjustsFontForContentSizeCategory = true
    }
}
