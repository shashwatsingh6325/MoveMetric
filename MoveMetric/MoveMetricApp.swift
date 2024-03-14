//
//  MoveMetricApp.swift
//  MoveMetric
//
//  Created by user2 on 03/03/24.
//

import SwiftUI
import QuickPoseCore

struct Exercise: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let details: String
    let features: [QuickPose.Feature]
    // Add more properties as needed
}

let exercises = [
    Exercise(
        name: "Bicep Curls",
        details: "Lift weights in both hands by bending your elbow and lifting them towards your shoulder.",
        features: [.fitness(.bicepCurls), .overlay(.upperBody)]
    ),
    Exercise(
        name: "Squats",
        details: "Bend your knees and lower your body.",
        features: [.fitness(.squats), .overlay(.wholeBody)]
    ),

]


@main
struct MoveMetricApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
}
