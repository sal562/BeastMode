//
//  Challenge.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/25/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Challenge: Codable {
     
    ///use @Documentidf from Firebase to track ID - Remove Hashable and use identifiable 
    @DocumentID var id: String?
    
    let userId: String
    let startDate: Date
    let exercise: String
    let startAmount: Int
    let increase: Int
    let length: Int
    
    //create dummy Challenge
//    static let dummyChallenge = [
//
//        Challenge(userId: "user2", startDate: Date(), exercise: "Pullups", startAmount: 5, increase: 4, length: 5)
//
//    ]
}


