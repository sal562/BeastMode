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
    
    var body: some View {
        
        ///Create Grid to show challenges - 2 grid Items per row
        ScrollView {
            VStack {
                LazyVGrid(columns: [.init(.flexible()),.init(.flexible())]) {
                    ///loop through view.itemViewModels
                    ForEach(viewModel.itemViewModels, id:\.self) { viewModel in
                        //Call ChallengeItemView
                        ChallengeItemView(viewModel: viewModel)
                    }
                }
                ///To push challenge onject view to the top
                Spacer()
            }
        }
        .navigationTitle(viewModel.title)
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
    
    var body: some View {
        HStack {
            Spacer()
        VStack {
            Text(viewModel.title)
                .font(.system(size: 24, weight: .bold, design: .rounded))
            Text(viewModel.statusText)
            Text(viewModel.dailyIncreaseText)
        }///end of vstack
        .padding()
            Spacer()
        }///end of Hstack

        .background(Rectangle()
                        .fill(Color.darkPrimaryColor)
                        .cornerRadius(6))
        
        .padding()
        
    }
}
