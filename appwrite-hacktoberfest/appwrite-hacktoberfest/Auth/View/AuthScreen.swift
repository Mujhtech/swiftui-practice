//
//  AuthScreen.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//

import SwiftUI

struct AuthScreen: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @FocusState private var focusedTextField: FormTextField?
    @EnvironmentObject private var userViewModel: UserViewModel
    
    enum FormTextField {
        case email, password
    }
    
    
    var body: some View {
        NavigationView {
            
            
            
           
            Form {
                    Section {
                        
                        TextField("Email",text: $email)
                            .focused($focusedTextField, equals: .email)
                            .onSubmit { focusedTextField = .password }
                            .submitLabel(.next)
                        
                        SecureField("Password", text: $password)
                            .focused($focusedTextField, equals: .password)
                            .onSubmit { focusedTextField = nil }
                            .submitLabel(.continue)
                        
                    }
                    
                    Button( action: { Task {
                        
                    }},
                    label: {
                        Text("Login")
                    })
            }
           
            .navigationTitle("Welcome")
            
                
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    AuthScreen()
}
