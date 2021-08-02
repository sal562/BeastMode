//
//  AuthPublisher.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/2/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation
import Combine
import FirebaseAuth

extension Publishers {
    ///create extension to publishers for checking login state
    struct AuthPublisher: Publisher {
        typealias Output = User?
        typealias Failure = Never
        
        ///recieve method -TODO
        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, User? == S.Input {
            <#code#>
        }
    }
}
