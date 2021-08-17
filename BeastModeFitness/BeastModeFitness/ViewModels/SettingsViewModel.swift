//
//  SettingsViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/17/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation
import Combine


final class SettingsViewModel : ObservableObject {

    @Published private(set) var itemViewModel: [SettingsItemViewModel] = []
    
    ///func to trigger onApper
    func onAppear() {
        itemViewModel = [
        
            .init(title: "Create Account", iconName: "person.circle", type: .account)
        ]
    }
    
    
}
