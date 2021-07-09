//
//  ChallengeViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

final class ChallengeViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published private(set) var dropdownChoices: [ChallengeViewModel] = []
    
    
}


extension ChallengeViewModel {
    struct ChallengeStartedViewModel: DropdownItemsProtocol {
        var options: [DropdownOption]
        var headerTitle: String
        var dropdownTitle: String
        var isSelected: Bool
        
    }
}

