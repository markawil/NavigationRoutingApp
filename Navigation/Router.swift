//
//  Router.swift
//  NavigationRoutingApp
//
//  Created by Mark Wilkinson on 6/7/25.
//

import Foundation
import Observation
import SwiftUI

typealias NavigationPath = [Route]

@Observable
class Router {
    var path = NavigationPath()
    
    func navigateToVerify() {
        path.append(Route.verify)
    }
    
    func navigateToSetup() {
        path.append(Route.setup)
    }
    
    func navigateToQuestionnaire() {
        path.append(Route.questionnaire)
    }
    
    func navigateToLinkAccount() {
        path.append(Route.linkAccount)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}

enum Route: Hashable {
    case setup
    case verify
    case questionnaire
    case linkAccount
}
