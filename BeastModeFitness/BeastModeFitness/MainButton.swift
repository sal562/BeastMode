//
//  MainButton.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct MainButtonCustomStyle: ButtonStyle {
    
    var fillColor: Color = .darkPrimaryButton
    
    func makeBody(configuration: Configuration) -> some View {
        return MainButton(configuration: configuration)
    }
    
    
    
    struct MainButton: View {
        let configuration: Configuration
        let fillColor: Color
        
        var body: some View {
            return configuration.label
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 8))
                .fillColor(fillColor)
        }
    }
}

