//
//  ProgressCircleView.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/21/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

///REQUIRES 2 custom colors for light and dark mode + outline CircleOutline,CircleTrack

///save custom color as extension
//extension Color {
//    static let darkPrimaryColor = Color(red: 110/255, green: 155/255, blue: 195/255, opacity: 0.3)
//    static let primaryButton = Color("primaryButton")
//    static let circleOutline = Color("CircleOutline")
//    static let circleTrack = Color("CircleTrack")
//
//}

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
    
    ///state for animation
    @State private var percentage: CGFloat = 0
    
    var body: some View {
        
        ///circle inside a circle
        ZStack {
            ///outside circle
            Circle()
                .stroke(style: .init(lineWidth: 10, lineCap: .round, lineJoin: .round))
                ///use customColor for circle outline
//                .fill(Color("CircleOutline"))///Hard Coded - use constants
                .fill(Color.circleOutline)
            
            ///Circle Tract
            Circle()
                ///use trim to show progress bases on double
//                .trim(from: 0, to: CGFloat(progressCircleVM.percentageComplete))
                ///if animating use @StateVariable
                .trim(from: 0, to: percentage)
                
                
                .stroke(style: .init(lineWidth: 10, lineCap: .round, lineJoin: .round))
                ///use customColor for circle outline
                .fill(Color.circleTrack)
                ///change the location of the start
                .rotationEffect(.init(degrees: -90))
            
            VStack {
                if progressCircleVM.shouldKnowTitleAfterDone {
                    Text(progressCircleVM.title)
                }
                Text(progressCircleVM.message)
            }.padding(25)
            .font(Font.caption.weight(.semibold))
        }
        ///on appear for set to percentage - animated
        .onAppear(perform: {
            withAnimation(.spring(response: 5)) {
                percentage = CGFloat(progressCircleVM.percentageComplete)
            }
        })
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(progressCircleVM: .init(title: "Day", message: "3 of 7", percentageComplete: 0.45))
            .frame(width: 300, height: 300)
            .preferredColorScheme(.dark) //FOR TESTING DARK MODE
    }
}
