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
    var body: some View {
        Circle()
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView()
    }
}
