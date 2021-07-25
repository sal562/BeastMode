//
//  ChallengeService.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/25/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI
import Combine

protocol ChallengeServiceProtocol {
    func create(_ challenge) -> AnyPublisher<Void, Error> {
    
    }
}
