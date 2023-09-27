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
                .ignoresSafeArea()
            VStack(){
               LocationView(location: "Cupertino, CA")
               
                MainWeatherView(temperature: 50, imageName: "cloud.sun.fill")
                    .padding(.bottom, 60)
                
                HStack(spacing: 20){
                    WeatherDayView(day: "Tue", imageName: "sun.snow.fill", temperature: 10)
                    WeatherDayView(day: "Wed", imageName: "cloud.drizzle.fill", temperature: 20)
                    WeatherDayView(day: "Thur", imageName: "cloud.sun.fill", temperature: 10)
                    WeatherDayView(day: "Fri", imageName: "cloud.fog.fill", temperature: 5)
                    WeatherDayView(day: "Sat", imageName: "cloud.sun.rain.fill", temperature: 50)
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("Change Location")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                Spacer()
            }
        }
        
    }
}

struct LocationView: View {
    let location: String
    
    var body: some View {
        Text(location)
            .foregroundStyle(.white)
            .font(.system(size: 28, weight: .medium, design: .default))
    }
}


struct WeatherBgView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct MainWeatherView: View {
    let temperature: Int
    let imageName: String
    
    
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
        
            
            Text("\(imageName)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
                
        }
    }
}

struct WeatherDayView: View {
    
    let day: String
    let imageName: String
    let temperature: Int


    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text(day)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}



#Preview {
    ContentView()
}
