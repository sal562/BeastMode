//
//  ReminderView.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct ReminderView: View {
    //MARK: - Properties
    
    var body: some View {
        VStack {
            Spacer()
            WorkoutPlanSelectionView()
            
            Spacer()

                Button(action: {}, label: {
                    HStack(spacing: 10) {
                    Image(systemName: "clock.arrow.2.circlepath")
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                    Text("Create New Reminder")
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                        .foregroundColor(.primary)
                    }})
                .buttonStyle(MainButtonCustomStyle())
         
            
            Button(action: {}, label: {
                Text("Skip Reminders for Now")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    .foregroundColor(.primary)
            })
            .buttonStyle(MainButtonCustomStyle())
        }
        .navigationTitle("Reminders")
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
