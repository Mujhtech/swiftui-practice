//
//  HabitViewModel.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 03/10/2023.
//

import Foundation


final class HabitViewModel: ObservableObject {
    
    private var appwriteService: AppwriteService
    private var snackbarService: SnackBarService
        
    init(_ appwriteService: AppwriteService, _ snackbarService: SnackBarService) {
        self.appwriteService = appwriteService
        self.snackbarService = snackbarService
    }
    
}
