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
    let imageName: String
    let features: [QuickPose.Feature]
    // Add more properties as needed
}

let exercises = [
    Exercise(
        name: "Bicep Curls",
        details: "Lift weights in both hands by bending your elbow and lifting them towards your shoulder.",
        imageName: "Yoga practice-bro",
        features: [.fitness(.bicepCurls), .overlay(.upperBody)]
    ),
    Exercise(
        name: "Squats",
        details: "Bend your knees and lower your body.",
        imageName: "Workout-cuate",
        features: [.fitness(.squats), .overlay(.wholeBody)]
    ),

]


@main
struct MoveMetricApp: App {
    @State private var isOnboardingCompleted = false // Add state variable
    var body: some Scene {
        WindowGroup {
            if isOnboardingCompleted {
                ContentView()
            } else {
                OnboardingView(isOnboardingCompleted: $isOnboardingCompleted)
            }
        }
    }
}


