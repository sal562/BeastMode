//
//  DropdownItemsProtocol.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/9/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation

protocol DropdownItemsProtocol {
    //MARK: - Properties
    var options: [DropdownOption] { get }
    var headerTitle: String { get }
    var dropdownTitle: String { get }
    var isSelected: Bool { get }
}

struct DropdownOption {
    enum DropdownOptionType {
        case text(String)
        case number(Int)
    }
    
    let type: DropdownOptionType
    let formatted: String
    var isSelected: Bool
}
