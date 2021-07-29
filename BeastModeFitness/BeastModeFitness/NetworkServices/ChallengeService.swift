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
    func create(_ challenge: Challenge) -> AnyPublisher<Void, IncrementingErrors>
            
    }
    
    final class ChallengeService: ChallengeServiceProtocol {
        
        ///initialize firestore DB
        private let db = Firestore.firestore()
        
        ///create challenge in FB DB
        func create(_ challenge: Challenge) -> AnyPublisher<Void, IncrementingErrors> {
            return Future<Void, IncrementingErrors> { promise in
                do {
                    _ = try self.db.collection("challenges").addDocument(from: challenge) { error in
                        ///manage the error
                        if let error = error {
                            ///descripion of error from Firebase using IncrementingErrors enum
                            promise(.failure(.default(description: error.localizedDescription)))
                        } else {
                            promise(.success(()))
                        }
                    }
                } catch {
                    promise(.failure(.default(description: error.localizedDescription)))
                }
            }.eraseToAnyPublisher()
        }
    }
