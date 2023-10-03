//
//  SettingScreen.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//

import SwiftUI

struct SettingScreen: View {
    var body: some View {
        List {
            HStack {
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(.red)
                    .font(.title)
                Text("Logout")
                    .font(.headline)
            }
        }
    }
}

#Preview {
    SettingScreen()
}
