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
    @State var isRegister: Bool = false
    @FocusState private var focusedTextField: FormTextField?
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var router: Router
    
    enum FormTextField {
        case email, password
    }
    
    
    var body: some View {
        NavigationView {
            
            
            VStack {
                
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
                            if isRegister {
                                
                                await userViewModel.register(email, password)
                                
                            } else {
                                
                                await userViewModel.login(email, password)
                                
                                router.pushReplacement(.home)
                                
                            }
                            
                        }},
                        label: {
                            Text(isRegister ? "Register" : "Login")
                        })
                    
                }
                
                Button(isRegister ? "Already have account, Login" : "Don't have account, Register") {
                    isRegister = !isRegister
                }
            }
            
            .navigationTitle(isRegister ? "Create account" : "Welcome")
            
                
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    AuthScreen()
}
