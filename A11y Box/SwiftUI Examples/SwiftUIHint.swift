//
//  SwiftUIHint.swift
//  A11y Box
//
//  Created by Rob Whitaker on 26/04/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import SwiftUI

struct SwiftUIHint: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            // Listing 6-6.
            Text("This SwiftUI Text has an accessibility hint.")
                .accessibility(hint: Text("EXAMPLE.HINTS.HINT"))

            Spacer()
        }
    }
}
