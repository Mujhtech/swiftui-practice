//
//  HabitCellView.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//

import SwiftUI

struct HabitCellView: View {
    
    @Environment(\.colorScheme) private var theme
    
    
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Theme.pink
                .frame(width: UIScreen.main.bounds.width / 2)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack(spacing: 10) {
                HStack {
                    
                    Image(systemName: "figure.walk")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.white)
                        .padding(.all, 3)
                        .frame(width: 30, height: 30)
                        .background(.blue.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 99))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Studying")
                            .font(.system(size: 16))
                        Text("0/10")
                            .font(.system(size: 12))
                    }
                    
                }
                Spacer()
                Button {} label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                }
                
            }
            .padding(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20))
            
        }
        .background(theme == .dark ? .white.opacity(0.2) : .white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 4, y: 4)

        
    }
}

#Preview {
    HabitCellView()
}
