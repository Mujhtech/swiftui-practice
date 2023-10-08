//
//  HomeView.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 03/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var habitViewModel: HabitViewModel
    
    var currentDate: Date {
        return Date()
    }
        
    var formattedDate: String {
        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .long
//        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MMMM d, yyyy"
        return dateFormatter.string(from: currentDate)
    }
    
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            
            HomeScreen()
                .onTapGesture { router.selectedTab = .home }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tabs.home)
            ProgressScreen()
                .onTapGesture { router.selectedTab = .progress }
                .tabItem {
                    Label("Progress", systemImage: "chart.bar.xaxis")
                }
                .tag(Tabs.progress)
            SettingScreen()
                .onTapGesture { router.selectedTab = .setting }
                .tabItem {
                    Label("Setting", systemImage: "gearshape")
                }
                .tag(Tabs.setting)
            
            
        }
        .toolbar {
            switch router.selectedTab {
            case .home:
                ToolbarItem(placement: .topBarLeading) {
                    VStack(alignment: .leading){
                        Text("Today")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("\(formattedDate)")
                            .font(.caption)
                            .fontWeight(.medium)
                    }
                    
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        router.push(.add_habit)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            case .progress:
                ToolbarItem(placement: .topBarLeading) {
                    Text("Progress")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            case .setting:
                
                ToolbarItem(placement: .topBarLeading) {
                    Text("Setting")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                
            }
        }
        .task {
            await habitViewModel.fetchHabits()
        }
        .navigationBarBackButtonHidden(true)
        .blur(radius: habitViewModel.selectedHabitState.isSelected ? 20 : 0)
        
        if habitViewModel.selectedHabitState.isSelected {
            UpdateHabitView()
        }
    }
}

#Preview {
    HomeView()
}
