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
    
    //instanciate itemsViewModels to emppty Array
    @Published private(set) var itemViewModels : [ChallengeItemViewModel] = []
    let title = "Challenges"
    
    ///init challenge Service and userService
    init(
        userService: UserServiceProtocol = UserService(),
        challengeService: ChallengeServiceProtocol = ChallengeService()
    ) {
        self.userService = userService
        self.challengeService = challengeService
        observeChallenges()
    }
    
    ///Observe & store challenges
    private func observeChallenges() {
        userService.currentUser()
            .compactMap { $0?.uid }
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
            } receiveValue: { [weak self] challenges in
//                print(challenges) ///use weakself to avoid retain cycle and force unwrap self
                guard let self = self else { return }
                self.itemViewModels = challenges.map { .init($0) }
            } .store(in: &cancellables)

    }
}
