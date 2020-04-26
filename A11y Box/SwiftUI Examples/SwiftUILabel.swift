//
//  SwiftUILabel.swift
//  A11y Box
//
//  Created by Rob Whitaker on 26/04/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import SwiftUI

struct SwiftUILabel: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            // Listing 6-4.
                Text("This SwiftUI Text has an accessibility label set")
            .accessibility(label: Text("EXAMPLE.LABELS.ACCESSIBILITY_LABEL"))

            Spacer()
        }
    }
}
