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
    
    @Published var showingCreateModal = false

    let title = "Challenge Yourself"

    ///enum to deternine actions after error
    enum Action {
        case retry
        case create
        case timeChange
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
        case .create:
            createChallenges()
        case .timeChange:
            cancellables.removeAll()
            observeChallenges()
        }
    }
    
    ///Create New Challeges
    private func createChallenges() {
        showingCreateModal = true
    }
    
    ///Observe & store challenges
    private func observeChallenges() {
        ///set isLoading to true
        isLoading = true
        userService.currentUserPublisher()
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
                self.showingCreateModal = false
                self.itemViewModels = challenges.map { challenge in
                    
                    .init(
                        challenge,
                        onDelete:  { [weak self] id in
                            self?.deleteChallenge(id)
                        },
                        onToggleComplete: { [weak self] id, activities in
                            self?.updateChallenge(id: id, activities: activities)
                        }
                    )
                }
            } .store(in: &cancellables)
    }
    
    private func updateChallenge(id: String, activities: [Activity]) {
        challengeService.updateChallenge(id, activities: activities).sink { completion in
            switch completion {
            case let .failure(error):
                self.error = error
//                print(error.localizedDescription)
            case .finished:  break
            }
        } receiveValue: { _ in
            ///recieve values and store in cancellables
        }.store(in: &cancellables)
    }
        
    
    private func deleteChallenge(_ challengeId: String) {
//        print(challengeId)
        ///method on challengeService (Delete) - subscribe 
        challengeService.deleteChallenge(challengeId).sink { completion in
            switch completion {
            case let .failure(error):
                self.error = error
//                print(error.localizedDescription)
            case .finished:  break
            }
        } receiveValue: { _ in
            ///recieve values and store in cancellables
        }.store(in: &cancellables)
    }
}
