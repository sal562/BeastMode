//
//  WorkoutPlanView.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct WorkoutPlanView: View {
    //MARK: - Properties
    
    var body: some View {
        VStack {
            Section {
                Text("Exercise")
                HStack {
                    Text("PullUps")
                    Spacer()
                    Button(action: {
                        //Pick exercise
                    }, label: {
                        Image(systemName: "arrowtriangle.down.square")
                    })
                }
                .padding()
            }
            .background(Color.gray.opacity(0.4))
        }
        .navigationBarTitle("Pick an Exercise")
    }
}

struct WorkoutPlanView_Previews: PreviewProvider {
    static var previews: some View {
        //light Mode
        NavigationView {
            WorkoutPlanView()
        }
        
        NavigationView {
            WorkoutPlanView()
        }.environment(\.colorScheme, .dark)
    }
}
