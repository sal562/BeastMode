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

    @Published private(set) var itemViewModels: [SettingsItemViewModel] = []
    
    ///func to trigger onApper and init default settings
    func onAppear() {
        itemViewModels = [
            ///initialize the settings items
            .init(title: "Create Account", iconName: "person.circle", type: .account),
            .init(title: "Switch to Light Mode", iconName: "lightbulb", type: .mode),
            .init(title: "Privacy Policy", iconName: "lock.shield", type: .privacy)
        ]
    }
    
    
}
