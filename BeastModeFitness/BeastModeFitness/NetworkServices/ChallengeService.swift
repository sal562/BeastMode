//
//  ChallengeService.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/25/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol ChallengeServiceProtocol {
    func create(_ challenge: Challenge) -> AnyPublisher<Void, IncrementingErrors>
    ///observe changes
    func observeChallenge(userId: UserId) -> AnyPublisher<[Challenge], IncrementingErrors>
    ///create method to delete
    func deleteChallenge(_ challengeId: String) -> AnyPublisher<Void, IncrementingErrors>
    func updateChallenge(_ challengeId: String, activities: [Activity]) -> AnyPublisher<Void, IncrementingErrors>
                
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
        
        ///call observeChallenge
        func observeChallenge(userId: UserId) -> AnyPublisher<[Challenge], IncrementingErrors> {
            /////added order logic to query using start date - Requires setting index in Firestore Otherwise error 
            let query = db.collection("challenges").whereField("userId", isEqualTo: userId).order(by: "startDate", descending: true)
            return Publishers.QuerySnapshotPublisher(query: query)
                .flatMap { snapshot -> AnyPublisher<[Challenge], IncrementingErrors> in
                    do {
                        ///use compactMap instead of map for non optional types
                        let challenges = try snapshot.documents.compactMap {
                            try $0.data(as: Challenge.self)
                        }
                        return Just(challenges)
                            .setFailureType(to: IncrementingErrors.self)
                            .eraseToAnyPublisher()
                    } catch {
                        return Fail(error: .default(description: "Parsing Error"))
                            .eraseToAnyPublisher()
                    }
                }.eraseToAnyPublisher()
        }
        
        ///delete challenge from Firebase
        func deleteChallenge(_ challengeId: String) -> AnyPublisher<Void, IncrementingErrors> {
            
            return Future<Void, IncrementingErrors> { promise in
                ///get challenges collection, pass challengeId and delete
                self.db.collection("challenges").document(challengeId).delete { error in
                    if let error = error {
                        promise(.failure(.default(description: error.localizedDescription)))
                    } else {
                        promise(.success(()))
                    }
                }
                
            }.eraseToAnyPublisher()
        }
        
        ///update Challenge
        func updateChallenge(_ challengeId: String, activities: [Activity]) -> AnyPublisher<Void, IncrementingErrors> {
            return Future<Void, IncrementingErrors> { promise in
                ///get challenges collection, pass challengeId and delete
                self.db.collection("challenges").document(challengeId).updateData(
                    ["activities": activities.map({
                        return ["date" : $0.date, "isComplete": $0.isComplete]
                    })]
                ) { error in
                    if let error = error {
                        promise(.failure(.default(description: error.localizedDescription)))
                    } else {
                        promise(.success(()))
                    }
                }
                
            }.eraseToAnyPublisher()
        }
    }
