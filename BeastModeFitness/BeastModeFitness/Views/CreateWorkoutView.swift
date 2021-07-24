//
//  CreateWorkoutView.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct CreateWorkoutView: View {
    //MARK: - Properties
//    @State private var isActive = false
    @StateObject var viewModel = CreateChallengeViewModel()
    
    ///computed property for dropdownList
    var dropdownList: some View {
        ForEach(viewModel.dropdowns.indices, id: \.self) { index in
            DropdownView(viewModel: $viewModel.dropdowns[index])
        }
    }
    
    ///create actionSheets for each option type
//    var actionSheet: ActionSheet {
//        ActionSheet(title: Text("Select"), buttons: viewModel.displayedOptions.indices.map { index in
//            let option = viewModel.displayedOptions[index]
//            return .default(Text(option.formatted)) {
//                viewModel.send(action: .selectOption(index: index))
//            }
//        })
//    }
    
    var body: some View {
        ScrollView {
            VStack {
                ///instanciate dropdownlist
                dropdownList
                Spacer()
                ///create navLink using nextButton - REMOVE NAVLINK FOR TESTING
                    Button(action: {
                        ///Next Page - Creae Challenge
                        viewModel.send(action: .createChallenge)
                    }, label: {
                        Text("Create")
                            .font(.system(size: 24, weight: .semibold, design: .rounded))
                    })
            }
            ///add action sheet for selections
//            .actionSheet(isPresented: Binding<Bool>(get: {
//                viewModel.hasSelectedDropdown
//            }, set: { _ in
//            }), content: {
//                actionSheet
//            })
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
