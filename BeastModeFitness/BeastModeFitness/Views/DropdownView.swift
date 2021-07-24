//
//  DropdownView.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct DropdownView<T: DropdownItemProtocol>: View {
    //MARK: - Properties - DropdownView
    @Binding var viewModel: T
    
    ///Create ActionSheet for each option type
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Select"), buttons: viewModel.options.map { option in

            return .default(Text(option.formatted)) {
                ///update view based on selected option
                viewModel.selectedOption = option
            }
        })
    }
    
    var body: some View {
        Section {
            VStack {
                HStack {
                    Text(viewModel.headerTitle)
                        .font(.system(size: 22, weight: .semibold, design: .rounded))
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.horizontal, 10)
                Button(action: {
                    ///update selected state when button is pressed
                    viewModel.isSelected = true
                }, label: {
                    HStack {
                        Text(viewModel.dropdownTitle)
                            .font(.system(size: 28, weight: .semibold, design: .rounded))
                        Spacer()
                        Image(systemName: "arrowtriangle.down.square")
                            .font(.system(size: 38, weight: .regular, design: .rounded))
                            .foregroundColor(.primary)
                    }
                    
                })//button
                .buttonStyle(MainButtonCustomStyle(fillColor: .primaryButton))
                .padding(.horizontal, 10)
            }//vStack
            .padding(10)
            .navigationBarTitle("Pick an Exercise")
            /// actionSheet modifier add action sheet binded to if isSelected is true
            .actionSheet(isPresented: $viewModel.isSelected) {
                actionSheet
            }
        }
    }
}

//struct WorkoutPlanView_Previews: PreviewProvider {
//    static var previews: some View {
//        //light Mode
//        NavigationView {
//            DropdownView()
//        }
//        
//        NavigationView {
//            WorkoutPlanSelectionView()
//        }.environment(\.colorScheme, .dark)
//    }
//}
