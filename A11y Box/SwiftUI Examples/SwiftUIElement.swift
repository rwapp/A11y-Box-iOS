//
//  SwiftUIView.swift
//  A11y Box
//
//  Created by Rob Whitaker on 26/04/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import SwiftUI

struct SwiftUIElement: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Listing 6-2
            Text("This SwiftUI text is visible by default")
                .padding(.bottom, 8)

            Text("This SwiftUI text is set hidden to accessibility.")
                .accessibility(hidden: true)

            Spacer()
        }
    }
}
