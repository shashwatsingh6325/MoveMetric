//
//  Exercise.swift
//  BodyTackingApp
//
//  Created by user2 on 04/02/24.
//

import Foundation
import UserNotifications

struct Exercisee: Identifiable { // Change to singular form 'Exercise'
    let id = UUID()
    let name: String
    let imageName: String
}
