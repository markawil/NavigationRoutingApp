//
//  ContentView.swift
//  NavigationRoutingApp
//
//  Created by Mark Wilkinson on 8/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(Router.self) var router
    
    var body: some View {
        VStack {
            Spacer()
            Text("Wecome!")
            Spacer()
            Button {
                router.navigateToSetup()
            } label: {
                Text("Create Account")
            }
            .padding()
            Button {
                router.navigateToLinkAccount()
            } label: {
                Text("Link Existing Account")
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
        .withRouter()
}
