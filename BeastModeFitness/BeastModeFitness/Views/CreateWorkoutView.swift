//
//  CreateWorkoutView.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct CreateWorkoutView: View {
    var body: some View {
        VStack {
            WorkoutPlanSelectionView()
            WorkoutPlanSelectionView()
            WorkoutPlanSelectionView()
            WorkoutPlanSelectionView()
            Spacer()
        }
        .navigationTitle("Create a Workout")
    }
}

struct CreateWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        CreateWorkoutView()
    }
}
