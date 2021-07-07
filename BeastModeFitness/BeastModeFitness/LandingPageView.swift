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
    
    var body: some View {
       
        ZStack {
           Image("beastmodeBackground")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Text("BEAST MODE")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .animation(.easeInOut)
                
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
                        .background(Color.black)
                        .opacity(0.8)
                        .shadow(radius: 10)
                    })
            }
            .onAppear(perform: {
                titleIsAnimating.toggle()
            })
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
