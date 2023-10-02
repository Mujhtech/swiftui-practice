//
//  appwrite_hacktoberfestApp.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 30/09/2023.
//

import SwiftUI

@main
struct appwrite_hacktoberfestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Router())
        }
    }
}
