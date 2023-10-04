//
//  SettingScreen.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//

import SwiftUI

struct SettingScreen: View {
    
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var router: Router

    
    var body: some View {
        VStack {
            
            List {
                HStack {
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundColor(.red)
                        .font(.title)
                    Text("Logout")
                        .font(.headline)
                }
                .onTapGesture {
                    Task {
                        await userViewModel.logout()
                        
                        router.reset()
                    }
                }
            }
            
            Button("Delete Account") {
                
            }
            .frame(width: 200, height: 50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer(minLength: 20)
            
            
        }
        
    }
}

#Preview {
    SettingScreen()
}
