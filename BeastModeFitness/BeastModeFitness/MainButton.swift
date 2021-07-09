//
//  MainButton.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct MainButtonCustomStyle: ButtonStyle {
    
    var fillColor: Color = .darkPrimaryColor
    func makeBody(configuration: Configuration) -> some View {
        return MainButton(configuration: configuration, fillColor: fillColor)
    }
    struct MainButton: View {
        let configuration: Configuration
        let fillColor: Color
        
        var body: some View {
            return configuration.label
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 8).fill(fillColor))
                
        }
    }
}

struct MainButtonCustomStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            //button action
        }, label: {
            Text("Add a Workout")
        }).buttonStyle(MainButtonCustomStyle())
    }
}
