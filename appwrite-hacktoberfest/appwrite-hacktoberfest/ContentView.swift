//
//  ContentView.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var router: Router
    
    
    var body: some View {
        NavigationStack(path: $router.routes) {
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
                            Text("October 2")
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
            .navigationDestination(for: Route.self, destination: { $0 })
            
        }
        
    }
}

//#Preview {
//    ContentView()
//}
