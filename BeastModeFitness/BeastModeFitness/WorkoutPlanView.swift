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
                HStack {
                    Text("PullUps")
                    Spacer()
                    Button(action: {
                        //Pick exercise
                    }, label: {
                        Image(systemName: "chevron.down.circle")
                    })
                }
                .padding()
            }
        }.navigationBarTitle("HOOO")
        
    }
}

struct WorkoutPlanView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutPlanView()
    }
}
