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
 background image shifting to right
 title low and off center
 back button using default blue
 
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
                        Spacer()
                        Text("BEAST MODE")
                            .font(.system(size: 48, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                            .animation(.easeInOut)
                            .scaleEffect(scaledAmount ? 0.25 : 1.0)
                            .offset(y: -250.0)
                        
                        Spacer()
                        
                    NavigationLink(
                        destination: WorkoutPlanView(),
                        tag: 1,
                        selection: $selection) {
                        Button(action: {
                                    //start a workout
                                    selection = 1
                                }, label: {
                                    
                                    HStack(spacing: 20) {
                                    Image(systemName: "plus.square")
                                        .font(.title)
                                    Text("Start A Workout")
                                    }//end of hstack
                                    .frame(width: 300, height: 60)
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .shadow(radius: 10)
                                })
                                //end of button
                        .cornerRadius(12.0)
                    }
                    } // Root VStack
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        Image("beastmodeBackground")
                         .resizable()
                         .scaledToFill()
                         .edgesIgnoringSafeArea(.all)
                    )
                    .onAppear(perform: {
                        titleIsAnimating.toggle()
                })
            }
        }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        LandingPageView().previewDevice(PreviewDevice(rawValue: "iPhone 7"))
//        LandingPageView().previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
        LandingPageView()
    }
}
