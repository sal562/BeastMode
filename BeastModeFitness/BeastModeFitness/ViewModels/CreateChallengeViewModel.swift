//
//  CreateChallengeViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI
import Combine
import Firebase

typealias UserId = String

class CreateChallengeViewModel: ObservableObject {
    
    //MARK: - Properties
    //    @Published var dropdowns: [CreateChallengePartViewModel] = [
    //            ///init 4 dropdown optionns
    //        .init(type: .exercise),
    //        .init(type: .startAmount),
    //        .init(type: .increase),
    //        .init(type: .length)
    //    ]
    //
    ///create individual drop downs to manage state & types better
    @Published var exerciseDropdown = CreateChallengePartViewModel(type: .exercise)
    @Published var startAmountDropdown = CreateChallengePartViewModel(type: .startAmount)
    @Published var increaseDropdown = CreateChallengePartViewModel(type: .increase)
    @Published var lengthDropdown = CreateChallengePartViewModel(type: .length)
    @Published var error : IncrementingErrors?
    @Published var isLoading = false
    
    private let userService: UserServiceProtocol
    private var cancellables: [AnyCancellable] = []
    private let challengeService: ChallengeServiceProtocol
    
    ///Action enum to select options
    enum Action {
        case createChallenge
    }
    
    ///init userService
    init(userService: UserServiceProtocol = UserService(),
         challengeService: ChallengeServiceProtocol = ChallengeService()) {
        self.userService = userService
        self.challengeService = challengeService
    }
    
    ///send selection as dropdown index
    func send(action: Action) {
        switch action {
        case .createChallenge:
            // TO-DO: - Remove print statements
            print("Challenge Created")
            ///set isLoading to True
            isLoading = true
            currentUserId().flatMap { userId -> AnyPublisher<Void, IncrementingErrors> in
                return self.createChallenge(userId: userId)
            }.sink { completion in
                ///set isLoading to False
                self.isLoading = false
                switch completion {
                case let .failure(error):
                    print(error.localizedDescription)
                    self.error = error
                case .finished:
                    print("Finished")
                }
            } receiveValue: { _ in
                print("Success")
            }.store(in: &cancellables)
        }
    }
    
    private func createChallenge(userId: UserId) -> AnyPublisher<Void, IncrementingErrors> {
        
        ///create exercise
        guard let exercise = exerciseDropdown.text,
              let startAmount = startAmountDropdown.number,
              let increase = increaseDropdown.number,
              let length = lengthDropdown.number else {
            return Fail(error: .default(description: "Pass error from create exercise type")).eraseToAnyPublisher()
        }
        ///return challenge object
        let challenge = Challenge(userId: userId, startDate: Date(), exercise: exercise, startAmount: startAmount, increase: increase, length: length)
        ///pass into challengeService
        return challengeService.create(challenge).eraseToAnyPublisher()
    }
    
    //get currrent userID
    func currentUserId() -> AnyPublisher<UserId, IncrementingErrors> {
        print("Getting user id...")
        return userService.currentUser().flatMap { user -> AnyPublisher<UserId, IncrementingErrors> in
            ///FOR TESTING FAILURE ALERT ONLY - DISABLE
//            return Fail(error: .default(description: "Some firebase autg errir ")).eraseToAnyPublisher()
            if let userId = user?.uid {
                print("User is logged in")
                return Just(userId)
                    .setFailureType(to: IncrementingErrors.self)
                    .eraseToAnyPublisher()
            } else {
                
                // TO-DO: - Setup check to see if user has account before allowing to save.
//                print("User is being loggedd in anonymously")
                return self.userService
                    .signInAnonymously()
                    .map({ $0.uid })
                    .eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
    

}

extension CreateChallengeViewModel {
    
    ///Setup CreateChallengePartViewModel
    struct CreateChallengePartViewModel: DropdownItemProtocol {
        var selectedOption: DropdownOption
        
        var options: [DropdownOption]
        var headerTitle: String {
            type.rawValue
        }
        var dropdownTitle: String {
//            options.first(where: { $0.isSelected })?.formatted ?? ""
            selectedOption.formatted
        }
        var isSelected: Bool = false
        
        let type: TypeOfChallengePart
        
        ///init TypeOfChallengePart = Map each enum to dropdown
        init(type: TypeOfChallengePart) {
            switch type {
            case .exercise:
                self.options = ExerciseOption.allCases.map { $0.toDropdownOption }
            case .startAmount:
                self.options = StartOption.allCases.map { $0.toDropdownOption }
            case .increase:
                self.options = DailyIncreaseOption.allCases.map { $0.toDropdownOption }
            case .length:
                self.options = LengthOfChallenge.allCases.map { $0.toDropdownOption }
            }
            self.type = type
            self.selectedOption = options.first!
        }
        
        ///determine type of challenge
        enum TypeOfChallengePart: String, CaseIterable {
            case exercise = "Exercise"
            case startAmount = "Starting Amount"
            case increase = "Daily Increase"
            case length = "Length of Challenge"
            
        }
        
        ///exercise options
        enum ExerciseOption: String,CaseIterable, DropdownOptionProtocol {
            ///Types of Exercise
            case pushups
            case pullups
            case burpees
            case squats
            case dips
            case situps
            case planking
            
            ///First Exercise Option
            var toDropdownOption: DropdownOption {
                .init(type: .text(rawValue),
                      formatted: rawValue.capitalized
                )
            }
        }
        
        ///Starting Options
        enum StartOption: Int,CaseIterable, DropdownOptionProtocol {
            ///Types of Exercise
            case one = 1, two, three, four, five
            
            ///Second Exercise Option
            var toDropdownOption: DropdownOption {
                .init(type: .number(rawValue),
                      formatted: "\(rawValue)"
                )
            }
        }
        
        ///Daily Increase Options
        enum DailyIncreaseOption: Int,CaseIterable, DropdownOptionProtocol {
            ///Types of Exercise
            case one = 1, two, three, four, five
            
            ///Second Exercise Option
            var toDropdownOption: DropdownOption {
                .init(type: .number(rawValue),
                      formatted: "+\(rawValue)")
            }
        }
        
        
        ///Length Of Challenge
        enum LengthOfChallenge: Int,CaseIterable, DropdownOptionProtocol {
            ///Types of Exercise
            case seven = 7, fourteen = 14, twentyOne = 21, twentyEight = 28
            
            ///Second Exercise Option
            var toDropdownOption: DropdownOption {
                .init(type: .number(rawValue),
                      formatted: "\(rawValue) days")
            }
        }
        
        
    }
    
}

///Create extensions for getting values from CreateChallengePartViewModel
extension CreateChallengeViewModel.CreateChallengePartViewModel {
    var text: String? {
        if case let .text(text) = selectedOption.type {
            return text
        }
        return nil
    }
    
    var number: Int? {
        if case let .number(number) = selectedOption.type {
            return number
        }
        return nil
    }
    
}
