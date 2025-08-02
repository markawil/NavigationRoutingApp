//
//  GroupView.swift
//  NavigationRoutingApp
//
//  Created by Mark Wilkinson on 6/7/25.
//

import SwiftUI

struct GroupView: View {
    var body: some View {
        Group {
            Text("Line 1")
            Text("Line 2")
            Text("Line 3")
        }
        .font(.largeTitle)

    }
}

#Preview {
    GroupView()
}
