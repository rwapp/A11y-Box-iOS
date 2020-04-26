//
//  SwiftUIStack.swift
//  A11y Box
//
//  Created by Rob Whitaker on 26/04/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import SwiftUI

struct SwiftUIStack: View {

    var stars = 4
    var respondents = 1000

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

//            Listing 8-15.
            Text("Stacks in SwiftUI provide a simple way to make powerful semantic views by combining elements")
                .font(.headline)

//             Listing 6-23.
            VStack(alignment: .leading, spacing: 10) {
                Button(action: {}) {
                    Text("⭐⭐⭐⭐")
                        .font(.largeTitle)
                }

                Text("1K ratings")
                    .font(.subheadline)
            }
            .padding()
            .accessibilityElement(children: .ignore)
            .accessibility(label: Text("\(stars) stars from \(respondents) ratings"))
            .accessibility(addTraits: .isButton)
            .accessibilityAction {  }
        }
    }
}

struct SwiftUIStack_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStack()
    }
}
