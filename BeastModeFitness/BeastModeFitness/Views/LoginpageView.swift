//
//  LoginpageView.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/18/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct LoginpageView: View {
    
    @State var email: String
    @State var password: String
    
    var body: some View {
        VStack {
            Text("Welcome, Back!")
                .font(.title)
                .fontWeight(.bold)
            Text("Log in to your account")
                .font(.title2)
                .foregroundColor(.secondary)
            
            Section {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                
            }
        }
    }
}

struct LoginpageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginpageView()
    }
}
