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
                
                VStack {
                    Text(viewModel.title)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Text(viewModel.statusText)
                    Text(viewModel.dailyIncreaseText)
                }
                
            }
        })
    }
}

struct ChallengeListView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeListView()
    }
}
