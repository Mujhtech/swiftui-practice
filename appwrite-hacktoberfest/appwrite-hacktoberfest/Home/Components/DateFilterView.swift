//
//  DateFilterView.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//

import SwiftUI

struct DateFilterView: View {
    var body: some View {
        Button {} label: {
            VStack(spacing: 4) {
                Text("Oct")
                    .font(.system(size: 14))
                Text("4")
                    .font(.system(size: 12))
                
            }
        }
        .frame(width: 50, height: 50)
        .background(Theme.blueLight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    DateFilterView()
}
