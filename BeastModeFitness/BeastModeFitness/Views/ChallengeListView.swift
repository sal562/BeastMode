//
//  ChallengeListView.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/8/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct ChallengeListView: View {
    //MARK: - Properties
    @StateObject private var viewModel = ChallengeListViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        
        ZStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.error {
                
                VStack {
                    Text(error.localizedDescription)
                    Button(action: {
                        ///send retry action in case of failure
                        viewModel.send(action: .retry)
                    }, label: {
                        Text("Retry")
                    })
                    .padding(10)
                    .background(Rectangle().fill(Color.red)
                    .frame(width: 150, height: 50)
                    .cornerRadius(5)
                    .shadow(radius: 5))
                }
            } else {
                mainContentView
            }
        }
    }
    
    var mainContentView: some View {
        
        ///Create Grid to show challenges - 2 grid Items per row
        ScrollView {
            VStack {
                ///spacing is for horizontal and vertical spacing between 2 gridItems (each row)
                LazyVGrid(columns: [.init(.flexible(), spacing: 20),.init(.flexible(), spacing: 20)]) {
                    ///loop through view.itemViewModels
                    ForEach(viewModel.itemViewModels, id:\.self) { viewModel in
                        //Call ChallengeItemView
                        ChallengeItemView(viewModel: viewModel)
                    }
                }
                ///To push challenge onject view to the top
                Spacer()
            }
            .padding(10)
        }
        ///Present Sheet to Add New Challenge -
        .sheet(isPresented: $viewModel.showingCreateModal, content: {
            NavigationView {
                CreateWorkoutView()
                ///Must give colorSchime if using isPresented
            }.preferredColorScheme(isDarkMode ? .dark : .light)
        })
        
        .navigationTitle(viewModel.title)
        ///add plus button
        .navigationBarItems(trailing: Button(action: {
            ///ADD NEW CHALLENGE
            viewModel.send(action: .create)
        }, label: {
            Image(systemName: "plus.app")
//                .imageScale(.large)
                .resizable()
                .frame(width: 30, height: 30)
        }))
    }
}

//struct ChallengeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChallengeListView()
//    }
//}


struct ChallengeItemView: View {
    
    private let viewModel: ChallengeItemViewModel
    ///Need to initialzie viewModel if using "Private"
    init(viewModel: ChallengeItemViewModel) {
        self.viewModel = viewModel
    }

    ///created TitleView as seperateView
    var TitleRow: some View {
        HStack {
            Text(viewModel.title)
                .font(.system(size: 24, weight: .bold, design: .rounded)).allowsTightening(true)
            Spacer()
            Button(action: {
                ///trash challenge
            }, label: {
                Image(systemName: "trash")
                    .resizable()
                    .frame(width: 20, height: 20)
            })
        }
    }
    
    ///create seperate EndRow
    var DailyIncreaseRow: some View {
        HStack(alignment: .center) {
            Text(viewModel.dailyIncreaseText)
                .font(.system(size: 24, weight: .bold, design: .rounded)).allowsTightening(true)
        }
    }

    
    var body: some View {
        HStack {
            Spacer()
        VStack {
            TitleRow
            Spacer()
            HStack(alignment: .center) {
                Text(viewModel.statusText)
                    .font(.system(size: 12, weight: .regular, design: .rounded)).allowsTightening(true)
            }
            Spacer()
            DailyIncreaseRow
        }///end of vstack
        .padding(.vertical, 10)
            Spacer()
        }///end of Hstack

        .background(Rectangle()
                        .fill(Color.primaryButton)
                        .cornerRadius(6))
    }
}

