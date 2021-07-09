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
                Text("Create")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
            })
            .buttonStyle(MainButtonCustomStyle())
            
            Button(action: {}, label: {
                Text("Skip Reminders for Now")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
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
