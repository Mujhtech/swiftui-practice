//
//  SnackbarView.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 03/10/2023.
//

import SwiftUI

struct SnackbarView: View {
    @State private var isAnimating: Bool = false
    @State var text: String
    @State var isError: Bool = true
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(.white)
                .lineLimit(1...2)
                .multilineTextAlignment(.leading)
                .padding()
        }
        .background(isError ? .red : Color.accentColor)
        .cornerRadius(10)
        .padding(.top, 15)
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? -20 : 20)
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                isAnimating.toggle()
            }
        }
    }
}
