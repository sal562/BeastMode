//
//  LandingPageView.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/7/21.
//

import SwiftUI

struct LandingPageView: View {
    
    //MARK: - Properties
    @State private var titleIsAnimating = false
    @State private var scaledAmount = false
    
    var body: some View {
                   
            VStack {
                Spacer()
                Text("BEAST MODE")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .animation(.easeInOut)
                    .scaleEffect(scaledAmount ? 0.25 : 1.0)
                
                Spacer()
                
                    Button(action: {
                        //start a workout
                    }, label: {
                        
                        HStack(spacing: 20) {
                        Image(systemName: "plus.square")
                            .font(.title)
                        Text("Start A Workout")
                        }
                        .frame(width: 300, height: 60)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .shadow(radius: 10)
                    })
            }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
