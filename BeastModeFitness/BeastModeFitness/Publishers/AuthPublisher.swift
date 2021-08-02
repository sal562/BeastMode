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
            ///todo
        }
    }
    
    class AuthSubscription<S: Subscriber>: Subscription where S.Input == User?, S.Failure == Never {
        
        private var subscriber: S?
        private var handler: AuthStateDidChangeListenerHandle?
        
        init(subscriber: S) {
            self.subscriber = subscriber
            
        }
        
        ///create request & cancel functions
        func request(_ demand: Subscribers.Demand) {}
        func cancel() {}
        
    }
}
