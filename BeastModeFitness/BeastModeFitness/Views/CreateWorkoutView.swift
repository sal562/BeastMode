//
//  CreateWorkoutView.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct CreateWorkoutView: View {
    
    @State private var isActive = false
    
    @StateObject var viewModel = CreateChallengeViewModel()
    
    ///computed property for dropdownList
    var dropdownList: some View {
        ForEach(viewModel.dropdowns.indices, id: \.self) { index in
//            DropdownView(viewModel: $viewModel.dropdowns[index])
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
//                DropdownView()
//                DropdownView()
//                DropdownView()
//                DropdownView()
                dropdownList
                Spacer()
                //create navLink using nextButton
                NavigationLink(
                    destination: ReminderView(),
                    isActive: $isActive) {
                    Button(action: {
                        //Next Page
                        isActive.toggle()
                    }, label: {
                        Text("Next")
                            .font(.system(size: 24, weight: .semibold, design: .rounded))
                    })
                    .buttonStyle(MainButtonCustomStyle())
                    .padding(.horizontal, 20)
                }
            }
            .navigationTitle("Create a Workout")
            .navigationBarBackButtonHidden(true)
            .padding(.bottom, 20)
        }
    }
}

struct CreateWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        CreateWorkoutView()
    }
}
