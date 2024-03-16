//
//  ExerciseRemainder.swift
//  BodyTackingApp
//
//  Created by user2 on 17/02/24.

import Foundation
import UserNotifications

struct ExerciseReminder: Codable ,Identifiable {
    var id = UUID()
    let title: String
    let exerciseName: String
    let daysOfWeek: [String] // Modified to store days of the week
    let time: Date

    func formattedDaysOfWeek() -> String {
        return daysOfWeek.joined(separator: ", ")
    }
}
