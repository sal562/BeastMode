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
    private let onToggleComplete: (String, [Activity]) -> Void
    
    let todayTitle = "Today"
    
    ////calcualte reps done today
    var repsBeingDoneTitle: String {
        ///figure out how many reps user has to do
        let repNumber = challenge.startAmount + (daysFromStart * challenge.increase)
        let exercise: String
        if repNumber == 1 {
            ///get title/type
            var challengeExercise = challenge.exercise
            ///remove the "s" at the end
            challengeExercise.removeLast()
            ///assign to exercise
            exercise = challengeExercise
        } else {
            exercise = challenge.exercise
        }
        return isComplete ? "Completed" : "\(repNumber) " + exercise
    }
    
    ///show in todayView section
    var shouldShowTodayView: Bool {
        ///check if challengeComplet - if it isnt keep showing -if complete hide the view
        !isComplete
    }
    ///check to see if dayTask is Completed
    var isDayComplete: Bool {
        let today = Calendar.current.startOfDay(for: Date())
        return challenge.activities.first(where: { $0.date == today })?.isComplete == true
        
    }

    
    ///init challenge due to Private let
    init(
        _ challenge: Challenge,
        onDelete: @escaping (String) -> Void,
        ///inject onToggle
        onToggleComplete: @escaping (String, [Activity]) -> Void
    )
    {
        self.challenge = challenge
        self.onDelete = onDelete
        self.onToggleComplete = onToggleComplete
    }
    
    ///create function for tapping to delete
//    func tapToDelete() {
//        //callback to pass challengeID - and delete from challengeservice
//        if let id = challenge.id {
//            onDelete(id)
//        }
//    }
//
    ///send action via Action Enum
    func send(action: Action) {
        guard let id = challenge.id else { return }
        
        switch action {
        case .delete:
            onDelete(id)
        case .toggleComplete:
            let today = Calendar.current.startOfDay(for: Date())
            
            let activities = challenge.activities.map {  activity -> Activity in
                if today == activity.date {
                    ///return new activiy with isCompleted reset
                    return .init(date: today, isComplete: !activity.isComplete)
                } else {
                    return activity
                }
            }
            onToggleComplete(id, activities)
        }
    }
}

extension ChallengeItemViewModel {
    enum Action {
        case delete
        case toggleComplete
    }
}
