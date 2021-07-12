//
//  CreateChallengeViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

final class CreateChallengeViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published private(set) var dropdownChoices: [CreateChallengeViewModel] = []
    
    
}


extension CreateChallengeViewModel {
    
    struct ChallengeStartedViewModel: DropdownItemsProtocol {
        var options: [DropdownOption]
        var headerTitle: String {
            type.rawValue
        }
        var dropdownTitle: String
        var isSelected: Bool
        
        private let type: TypeOfChallengePart
        
        ///init TypeOfChallengePart
        init(type: TypeOfChallengePart) {
            self.type = type
        }
        
        ///determine type of challenge
        enum TypeOfChallengePart: String, CaseIterable {
            case exercise = "Exercise"
            case startAmount = "Starting Amount"
            case increase = "Daily Increase"
            case length = "Length of Challenge"
            
        }
        
        ///exercise options
        enum ExerciseOption: String, DropdownOptionProtocol {
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
                      formatted: rawValue.capitalized,
                      isSelected: self == .pushups)
            }
        }
        
        ///Starting Options
        enum StartOption: Int, DropdownOptionProtocol {
            ///Types of Exercise
            case one = 1, two, three, four, five
            
            ///Second Exercise Option
            var toDropdownOption: DropdownOption {
                .init(type: .number(rawValue),
                      formatted: "\(rawValue)",
                      isSelected: self == .one)
            }
        }
        
        ///Daily Increase Options
        enum DailyIncreaseOption: Int, DropdownOptionProtocol {
            ///Types of Exercise
            case one = 1, two, three, four, five
            
            ///Second Exercise Option
            var toDropdownOption: DropdownOption {
                .init(type: .number(rawValue),
                      formatted: "+\(rawValue)",
                      isSelected: self == .one)
            }
        }
        
        
        ///Length Of Challenge
        enum LengthOfChallenge: Int, DropdownOptionProtocol {
            ///Types of Exercise
            case seven = 7, fourteen = 14, twentyOne = 21, twentyEight = 28
            
            ///Second Exercise Option
            var toDropdownOption: DropdownOption {
                .init(type: .number(rawValue),
                      formatted: "\(rawValue) days",
                      isSelected: self == .seven)
            }
        }
        
        
    }
}

