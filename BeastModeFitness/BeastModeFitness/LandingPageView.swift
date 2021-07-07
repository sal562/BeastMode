//
//  LandingPageView.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/7/21.
//

import SwiftUI

struct LandingPageView: View {
    var body: some View {
       
        ZStack {
           Image("s")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Text("BeastMode")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Spacer()
                
                    Button(action: {
                        //start a workout
                    }, label: {
                        
                        HStack(spacing: 20) {
                        Image(systemName: "plus.square")
                            .font(.title)
                        Text("Start A Workout")
                        }
                        .frame(width: 250, height: 60)
                        .cornerRadius(12)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .opacity(0.80)
                    })
            }
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
