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
        
        func receive<S>(subscriber: S) where S : Subscriber, IncrementingErrors == S.Failure, QuerySnapshot == S.Input {
            ///fill after sub
        }
    }
    ///create QuerySnapshotSubscription class
    class QuerySnapshotSubscription<S: Subscriber>: Subscription where S.Input == QuerySnapshot, S.Failure == IncrementingErrors {
        func request(_ demand: Subscribers.Demand) {
            <#code#>
        }
        func cancel() {
            <#code#>
        }
    }
}
