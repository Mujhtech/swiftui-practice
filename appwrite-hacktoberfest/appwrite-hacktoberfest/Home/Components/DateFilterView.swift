//
//  DateFilterView.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//

import SwiftUI

struct DateFilterView: View {
    var month: String
    var day: Int
    @Binding var selectedDay: Int?
    
    
    var body: some View {
        Button {
            selectedDay = day
        } label: {
            VStack(spacing: 4) {
                Text(month)
                    .font(.system(size: 14))
                Text("\(day)")
                    .font(.system(size: 12))
                
            }
        }
        .frame(width: 50, height: 50)
        .background(selectedDay == day ? Theme.blue : Theme.blueLight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .foregroundColor(selectedDay == day ? .white : Theme.blue)
    }
}

//#Preview {
//    DateFilterView()
//}
