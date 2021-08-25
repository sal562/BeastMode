//
//  LoginSignupPageView.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/18/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct LoginSignupPageView: View {
    
    @StateObject var loginSignupVM: LoginSignupViewModel
    
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
                        ///add custom modifier
                        .modifier(TextFieldCustomRoundedStyle())
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    SecureField("Password", text: $loginSignupVM.passwordText)
                        ///add custom modifier
                        .modifier(TextFieldCustomRoundedStyle())
                }
                .padding(.top, 40)
                ///Button
                Button(action: {
                    //LOGIN
                    loginSignupVM.tappedSigninActionButton()
                }, label: {
                    HStack(alignment: .center,spacing: 8) {
                        Image(systemName: loginSignupVM.iconImage)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                        Text(loginSignupVM.buttonText)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                    }//end of hstack
                    .frame(width: 320, height: 60)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .shadow(radius: 10)
                    ///disable button if email or pass is invalid
                    .disabled(!loginSignupVM.isValid)
                    .opacity(loginSignupVM.isValid ?  1 : 0.4)
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
            LoginSignupPageView(loginSignupVM: .init(mode: .login, isPushed: .constant(false)))
        }
    }
}
