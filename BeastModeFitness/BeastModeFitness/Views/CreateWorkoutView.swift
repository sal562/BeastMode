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
    @StateObject var viewModel = CreateChallengeViewModel()
    
    
    ///computed property for dropdownList
    var dropdownList: some View {
        
        ///Group exercise choices
        Group {
            DropdownView(viewModel: $viewModel.exerciseDropdown)
            DropdownView(viewModel: $viewModel.startAmountDropdown)
            DropdownView(viewModel: $viewModel.increaseDropdown)
            DropdownView(viewModel: $viewModel.lengthDropdown)
        }
    }
    
    ///Main Content
    var mainContentView: some View {
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
                            .foregroundColor(.primary)
                    })
            }
        }
    }
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                mainContentView
            }
        }
        ///create alert incase of errror
        .alert(isPresented: Binding<Bool>.constant($viewModel.error.wrappedValue != nil), content: {
            ///to test error set permissions in Firestore to read only - allow read: if request.auth != null;
            Alert(title: Text("Error!"),
                  message: Text($viewModel.error.wrappedValue?.localizedDescription ?? ""),
                  dismissButton: .default(Text("Ok"),
                  action: {
                    viewModel.error = nil
        }))
        })
        .navigationTitle("Create a Workout")
        .navigationBarBackButtonHidden(true)
        .padding(.bottom, 20)
    }
}

struct CreateWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        CreateWorkoutView()
    }
}
