//
//  ChallengeListViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/8/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation
import Combine

final class ChallengeListViewModel: ObservableObject {
    
    private let userService: UserServiceProtocol
    private let challengeService: ChallengeServiceProtocol
    private var cancellables: [AnyCancellable] = []
    
    ///init challenge Service and userService
    init(
        userService: UserServiceProtocol = UserService(),
        challengeService: ChallengeServiceProtocol = ChallengeService()
    ) {
        self.userService = userService
        self.challengeService = challengeService
    }
    
    ///Observe & store challenges
    private func observeChallenges() {
        userService.currentUser().compactMap { $0?.uid }
            .flatMap { userId -> AnyPublisher<[Challenge], IncrementingErrors> in
                return self.challengeService.observeChallenge(userId: userId)
            }
            ///subscribe to userChanllenges
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print(error.localizedDescription)
                case .finished:
                    print("finished")
                }
            } receiveValue: { challenges in
                print(challenges)
            } .store(in: &cancellables)

    }
}
