//
//  ExerciseDetailsView.swift
//  FitCount
//
//  Created by QuickPose.ai on 22.05.2023.
//

import SwiftUI
import PagerTabStripView

struct TitleNavBarItem: View {
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ExerciseDetailsView: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var sessionConfig: SessionConfig
    
    let exercise: Exercise
    
    @State var selection = 1
    
    var body: some View {
        VStack {
            
            Text(exercise.details)
                .font(.body)
                .padding()
            
            Spacer()
            
            PagerTabStripView(
                swipeGestureEnabled: .constant(false),
                selection: $selection
            ) {
                VStack {
                    Text("Select the number of reps")
                        .font(.headline)
                        .padding(.top, 8)
                    
                    Picker("Reps", selection: $sessionConfig.nReps) {
                        ForEach(1...100, id: \.self) { number in
                            Text("\(number) reps")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                .clipped()
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                .padding()
                .pagerTabItem(tag: 1) {
                    TitleNavBarItem(title: "Reps")
                }
            }
            .onChange(of: selection) { newValue in
                sessionConfig.useReps = newValue == 1
            }
            
            NavigationLink(destination: WorkoutView().environmentObject(viewModel).environmentObject(sessionConfig)) {
                Text("Start workout")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(8)
                
            }
            
            
        }
        .navigationBarTitle(Text(exercise.name))
        .onAppear() {
            sessionConfig.exercise = exercise
            sessionConfig.useReps = selection == 1
        }
    }
}
