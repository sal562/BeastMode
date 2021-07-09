//
//  WorkoutPlanSelectionView.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct WorkoutPlanSelectionView: View {
    //MARK: - Properties
    
    var body: some View {
        Section {
            VStack {
                HStack {
                    Text("Exercise")
                        .font(.system(size: 22, weight: .semibold, design: .rounded))
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.horizontal, 10)
                Button(action: {
                    //ADD EXERCISE HERE
                }, label: {
                    HStack {
                        Text("Pullups")
                            .font(.system(size: 28, weight: .semibold, design: .rounded))
                        Spacer()
                        Image(systemName: "arrowtriangle.down.square")
                            .font(.system(size: 38, weight: .regular, design: .rounded))
                            .foregroundColor(.primary)
                    }
                    
                })//button
                .buttonStyle(MainButtonCustomStyle(fillColor: .primaryButton))
                .padding(.horizontal, 20)
            }//vStack
            .padding(10)
            .navigationBarTitle("Pick an Exercise")
        }
    }
}

struct WorkoutPlanView_Previews: PreviewProvider {
    static var previews: some View {
        //light Mode
        NavigationView {
            WorkoutPlanSelectionView()
        }
        
        NavigationView {
            WorkoutPlanSelectionView()
        }.environment(\.colorScheme, .dark)
    }
}
