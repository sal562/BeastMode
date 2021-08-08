//
//  ChallengeListViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/8/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation


final class ChallengeListViewModel: ObservableObject {
    
    private let userService: UserServiceProtocol
    private let challengeService: ChallengeServiceProtocol
    
    ///init challenge Service and userService
    init(userService: UserServiceProtocol = UserService(), challengeService: ChallengeService()) {
        self.userService = userService
        self.challengeService = challengeService
    }
}
