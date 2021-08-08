//
//  QuerySnapshotPublisher.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/8/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation
import Firebase
import Combine

extension Publishers {
    
    struct QuerySnapshotPublisher: Publisher {
        
        typealias Output = QuerySnapshot
        typealias Failure = IncrementingErrors
        
        //MARK: - Properties
        let query: Query
        ///init query
        init(query: Query) {
            self.query = query
        }
        
        func receive<S>(subscriber: S) where S : Subscriber, IncrementingErrors == S.Failure, QuerySnapshot == S.Input {
            ///fill after sub with new subscribtion
            let querySnapshotSubscribtion = QuerySnapshotSubscription(subscriber: subscriber, query: query)
        }
    }
    ///create QuerySnapshotSubscription class
    class QuerySnapshotSubscription<S: Subscriber>: Subscription where S.Input == QuerySnapshot, S.Failure == IncrementingErrors {
        
        private var subscriber: S?
        private var listener: ListenerRegistration?
        
        ///Init subscriber
        init(subscriber: S, query: Query) {
            listener = query.addSnapshotListener({ querySnapshot, error in
                ///check for error and pass querySnapshot though completion handler
                if let error = error {
                        subscriber.receive(completion: .failure(.default(description: error.localizedDescription)))
                } else if let querySnapshot = querySnapshot {
                    _ = subscriber.receive(querySnapshot)
                } else {
                    subscriber.receive(completion: .failure(.default()))
                }
            })
        }
        
        func request(_ demand: Subscribers.Demand) { }
        func cancel() {
            ///make both sub and  nil
            
        }
    }
}
