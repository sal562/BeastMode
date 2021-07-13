//
//  LandingPageView.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/7/21.
//

import SwiftUI

/*
 Current Issues
 no color consistency - create theme with light and dark mode
 add haptic feedback
 Unable to select multiple options check closures
 */

struct LandingPageView: View {
    
    //MARK: - Properties
    @State private var titleIsAnimating = false
    @State private var scaledAmount = false
    
    @State private var selection: Int? = nil
    
    var body: some View {
                   
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Spacer().frame(height: geometry.size.height * 0.09)
                    Text("BEAST MODE")
                        .font(.system(size: 48, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    
                    NavigationLink(
                        destination: CreateWorkoutView(),
                        tag: 1,
                        selection: $selection) {
                        Button(action: {
                            ///start a workout
                            selection = 1
                        }, label: {
                            HStack(alignment: .center,spacing: 8) {
                                Image(systemName: "plus.square")
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                Text("Start A Workout")
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                            }//end of hstack
                            .frame(width: 300, height: 60)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .shadow(radius: 10)
                        })
                        ///end of button
                        .cornerRadius(12.0)
                    }
                } /// Root VStack
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Image("beastmodeBackground")
                        .resizable()
                        .scaledToFill()
                        .overlay(Color.black.opacity(0.4))
                        //centers image in middle
                        .frame(width: geometry.size.width)
                        .edgesIgnoringSafeArea(.all)
                )
                .onAppear(perform: {
                    ///disabled animation for testing
                    titleIsAnimating.toggle()
                })
            } ///end of NavView
            .accentColor(.primary)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
///        LandingPageView().previewDevice(PreviewDevice(rawValue: "iPhone 7"))
///        LandingPageView().previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
        LandingPageView()
    }
}
