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
    @Published private(set) var error: IncrementingErrors?
    @Published private(set) var isLoading = false

    let title = "Challenge Yourself"

    ///enum to deternine actions after error
    enum Action {
        case retry
    }
    
    ///init challenge Service and userService
    init(
        userService: UserServiceProtocol = UserService(),
        challengeService: ChallengeServiceProtocol = ChallengeService()
    ) {
        self.userService = userService
        self.challengeService = challengeService
        observeChallenges()
    }
    
    
    func send(action: Action) {
        switch action {
        case .retry:
            observeChallenges()
    }
    }
    
    ///Observe & store challenges
     private func observeChallenges() {
        ///set isLoading to true
        isLoading = true
        userService.currentUser()
            .compactMap { $0?.uid }
            .flatMap { [weak self] userId -> AnyPublisher<[Challenge], IncrementingErrors> in
                ///Value of optional type 'ChallengeListViewModel?' must be unwrapped to refer to member 'challengeService' of wrapped base type 'ChallengeListViewModel'
                guard let self = self else { return Fail(error: .default()).eraseToAnyPublisher()}
                return self.challengeService.observeChallenge(userId: userId)
            }
            ///subscribe to userChanllenges
            .sink { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                switch completion {
                case let .failure(error):
                    self.error = error
                case .finished:
                    print("finished")
                }
            } receiveValue: { [weak self] challenges in
//                print(challenges) ///use weakself to avoid retain cycle and force unwrap self
                guard let self = self else { return }
                self.isLoading = false
                self.error = nil
                self.itemViewModels = challenges.map { .init($0) }
            } .store(in: &cancellables)

    }
}
