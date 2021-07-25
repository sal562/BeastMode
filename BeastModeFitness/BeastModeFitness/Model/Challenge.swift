//
//  Challenge.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/25/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI


struct Challenge: Codable {
    let userId: String
    let startDate: Date
    let exercise: String
    let startAmount: Int
    let increase: Int
    let length: Int
    
    //create dummy Challenge
    static let dummyChallenge = [
    
        Challenge(userId: "user2", startDate: Date(), exercise: "Pullups", startAmount: 5, increase: 4, length: 5)
        
    ]
}


