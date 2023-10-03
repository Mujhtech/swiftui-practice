//
//  ContentView.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var snackBarService: SnackBarService
    @Environment(\.colorScheme) private var theme
    
    
    var body: some View {
        NavigationStack(path: $router.routes) {
            VStack {
                
                Image(theme == .dark ? "appwrite_light" : "appwrite_dark")
                    .frame(width: 132, height: 24)
                
            }
            .task {
                let isAuthenticated = await userViewModel.getCurrentSession()
                
                if !isAuthenticated {
                    router.pushAndPopUntil(.auth, predicate: { $0 == .auth})
                } else {
                    router.pushAndPopUntil(.home, predicate: { $0 == .home})
                }
            }
            .navigationDestination(for: Route.self, destination: { $0 })
            
        }
        .overlay(alignment: .top) {
            if (snackBarService.snackBarState?.hasError == true) {
                SnackbarView(text: snackBarService.snackBarState?.error.localizedDescription ?? "An error occured")
            }
        }
        
    }
}

//#Preview {
//    ContentView()
//}
