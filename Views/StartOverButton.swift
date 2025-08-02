//
//  StartOverButton.swift
//  NavigationRoutingApp
//
//  Created by Mark Wilkinson on 8/2/25.
//

import SwiftUI

struct StartOverButton: View {
    
    @Environment(Router.self) var router
    
    var body: some View {
        Button {
            router.popToRoot()
        } label: {
            Text("Start Over")
        }
    }
}

#Preview {
    StartOverButton()
        .withRouter()
}
