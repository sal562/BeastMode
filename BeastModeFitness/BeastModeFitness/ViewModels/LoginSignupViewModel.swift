//
//  LoginSignupViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/18/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation

final class LoginSignupViewModel: ObservableObject {
    
    @Published var emailText =  ""
    @Published var passwordText = ""
    @Published var isValid = false
    
    private let mode: Mode
    
    ///init custom enum for mode
    init(mode: Mode) {
        self.mode = mode
    }
    
    var title: String {
        switch mode {
        case .login:
            return "Welcome Back!"
        case .signup:
            return "Create an Account"
        }
    }
    
    var subTitle: String {
        switch mode {
        case .login:
            return "Login with your email"
        case .signup:
            return "Signup via email"
        }
    }
    
    ///login button icon
    var iconImage: String {
        switch mode {
        case .login:
            return "lock.square"
        case .signup:
            return "person.badge.plus"
        }
    }
    
    ///login button text
    var buttonText: String {
        switch mode {
        case .login:
            return "Login"
        case .signup:
            return "Signup"
        }
    }
    
}


extension LoginSignupViewModel {
    enum Mode {
        case login
        case signup
    }
}
