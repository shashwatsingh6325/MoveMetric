//
//  ChallangesView.swift
//  MoveMetric
//
//  Created by shashwat singh   on 26/03/24.
//

import SwiftUI

struct ChallangesView: View {
    
    @StateObject var viewModel = ViewModel()
    @StateObject var sessionConfig = SessionConfig()
    @State private var favoriteExercises: [Exercise] = []
        
    var body: some View {
        HStack {
            Text("Fitness Challanges")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.primary)
                .padding(.horizontal,10)
            
            Spacer()
        }

        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5)], spacing: 5) {
               
                    NavigationLink(destination: WorkoutView()
                                        .environmentObject(viewModel)
                                        .environmentObject(sessionConfig)) {
                        ExerciseRowView(exercise: exercises[23], palPets: "", imageName: "", favoriteExercises: $favoriteExercises)
                    }
                
            }
            .padding(.horizontal)
        }
        .onAppear {
            sessionConfig.useReps = true // Assuming you want to use reps
            sessionConfig.nReps = 50 // Set reps to 50

        }
    }
}

#if DEBUG
struct ChallangesView_Previews: PreviewProvider {
    static var previews: some View {
        ChallangesView()
    }
}
#endif
