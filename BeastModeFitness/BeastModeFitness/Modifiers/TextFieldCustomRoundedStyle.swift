//
//  TextFieldCustomRoundedStyle.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/18/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

/*
 to call on view
 ///add custom modifier
 .modifier(TextFieldCustomRoundedStyle())
 */

struct TextFieldCustomRoundedStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 16, weight: .medium, design: .rounded))
            .foregroundColor(.primary)
            .padding()
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.primary))
            .padding(.horizontal, 15)
    }
}
