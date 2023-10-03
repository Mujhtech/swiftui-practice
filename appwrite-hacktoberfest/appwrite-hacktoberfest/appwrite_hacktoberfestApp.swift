//
//  appwrite_hacktoberfestApp.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 30/09/2023.
//

import SwiftUI

@main
struct appwrite_hacktoberfestApp: App {
    
    private var appwriteService = AppwriteService()
    private var snackbarService = SnackBarService()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Router())
                .environmentObject(UserViewModel(appwriteService, snackbarService))
                .environmentObject(HabitViewModel(appwriteService, snackbarService))
                .environmentObject(snackbarService)
        }
    }
}
