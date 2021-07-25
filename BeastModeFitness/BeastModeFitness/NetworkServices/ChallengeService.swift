//
//  ChallengeService.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/25/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI
import Combine
import Firebase
import FirebaseFirestoreSwift

protocol ChallengeServiceProtocol {
    func create(_ challenge: Challenge) -> AnyPublisher<Void, Error> {
            
    }
    
    final class ChallengeService: ChallengeServiceProtocol {
        
        //initialize firestore DB
        private let db = Firestore.firestore()
        
        func create(_ challenge: Challenge) -> AnyPublisher<Void, Error> {
            
        }
    }
}
