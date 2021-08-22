//
//  ChallengeItemViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/11/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import Foundation

struct  ChallengeItemViewModel: Identifiable {
    private let challenge: Challenge
    
    ///Pass document ID
    var id: String {
        challenge.id!
    }
    
    var title: String {
        challenge.exercise.capitalized
    }
    
    var progressCircleVM: ProgressCircleViewModel {
            let dayNumber = daysFromStart + 1
        let title = "Day"
        let message = isComplete ? "Done" : "\(dayNumber) of \(challenge.length)"
        return .init(title: title, message: message, percentageComplete: Double(dayNumber) / Double(challenge.length))
    }
    
    ///computed property to figure our home many days from start
    var daysFromStart: Int {
        ///create start & end date
        let startDate = Calendar.current.startOfDay(for: challenge.startDate)
        let endDate = Calendar.current.startOfDay(for: Date()
        )
        ///calculate days from start
        guard let daysFromStart = Calendar.current.dateComponents([.day], from: startDate, to: endDate).day else { return 0 }
        return abs(daysFromStart)
    }
    
    ///measure if task is completed ( from start date) true if length is less than 1
    var isComplete: Bool {
        daysFromStart - challenge.length >= 0
    }
    
    ///create daily status
    var statusText: String {
        guard !isComplete else { return "Done" }
        let dayNumber = daysFromStart + 1
        return "Day \(dayNumber) of \(challenge.length)"
    }
    
    var dailyIncreaseText: String {
        return "+ \(challenge.increase) daily"
    }
    
    private let onDelete: (String) -> Void
    
    ///init challenge due to Private let
    init(
        _ challenge: Challenge,
        onDelete: @escaping (String) -> Void)
    {
        self.challenge = challenge
        self.onDelete = onDelete
    }
    
    ///create function for tapping to delete
    func tapToDelete() {
        //callback to pass challengeID - and delete from challengeservice
        if let id = challenge.id {
            onDelete(id)
        }
    }
}
