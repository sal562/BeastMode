//
//  LoginSignupViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/18/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation

final class LoginSignupViewModel: ObservableObject {
    
    private let mode: Mode
    
    ///init custom enum for mode
    init(mode: Mode) {
        self.mode = mode
    }
    
}


extension LoginSignupViewModel {
    enum Mode {
        case login
        case signup
    }
}
