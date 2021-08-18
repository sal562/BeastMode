//
//  LoginSignupPageView.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/18/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct LoginSignupPageView: View {
    
    @ObservedObject var loginSignupVM: LoginSignupViewModel
    
    
    var body: some View {
        VStack {
            Text(loginSignupVM.title)
                .font(.title)
                .fontWeight(.bold)
            Text(loginSignupVM.subTitle)
                .font(.title2)
                .foregroundColor(.secondary)
            
            Section {
                VStack {
                    TextField("Email", text: $loginSignupVM.emailText)
                        .padding()
                        .border(Color.secondary, width: 1)
                        .frame(width: 300, height: 60)
                        
                   
                    SecureField("Password", text: $loginSignupVM.passwordText)
                        .padding()
                        .frame(width: 300, height: 60)
                        .border(Color.secondary, width: 1)
                }

  
                ///Button
                Button(action: {
                    //LOGIN
                }, label: {
                    HStack(alignment: .center,spacing: 8) {
                        Image(systemName: "lock")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                        Text("Login")
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
            .padding(.horizontal)
            Spacer()
        }
        .navigationTitle("")
    }
}

struct LoginpageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginSignupPageView(loginSignupVM: .init(mode: .login))
        }
    }
}
