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

///create extension to publishers for checking login state

extension Publishers {
   
    struct AuthPublisher: Publisher {
        typealias Output = User?
        typealias Failure = Never
        
        ///recieve method -
        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, User? == S.Input {
            ///create auth
            let authSubscription = AuthSubscription(subscriber: subscriber)
            ///create Subscription
            subscriber.receive(subscription: authSubscription)
        }
    }
    
    class AuthSubscription<S: Subscriber>: Subscription where S.Input == User?, S.Failure == Never {
        
        private var subscriber: S?
        private var handler: AuthStateDidChangeListenerHandle?
        
        init(subscriber: S) {
            self.subscriber = subscriber
            handler = Auth.auth().addStateDidChangeListener({ auth, user in
                ///notify subsciber
              _ = subscriber.receive(user)
            })
        }
        
        ///create request & cancel functions
        func request(_ demand: Subscribers.Demand) {}
        func cancel() {}
        
    }
}
