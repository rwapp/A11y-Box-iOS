//
//  String+Localization.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import Foundation

extension String {
    func localized() -> String {

        // Listing 7-5
        return NSLocalizedString(self, comment: "")
    }
}
