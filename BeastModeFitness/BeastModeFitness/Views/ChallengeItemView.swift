//
//  ChallengeItemView.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/22/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

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
//                Text(viewModel.statusText)
//                    .font(.system(size: 12, weight: .regular, design: .rounded)).allowsTightening(true)
                ///use progress Cirvle view
                ProgressCircleView(progressCircleVM: viewModel.progressCircleVM)
                    .padding(.vertical, 25)
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


struct ChallengeItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeItemView(viewModel: ChallengeItemViewModel.)
    }
}