//
//  UpdateHabitView.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 04/10/2023.
//

import SwiftUI

struct UpdateHabitView: View {
    
    @EnvironmentObject private var habitViewModel: HabitViewModel
    @State private var goalCompleted: Int = 1
    
    
    
    
    var body: some View {
        VStack {
            
            Image(systemName: habitViewModel.selectedHabitState.habit?.icon ?? "calendar")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Theme.blue)
                .padding(.all, 10)
                .frame(width: 100, height: 100)
                .background(Theme.blueLight)
                .clipShape(RoundedRectangle(cornerRadius: 99))
        
            
                Text("Goal Completed")
                    .font(.caption)
                    .padding(.bottom, 20)
                
                Button {
                    Task {
                        
                        
                        
                        if habitViewModel.selectedHabitState.habit != nil && goalCompleted < habitViewModel.selectedHabitState.habit!.goals! {
                            
                            let data: Int = goalCompleted + (habitViewModel.selectedHabitState.habit!.goalCompleted ?? 0)
                            
                            await habitViewModel.update(habitViewModel.selectedHabitState.habit!.id!, data)
                            
                            // Update record
                            await habitViewModel.fetchHabits()
                            
                            habitViewModel.selectedHabitState = SelectedHabitState()
                            
                        }
                        
                    }
                } label: {
                    Text("Update Habit")
                }
                
        }
        .frame(width: 300, height: 300)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 20)
        .overlay(alignment: .topTrailing) {
            Button {
                habitViewModel.selectedHabitState = SelectedHabitState()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.white)
                        .opacity(0.6)
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .frame(width: 44, height: 44)
                        .foregroundStyle(.black)
                    
                }
            }
        }
    }
}

#Preview {
    UpdateHabitView()
}
