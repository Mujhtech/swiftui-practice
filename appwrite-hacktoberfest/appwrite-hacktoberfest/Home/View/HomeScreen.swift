//
//  HomeScreen.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            Spacer(minLength: 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(1..<10) { index in
                        DateFilterView()
                    }
                }
                .padding()
            }
            
            HStack(alignment: .bottom) {
                
                Text("Ongoing")
                    .multilineTextAlignment(.trailing)
                    .font(.system(size: 14))
                
            }
            
            
            ForEach(1..<21, id: \.self) { index in
                HabitCellView()
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom, 5)
        }
        
    }
}

#Preview {
    HomeScreen()
}
