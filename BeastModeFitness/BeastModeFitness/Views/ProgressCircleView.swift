//
//  ProgressCircleView.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/21/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct ProgressCircleViewModel {
    let title: String
    let message: String
    let percentageComplete: Double
    var shouldKnowTitleAfterDone: Bool {
        percentageComplete <= 1
    }
}

struct ProgressCircleView: View {
    ///.progressCircleVM
    let progressCircleVM: ProgressCircleViewModel
    
    var body: some View {
        
        ///circle inside a circle
        ZStack {
            ///outside circle
            Circle()
                .stroke(style: .init(lineWidth: 10, lineCap: .round, lineJoin: .round))
        }
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(progressCircleVM: .init(title: "Day", message: "3 of 7", percentageComplete: 0.43))
    }
}
