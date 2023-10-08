//
//  HomeScreen.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//

import SwiftUI

struct HomeScreen: View {
    
    
    @EnvironmentObject private var habitViewModel: HabitViewModel
    @EnvironmentObject private var router: Router
    @State var selectedDay: Int? = nil
    

        
    var currentMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        
        let currentDate = Date()
        return dateFormatter.string(from: currentDate)
    }
    
    
    var numberOfDaysInTheMonth: Int {
        
        let calendar = Calendar.current
        let currentDate = Date()
            
        // Get the range of days for the current month
        if let range = calendar.range(of: .day, in: .month, for: currentDate) {
            return range.count
        }
            
        // Default to 0 if the range cannot be determined
        return 0
        
    }
    
    
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Spacer(minLength: 15)
            
            if numberOfDaysInTheMonth > 0 {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1..<numberOfDaysInTheMonth, id: \.self) { index in
                            DateFilterView(month: currentMonth, day: index, selectedDay: $selectedDay)
                        }
                    }
                    .padding()
                }
                
            }
            
            
            ForEach(habitViewModel.habitState.habits) { habit in
                HabitCellView(habit: habit)
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom, 5)
            
        }
        .overlay {
            if habitViewModel.habitState.habits.isEmpty {
                ContentUnavailableView(label: {
                    Label("No habits", systemImage: "calendar")
                }, description: {
                    Text("Start adding habit to see your list")
                }, actions: {
                    Button("Add Habit") {
                        router.push(.add_habit)
                    }
                })
            }
        }
        
    }
}

#Preview {
    HomeScreen()
}
