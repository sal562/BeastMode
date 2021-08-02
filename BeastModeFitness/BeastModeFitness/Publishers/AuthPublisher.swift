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
        ///Output types
        typealias Output = User?
        typealias Failure = Never
        
        ///recieve method -
        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, User? == S.Input {
            ///create authSubscription
            let authSubscription = AuthSubscription(subscriber: subscriber)
            ///let subscriber recieve Subscription
            subscriber.receive(subscription: authSubscription)
        }
    }
    /// AuthSubscription is User or Nil
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
        func cancel() {
            subscriber = nil
            handler = nil
        }
        
    }
}
