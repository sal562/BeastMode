//
//  ChallengeItemViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/11/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation


struct  ChallengeItemViewModel {
    private let challenge: Challenge
    
    var title: String {
        challenge.exercise.capitalized
    }
    
    ///computed property to figure our home many days from start
    var daysFromStart: Int {
        guard let daysFromStart = Calendar.current.dateComponents([.day], from: challenge.startDate, to: Date()).day else {  return 0 }
        return abs(daysFromStart)
    }
    
    ///create daily status
    var statusText: String {
        let dayNumber = daysFromStart + 1
        return "Day \(dayNumber) of \(challenge.length)"
    }
    
    var dailyIncreaseText: String {
        
    }
}
