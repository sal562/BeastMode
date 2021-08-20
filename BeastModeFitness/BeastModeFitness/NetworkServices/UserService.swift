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
        var currentUser: User? { get }
        func currentUserPublisher() -> AnyPublisher<User?, Never>
        func signInAnonymously() -> AnyPublisher<User, IncrementingErrors>
        func observeAuthChanges() -> AnyPublisher<User?, Never>
        func linkAccount(email: String, password: String) -> AnyPublisher<Void,IncrementingErrors>
}

class UserService: UserServiceProtocol {
    
    let currentUser = Auth.auth().currentUser
    
    func currentUserPublisher() -> AnyPublisher<User?, Never> {
        Just(Auth.auth().currentUser).eraseToAnyPublisher()
    }
    
    func signInAnonymously() -> AnyPublisher<User, IncrementingErrors> {
        return Future<User, IncrementingErrors> { promise in
            Auth.auth().signInAnonymously { result, error in
                if let error = error {
                    ///use Auth form IncrementingErrors enum
                    return promise(.failure(.auth(description: error.localizedDescription)))
                } else if let user = result?.user {
                    return promise(.success(user))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    ///Observe Auth Changes
    func observeAuthChanges() -> AnyPublisher<User?, Never> {
        Publishers.AuthPublisher().eraseToAnyPublisher()
    }
    
    ///link anon account on device to userAccount in Firebase
    func linkAccount(email: String, password: String) -> AnyPublisher<Void, IncrementingErrors> {
        ///create email credentials
        let emailCredential = EmailAuthProvider.credential(withEmail: email, password: password)
        
        return Future<Void, IncrementingErrors> { promise in
            ///get current user and use .linkWith method of Firebase to associate with 3rd party account)
            Auth.auth().currentUser?.link(with: emailCredential, completion: { result, error in
                ///return failure or success
                if let error = error {
                    ///report errors from firebase
                    return promise(.failure(.default(description: error.localizedDescription)))
                } else if let user = result?.user {
                    ///update current user with (email) from user in firebase
                    Auth.auth().updateCurrentUser(user) { error in
                        if let error = error {
                            return promise(.failure(.default(description: error.localizedDescription)))
                        } else {
                            return promise(.success(()))
                        }
                    }
                }
            })
        }.eraseToAnyPublisher()
    }
}
