//
//  SettingsViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/17/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI
import Combine


final class SettingsViewModel : ObservableObject {

    @Published private(set) var itemViewModels: [SettingsItemViewModel] = []
    ///shortcut for userDefault
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    ///new way using item(at) function to pass position
    func item(at index: Int) -> SettingsItemViewModel {
        ///grab index from itemViewModel
        itemViewModels[index]
    }
    ///new method of detecting tap
    func tappedItem(at index: Int)   {
        switch itemViewModels[index].type {
        case .mode:
            ///change from light to dark
            isDarkMode = !isDarkMode
        default:
            break
        }
    }
    
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
