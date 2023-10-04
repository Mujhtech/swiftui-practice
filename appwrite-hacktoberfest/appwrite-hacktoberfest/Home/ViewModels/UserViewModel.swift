//
//  UserViewModel.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 03/10/2023.
//

import Foundation
import Appwrite

struct UserState {
    var userId: String? = nil
    var loading: Bool = false
    var isLogout: Bool = false
    
}


final class UserViewModel: ObservableObject {
    
    private var appwriteService: AppwriteService
    private var snackbarService: SnackBarService
    @Published var userState: UserState = UserState()
        
    init(_ appwriteService: AppwriteService, _ snackbarService: SnackBarService) {
        self.appwriteService = appwriteService
        self.snackbarService = snackbarService
    }
    
    
    @MainActor
    func getCurrentSession() async -> Bool {
        userState.loading = true
        defer { userState.loading = false }
        
        do {
            
            let res = try await appwriteService.currentSession()
            
            print(res)
            
            userState.userId = res.id
            userState.isLogout = false
            
            return true
            
        } catch {
            
            print(error)
            userState.isLogout = true
            
            return false
        }
        
    }
    
    
    @MainActor
    func login(_ email: String, _ password: String) async {
        
        do {
           let session = try await appwriteService.onLogin(email, password)
            
           print(session)
        } catch {
            
            snackbarService.displayError(error)
            
        }
        
    }
    
    
    @MainActor
    func register(_ email: String, _ password: String) async {
        
        do {
           let session = try await appwriteService.onRegister(email, password)
            
           print(session)
        } catch {
            
            snackbarService.displayError(error)
            
        }
        
    }
    
    
    @MainActor
    func logout() async {
        
        do {
           _ = try await appwriteService.onLogout()
        
        } catch {
            
            snackbarService.displayError(error)
            
        }
        
    }
    
}
