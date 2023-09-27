//
//  ContentView.swift
//  weatherApp
//
//  Created by Muhideen Mujeeb Adeoye on 27/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            WeatherBgView()
            VStack{
                
            }
        }
        .ignoresSafeArea()
    }
}


struct WeatherBgView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}



#Preview {
    ContentView()
}
