//
//  TestGroupContentView.swift
//  NavigationRoutingApp
//
//  Created by Mark Wilkinson on 5/20/25.
//

import SwiftUI

struct TestGroupContentView: View {
    @State private var layoutVertically = false
    
    var body: some View {
        VStack {
            ViewThatFits {
                Rectangle()
                    .frame(width: 300, height: 200)

                Circle()
                    .frame(width: 200, height: 200)
            }
        }
        .padding()
        Button {
            layoutVertically.toggle()
        } label: {
            if layoutVertically {
                VStack {
                    GroupView()
                }
            } else {
                HStack {
                    GroupView()
                }
            }
        }
    }
}

#Preview {
    TestGroupContentView()
}
