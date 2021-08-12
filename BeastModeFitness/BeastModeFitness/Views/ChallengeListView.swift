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
        LazyVGrid(columns: [.init(.flexible()),.init(.flexible())], content: {
            
            ///loop through view.itemViewModels
            ForEach(viewModel.itemViewModels, id:\.self) { viewModel in
                
                //Call ChallengeItemView
                ChallengeItemView(viewModel: viewModel)
                
            }
        })
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
        
        ///add Hstack to wrap inner vStack - hacky way to push view size to max screen allowance
        HStack {
            Spacer()
            VStack {
                Text(viewModel.title)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                Text(viewModel.statusText)
                Text(viewModel.dailyIncreaseText)
            }///end of vstack
            Spacer()
            .padding()
            .background(Rectangle()
                            .fill(Color.darkPrimaryColor))
            .padding()
        }
    }
}
