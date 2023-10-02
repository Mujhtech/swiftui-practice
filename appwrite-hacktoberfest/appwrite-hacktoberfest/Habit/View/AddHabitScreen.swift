//
//  AddHabitScreen.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//

import SwiftUI

struct AddHabitScreen: View {
    
    @EnvironmentObject private var router: Router
    @State private var title: String = ""
    @State private var description: String = ""
    
    @State private var startDate: Date = .now
    @State private var endDate: Date = .now
    
    @State private var goals: Int? = nil
    
    @State private var taskRepeat: String? = nil
    
    
    var body: some View {
        Form {
            Section("Title") {
                TextField("Habit Title", text: $title)
                TextField("Description", text: $description)
            }
            
            Section("Task") {
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    RadioButton(option: "Daily", taskRepeat: $taskRepeat)
                    RadioButton(option: "Weekly", taskRepeat: $taskRepeat)
                    RadioButton(option: "Monthly", taskRepeat: $taskRepeat)
                    
                }
               
                TextField("Goals", value: $goals, format: .number)
                    .keyboardType(.numberPad)
            }
            
            Section("Period") {
                DatePicker("Start", selection: $startDate, displayedComponents: .date)
                DatePicker("End", selection: $endDate, displayedComponents: .date)
            }
            
            Button {} label: {
                Text("Create Habit")
            }
        }
        .navigationTitle("New habit")
        
    }
}


struct RadioButton: View {
    var option: String
    @Binding var taskRepeat: String?

    var body: some View {
        Button{
            taskRepeat = option
        } label: {
            HStack {
                Image(systemName: taskRepeat == option ? "largecircle.fill.circle" : "circle")
                Text(option)
            }
        }
        .foregroundColor(taskRepeat == option ? .blue : .primary)
    }
}

#Preview {
    AddHabitScreen()
}
