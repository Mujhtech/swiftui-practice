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
            
            userState.userId = res.id
            userState.isLogout = false
            
            return true
            
        } catch {
            userState.isLogout = true
            
            return false
        }
        
    }
    
    
    @MainActor
    func login(_ email String, _ password: String) async {
        
        snackbarService.displayError(<#T##error: Error##Error#>)
        
    }
    
}
