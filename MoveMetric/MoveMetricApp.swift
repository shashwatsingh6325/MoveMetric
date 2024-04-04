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
}

let exercises = [
    // CORE
    Exercise(
        name: "Squats",
        details: "Bend your knees and lower your body.",
        imageName: "squats_image",
        features: [.fitness(.squats), .overlay(.wholeBody)]
    ),
    
    Exercise(
        name: "Leg Raises",
        details: "Raise your legs while lying on your back.",
        imageName: "leg_raises_image",
        features: [.fitness(.legRaises), .overlay(.wholeBody)]
    ),
    Exercise(
        name: "Plank",
        details: "Hold a straight body position while resting on your forearms and toes.",
        imageName: "pushups_image",
        features: [.fitness(.plank), .overlay(.wholeBody)]
    ),
    Exercise(
        name: "Push Ups",
        details: "Lower and raise your body using your arms.",
        imageName: "squats_image",
        features: [.fitness(.pushUps), .overlay(.wholeBody)]
    ),
    Exercise(
        name: "Sit Ups",
        details: "Raise your upper body while lying on your back.",
        imageName: "squats_image",
        features: [.fitness(.sitUps), .overlay(.wholeBody)]
    ),
    Exercise(
        name: "V-Ups",
        details: "Raise your upper body and legs while lying on your back to form a V shape.",
        imageName: "squats_image",
        features: [.fitness(.vUps), .overlay(.wholeBody)]
    ),
    // ARM
    Exercise(
        name: "Bicep Curls",
        details: "Lift weights in both hands by bending your elbow and lifting them towards your shoulder.",
        imageName: "bicep_curls",
        features: [.fitness(.bicepCurls), .overlay(.upperBody)]
    ),
    Exercise(
        name: "Cobra Wings",
        details: "Lift your upper body while lying on your stomach.",
        imageName: "squats_image",
        features: [.fitness(.cobraWings), .overlay(.wholeBody)]
    ),
    Exercise(
        name: "Front Raises",
        details: "Bend your knees and lower your body.",
        imageName: "squats_image",
        features: [.fitness(.frontRaises), .overlay(.wholeBody)]
    ),
    Exercise(
        name: "Jumping Jacks",
        details: "Jump and spread your legs and arms wide.",
        imageName: "squats_image",
        features: [.fitness(.jumpingJacks), .overlay(.wholeBody)]
    ),
    Exercise(
        name: "Lateral Raises",
        details: "Lift weights in both hands out to the sides of your body.",
        imageName: "squats_image",
        features: [.fitness(.lateralRaises), .overlay(.wholeBody)]
    ),
    Exercise(
        name: "Overhead Dumbbell Press",
        details: "Lift weights in both hands by bending your elbows and lifting them above your head.",
        imageName: "squats_image",
        features: [.fitness(.overheadDumbbellPress), .overlay(.wholeBody)]
    ),
    Exercise(
        name: "Push Ups",
        details: "Lower and raise your body using your arms.",
        imageName: "squats_image",
        features: [.fitness(.pushUps), .overlay(.wholeBody)]
    ),
    
    //BACK
    Exercise(
        name: "Cobra Wings",
        details: "Lift your upper body while lying on your stomach.",
        imageName: "cobra_wings_image",
        features: [.fitness(.cobraWings), .overlay(.wholeBody)]
    ),
    Exercise(
        name: "Plank",
        details: "Hold a straight body position while resting on your forearms and toes.",
        imageName: "pushups_image",
        features: [.fitness(.plank), .overlay(.wholeBody)]
    ),
    Exercise(
        name: "Push Ups",
        details: "Lower and raise your body using your arms.",
        imageName: "pushups_image",
        features: [.fitness(.pushUps), .overlay(.wholeBody)]
    ),
    
    //chest
    Exercise(
        name: "Push Ups",
        details: "Lower and raise your body using your arms.",
        imageName: "pushups_image",
        features: [.fitness(.pushUps), .overlay(.wholeBody)]
    ),
    //Legs Exercises
    Exercise(
        name: "Glute Bridge",
        details: "Lift your hips off the ground while lying on your back.",
        imageName: "cobra_wings_image",
        features: [.fitness(.gluteBridge), .overlay(.wholeBody)]
    ),
    
    Exercise(
        name: "Jumping Jacks",
        details: "Jump and spread your legs and arms wide.",
        imageName: "pushups_image",
        features: [.fitness(.jumpingJacks), .overlay(.wholeBody)]
    ),
    Exercise(
        name: "Leg Raises",
        details: "Raise your legs while lying on your back.",
        imageName: "cobra_wings_image",
        features: [.fitness(.legRaises), .overlay(.wholeBody)]
    ),
    
    //SHOULDERS
    Exercise(
        name: "Front Raises",
        details: "Lift weights in both hands in front of your body.",
        imageName: "front_raises_image 1",
        features: [.fitness(.frontRaises), .overlay(.wholeBody)]
    ),
    Exercise(
        name: "Lateral Raises",
        details: "Lift weights in both hands out to the sides of your body.",
        imageName: "side_lunges_image",
        features: [.fitness(.lateralRaises), .overlay(.wholeBody)]
    ),
    Exercise(
        name: "Overhead Dumbbell Press",
        details: "Lift weights in both hands by bending your elbows and lifting them above your head.",
        imageName: "cobra_wings_image",
        features: [.fitness(.overheadDumbbellPress), .overlay(.wholeBody)]
    ),
    
    //Challanges
    Exercise(
        name: "Squats",
        details: "Bend your knees and lower your body.",
        imageName: "50x 1",
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


