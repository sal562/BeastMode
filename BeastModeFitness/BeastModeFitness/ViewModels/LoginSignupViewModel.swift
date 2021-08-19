//
//  LoginSignupViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/18/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation

class LoginSignupViewModel: ObservableObject {
    
    @Published var emailText =  ""
    @Published var passwordText = ""
    @Published var isValid = false
    
    ///user service
    private let userService: UserServiceProtocol

    
    
    let mode: Mode
    
    ///init custom enum for mode
    init(mode: Mode,userService: UserServiceProtocol = UserService())
    {
        self.mode = mode
        ///inject userservice
        self.userService = userService
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
            return "Sign up"
        }
    }
    
    ///Link anonynouys account with newly created info
    func tappedSigninActionButton() {
        switch mode {
        case .login:
            print("Logging in")
            
        case .signup:
            ///userService.linkAcoount(email,pass)
            print("Signup ")
        }
    }
    
}


extension LoginSignupViewModel {
    enum Mode {
        case login
        case signup
    }
}
