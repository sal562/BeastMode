//
//  SettingsItemViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/17/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation

extension SettingsViewModel {
    
    struct SettingsItemViewModel {
        let title: String
        let iconName: String
        let type: SettingsItemType
    }
    
    enum SettingsItemType {
        case count
        case mode
        case privacy
    }

}
