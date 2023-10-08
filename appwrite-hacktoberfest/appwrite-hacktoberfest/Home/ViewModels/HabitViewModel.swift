//
//  HabitViewModel.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 03/10/2023.
//

import Appwrite
import Foundation


struct HabitState {
    var habits: [HabitModel] = []
    var gettingHabit: Bool = false
}

struct SelectedHabitState {
    var habit: HabitModel? = nil
    var isSelected: Bool = false
}


final class HabitViewModel: ObservableObject {
    
    private var appwriteService: AppwriteService
    private var snackbarService: SnackBarService
    @Published var habitState: HabitState = HabitState()
    @Published var selectedHabitState: SelectedHabitState = SelectedHabitState()
        
    init(_ appwriteService: AppwriteService, _ snackbarService: SnackBarService) {
        self.appwriteService = appwriteService
        self.snackbarService = snackbarService
    }
    
    
    @MainActor
    func fetchHabits() async {
        
        do {
            
            habitState.gettingHabit = true
            
            defer { habitState.gettingHabit = false }
            
            let data: DocumentList<HabitModel> = try await appwriteService.getDocs(.habit, .habits)
            
            habitState.habits = data.documents.map{ doc in
                
                HabitModel(id: doc.id, userId: doc.data.userId, title: doc.data.title, description: doc.data.description, goals: doc.data.goals, goalCompleted: doc.data.goalCompleted, icon: doc.data.icon, startDate: doc.data.startDate, endDate: doc.data.endDate)
                
            }
            
        } catch {
            
            snackbarService.displayError(error)
            
        }
        
    }
    
    
    
    @MainActor
    func create(_ title: String, _ description: String, _ goals: Int, _ icon: String, _ startDate: String, _ endDate: String, _ userId: String) async {
        
        do {
            
            try await appwriteService.insertDoc(
                .habit,
                .habits,
                data: [
                    "title": title,
                    "description": description,
                    "goals": goals,
                    "goalCompleted": 0,
                    "icon": icon,
                    "startDate": startDate,
                    "endDate": endDate,
                    "userId": userId
                ]
            )
            
        } catch {
            
            print(error)
            
            snackbarService.displayError(error)
            
        }
        
    }
    
    
    @MainActor
    func update(_ id: String, _ goalCompleted: Int) async {
        
        do {
            
            try await appwriteService.updateDoc(
                .habit,
                .habits,
                id,
                data: [
                    "goalCompleted": goalCompleted
                ]
            )
            
        } catch {
            
            print(error)
            
            snackbarService.displayError(error)
            
        }
        
    }
}
