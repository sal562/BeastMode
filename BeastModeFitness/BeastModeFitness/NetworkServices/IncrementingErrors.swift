//
//  IncrementingErrors.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/29/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation

enum IncrementingErrors: LocalizedError {
    case auth(description: String)
    case `default`(description: String? = nil)
    
}
