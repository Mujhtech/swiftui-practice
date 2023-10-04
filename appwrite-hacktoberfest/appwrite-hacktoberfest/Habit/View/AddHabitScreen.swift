//
//  AddHabitScreen.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//

import SwiftUI

struct AddHabitScreen: View {
    
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var habitViewModel: HabitViewModel
    @EnvironmentObject private var userViewModel: UserViewModel
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var habitIcon: String = "figure.walk"
    
    @State private var startDate: Date = .now
    @State private var endDate: Date = .now
    
    @State private var goals: Int? = nil
    
    @State private var taskRepeat: String? = nil
    
    let icons: [String] = [
        "figure.walk",
        "book.pages"
    ]
    
    let gridItems = [
        GridItem(.flexible(minimum: 50, maximum: 100), spacing: 16),
        GridItem(.flexible(minimum: 50, maximum: 100), spacing: 16),
        GridItem(.flexible(minimum: 50, maximum: 100), spacing: 16),
        GridItem(.flexible(minimum: 50, maximum: 100), spacing: 16),
    ]
    
    
    var body: some View {
        Form {
            Section("Title") {
                TextField("Habit Title", text: $title)
                TextField("Description", text: $description)
            }
            
            Section("Task") {
                
//                VStack(alignment: .leading, spacing: 5) {
//                    
//                    RadioButton(option: "Daily", taskRepeat: $taskRepeat)
//                    RadioButton(option: "Weekly", taskRepeat: $taskRepeat)
//                    RadioButton(option: "Monthly", taskRepeat: $taskRepeat)
//                    
//                }
               
                TextField("Goals", value: $goals, format: .number)
                    .keyboardType(.numberPad)
            }
            
            Section("Period") {
                DatePicker("Start", selection: $startDate, displayedComponents: .date)
                DatePicker("End", selection: $endDate, displayedComponents: .date)
            }
            
            Section("Icons") {
                
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(icons, id: \.self) { icon in
//                        Button {
//                            habitIcon = icon
//                        } label: {
                            Image(systemName: icon)
                                .renderingMode(.original)
                                .resizable()
                                .foregroundColor(habitIcon == icon ? .white : Theme.pink)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.all, 10)
                                .background((habitIcon == icon ? Theme.pink : .clear))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .onTapGesture {
                                    habitIcon = icon
                                }
                            
                        //}
                    }
                }
                
            }
            
            Button {
                Task {
                    
                    await habitViewModel.create(title, description, goals ?? 0, habitIcon, startDate.formatted(), endDate.formatted(), userViewModel.userState.userId!)
                    
                    router.pop()
                }
            } label: {
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
        HStack {
            Image(systemName: taskRepeat == option ? "largecircle.fill.circle" : "circle")
            Text(option)
        }
        .foregroundColor(taskRepeat == option ? .blue : .primary)
        .onTapGesture {
            taskRepeat = option
        }
    }
}

#Preview {
    AddHabitScreen()
}
