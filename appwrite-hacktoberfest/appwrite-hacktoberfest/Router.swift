//
//  Router.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//

import SwiftUI


enum Tabs {
    case home, progress, setting
}

enum Route {
    case appwrite
    case home
    case auth
    case add_habit
}

extension Route: View {
    var body: some View {
        switch self {
        case .appwrite:
             ContentView()
        case .home:
            HomeView()
        case .auth:
            AuthScreen()
        case .add_habit:
            AddHabitScreen()
        }
        
    }
}


extension Route: Hashable {
    static func == (lhs: Route, rhs: Route) -> Bool {
        return lhs.compareString == rhs.compareString
    }
    
    var compareString: String {
        switch self {
        case .appwrite:
            return "appwrite"
        case .home:
            return "home"
        case .auth:
            return "auth"
        case .add_habit:
            return "addHabit"
        }
    }
}


final class Router: ObservableObject {
    @Published var routes = [Route]()
    @Published var selectedTab: Tabs = .home
    
    func push(_ screen: Route) {
        routes.append(screen)
    }
    
    func pushReplacement(_ screen: Route) {
        if routes.isEmpty {
            routes.append(screen)
        } else {
            routes[routes.count - 1] = screen
        }
    }
    
    func pop() {
        routes.removeLast()
    }
    
    func pushAndPopUntil(_ screen: Route, predicate: (Route) -> Bool) {
        
//        // Push
//        push(screen)
//        
//        // Pop
//        popUntil(predicate: predicate)
        routes = [screen]
    }
    
    func popUntil(predicate: (Route) -> Bool) {
        if let last = routes.popLast() {
            guard predicate(last) else {
                popUntil(predicate: predicate)
                return
            }
        }
    }
    
    func reset() {
        routes = []
    }
}
