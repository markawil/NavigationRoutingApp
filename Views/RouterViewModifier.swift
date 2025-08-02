//
//  RouterViewModifier.swift
//  NavigationRoutingApp
//
//  Created by Mark Wilkinson on 6/7/25.
//

import Foundation
import SwiftUI

struct RouterViewModifier: ViewModifier {
    
    @State private var router = Router()
    
    private func routeView(for route: Route) -> some View {
        Group {
            VStack {
                Spacer()
                switch route {
                case .setup:
                    AccountSetupView()
                case .verify:
                    VerificationCodeView()
                case .questionnaire:
                    QuestionnaireView()
                case .linkAccount:
                    LinkExistingAccountView()
                }
                Spacer()
                StartOverButton()
                    .padding()
            }
        }
        .environment(router)
    }
    
    func body(content: Content) -> some View {
        NavigationStack(path: $router.path) {
            content
                .environment(router)
                .navigationDestination(for: Route.self) { route in
                    routeView(for: route)
                }
        }
    }
}

extension View {
    func withRouter() -> some View {
        modifier(RouterViewModifier())
    }
}
