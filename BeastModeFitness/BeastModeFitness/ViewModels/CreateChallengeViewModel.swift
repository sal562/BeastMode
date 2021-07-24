//
//  CreateChallengeViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI
import Combine

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
    
    private let userService: UserServiceProtocol
    private var cancellables: [AnyCancellable] = []
    
    ///Action enum to select options
    enum Action {
        case createChallenge
    }
    
    ///init userService
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
    }
    
    ///send selection as dropdown index
    func send(action: Action) {
        switch action {
//        case let .selectOption(index):
//            guard let selectedDropdownIndex = selectedDropdownIndex else { return }
//            clearAllSelectedOption()
//            dropdowns[selectedDropdownIndex].options[index].isSelected = true
//            clearAllDropdownOption()
            
        case .createChallenge:
            // TO-DO: - Remove print statements
            print("Challenge Created")
            currentUserId().sink { completion in
                switch completion {
                case let .failure(error):
                    print(error.localizedDescription)
                case .finished:
                    print("Completed")
                }
            } receiveValue: { userId in
                print("USERID: \(userId)")
            }.store(in: &cancellables)

        }
    }
    
    //get currrent userID
    func currentUserId() -> AnyPublisher<UserId, Error> {
        print("Getting user id...")
        return userService.currentUser().flatMap { user -> AnyPublisher<UserId, Error> in
            if let userId = user?.uid {
                print("User is logged in")
                return Just(userId)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            } else {
                print("User is being loggedd in anonymously")
                return self.userService
                    .signInAnonymously()
                    .map({ $0.uid })
                    .eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
    
    ///reset all the options
//    func clearAllSelectedOption() {
//        guard let selectedDropdownIndex = selectedDropdownIndex else { return }
//        dropdowns[selectedDropdownIndex].options.indices.forEach { index in
//            dropdowns[selectedDropdownIndex].options[index].isSelected = false
//        }
//    }
//
//    ///reset all the dropdown selections - set to false
//    func clearAllDropdownOption() {
//        guard let selectedDropdownIndex = selectedDropdownIndex else { return }
//        dropdowns[selectedDropdownIndex].isSelected = false
//    }
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
