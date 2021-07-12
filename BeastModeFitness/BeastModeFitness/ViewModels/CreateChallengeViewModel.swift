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
        var headerTitle: String
        var dropdownTitle: String
        var isSelected: Bool
        
        private let type: TypeOfChallengePart
        
        ///init TypeOfChallengePart
        init(type: TypeOfChallengePart) {
            
        }
        
        ///determine type of challenge
        enum TypeOfChallengePart: String, CaseIterable {
            case exercise = "Exercise"
            case startAmount = "Starting Amount"
            case increase = "Daily Increase"
            case length = "Length of Challenge"
            
        }
    }
}

