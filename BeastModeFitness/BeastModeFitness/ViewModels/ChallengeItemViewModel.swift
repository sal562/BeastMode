//
//  ChallengeItemViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/11/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation

struct  ChallengeItemViewModel: Hashable {
    private let challenge: Challenge
    
    var title: String {
        challenge.exercise.capitalized
    }
    
    ///computed property to figure our home many days from start
    private var daysFromStart: Int {
        ///calculate days from start
        guard let daysFromStart = Calendar.current.dateComponents([.day], from: challenge.startDate, to: Date()).day else {  return 0 }
        return abs(daysFromStart)
    }
    
    ///create daily status
    private var statusText: String {
        let dayNumber = daysFromStart + 1
        return "Day \(dayNumber) of \(challenge.length)"
    }
    
    private var dailyIncreaseText: String {
        return "+ \(challenge.increase) daily"
    }
    
    //init challenge
    init(_ challenge: Challenge) {
        self.challenge = challenge
    }
}
