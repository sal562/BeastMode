//
//  UserService.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/13/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation
import Combine
import FirebaseAuth

protocol UserServiceProtocol {
        func currentUser() -> AnyPublisher<User?, Never>
        func signInAnonymously() -> AnyPublisher<User, Error>
}

class UserService: UserServiceProtocol {
    func currentUser() -> AnyPublisher<User?, Never> {
        Just(Auth.auth().currentUser).eraseToAnyPublisher()
    }
    
    func signInAnonymously() -> AnyPublisher<User, Error> {
        return Future<User, Error> { promise in
            Auth.auth().signInAnonymously { result, error in
                if let error = error {
                    return promise(.failure(error))
                } else if let user = result?.user {
                    return promise(.success(user))
                }
            }
        }.eraseToAnyPublisher()
    }
}
