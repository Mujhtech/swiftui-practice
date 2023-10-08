//
//  HabitCellView.swift
//  appwrite-hacktoberfest
//
//  Created by Muhideen Mujeeb Adeoye on 02/10/2023.
//

import SwiftUI

struct HabitCellView: View {
    
    @Environment(\.colorScheme) private var theme
    @EnvironmentObject private var habitViewModel: HabitViewModel
    
    var habit: HabitModel
    
    
    var isCompleted: Bool {
        
        let totalGoal : Int = habit.goals ?? 0;
        let goalCompleted : Int = habit.goalCompleted ?? 0;
        
        if totalGoal == 0 || totalGoal == goalCompleted {
            return true
        } else {
            return false
        }
        
    }
    
    
    var width : CGFloat {
        
        let totalGoal : Int = habit.goals ?? 0;
        let goalCompleted : Int = habit.goalCompleted ?? 0;
        
        let screenWidth : CGFloat = UIScreen.main.bounds.width
        
        if totalGoal == 0 {
            return screenWidth
        }
        
        if totalGoal > 0 && goalCompleted == 0 {
            return 0
        }
        
        return (screenWidth / CGFloat(totalGoal)) * CGFloat(goalCompleted)
    }
    
    
    
    
    
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Theme.pink
                .frame(width: width)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack(spacing: 10) {
                HStack {
                    
                    Image(systemName: habit.icon)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Theme.blue)
                        .padding(.all, 3)
                        .frame(width: 30, height: 30)
                        .background(Theme.blueLight)
                        .clipShape(RoundedRectangle(cornerRadius: 99))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(habit.title)
                            .font(.system(size: 16))
                        Text("\(habit.goalCompleted ?? 0)/\(habit.goals ?? 0)")
                            .font(.system(size: 12))
                    }
                    
                }
                Spacer()
                
                if isCompleted == false {
                    
                    Button {
                        
                        habitViewModel.selectedHabitState = SelectedHabitState(habit: habit, isSelected: true)
                        
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(theme == .dark ? .white : .black)
                    }
                    
                }
               
                
            }
            .padding(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20))
            
        }
        .background(theme == .dark ? .white.opacity(0.2) : .white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 4, y: 4)

        
    }
}

//#Preview {
//    HabitCellView()
//}
