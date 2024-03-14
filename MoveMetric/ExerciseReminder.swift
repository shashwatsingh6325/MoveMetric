//
//  ExerciseRemainder.swift
//  BodyTackingApp
//
//  Created by user2 on 17/02/24.

import Foundation

struct ExerciseReminder: Codable ,Identifiable{
    let id = UUID()
    let title: String
    let exerciseName: String
    let date: Date
    let time: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ExerciseReminder, rhs: ExerciseReminder) -> Bool {
        return lhs.id == rhs.id
    }
}
struct ReminderDatabase {
    static var reminders: [ExerciseReminder] = []
}
