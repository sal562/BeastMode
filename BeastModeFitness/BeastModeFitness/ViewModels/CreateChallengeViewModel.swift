//
//  CreateChallengeViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

class CreateChallengeViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var dropdowns: [CreateChallengePartViewModel] = [
            ///init 4 dropdown optionns
        .init(type: .exercise),
        .init(type: .startAmount),
        .init(type: .increase),
        .init(type: .length)
    ]
    
    enum Action {
        case selectOption(index: Int)
    }
    
    var hasSelectedDropdown: Bool {
        selectDropdownIndex != nil
    }
    
    var selectDropdownIndex: Int? {
        dropdowns.enumerated().first(where: { $0.element.isSelected })?.offset
    }
    
    var displayedOptions: [DropdownOption] {
        guard let selectDropdownIndex = selectDropdownIndex else { return [] }
        return dropdowns[selectDropdownIndex].options
    }
    
    func send(_ action: Action) {
        switch action {
        case let .selectOption(index):
            guard let selectDropdownIndex = selectDropdownIndex else { return }
            clearAllSelectedOption()
            dropdowns[selectDropdownIndex].options[index].isSelected = true
            clearAllDropdownOption()
        }
    }
    
    ///reset all the options
    func clearAllSelectedOption() {
        guard let selectDropdownIndex = selectDropdownIndex else { return }
        dropdowns[selectDropdownIndex].options.indices.forEach { index in
            dropdowns[selectDropdownIndex].options[index].isSelected = false
        }
    }
    
    ///reset all the dropdown selections
    func clearAllDropdownOption() {
        guard let selectDropdownIndex = selectDropdownIndex else { return }
        dropdowns[selectDropdownIndex].options.indices.forEach { index in
            dropdowns[selectDropdownIndex].options[index].isSelected = false
        }
    }
}

extension CreateChallengeViewModel {
    
    ///Setup CreateChallengePartViewModel
    struct CreateChallengePartViewModel: DropdownItemProtocol {
        var options: [DropdownOption]
        var headerTitle: String {
            type.rawValue
        }
        var dropdownTitle: String {
            options.first(where: { $0.isSelected })?.formatted ?? ""
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
                      formatted: rawValue.capitalized,
                      isSelected: self == .pushups)
            }
        }
        
        ///Starting Options
        enum StartOption: Int,CaseIterable, DropdownOptionProtocol {
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
        enum DailyIncreaseOption: Int,CaseIterable, DropdownOptionProtocol {
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
        enum LengthOfChallenge: Int,CaseIterable, DropdownOptionProtocol {
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
