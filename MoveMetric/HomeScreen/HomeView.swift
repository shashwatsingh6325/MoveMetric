//
//  HomeView.swift
//  HomeView
//
//  Created by shashwat singh   on 16/03/24.
//

import SwiftUI

struct HomeView: View {

    @State private var searchText = ""
    @StateObject var viewModel = ViewModel()
    @StateObject var sessionConfig = SessionConfig()
    @State private var isSearchTapped = false
    var filteredExercises: [Exercise] {
            if searchText.isEmpty {
                return exercises
            } else {
                return exercises.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            }
        }
    
    @State private var favoriteExercises: [Exercise] = []
    
    var body: some View {
        
            ScrollView {
                VStack(alignment: .leading) {
                    // Search Bar
                    Text("Looking")
                        .bold()
                        .font(.title)
                        .padding(.horizontal,70)
                        .padding(.top,10)
                                        
                    Text("for Specific Exercises?...")
                        .padding(.horizontal,70)
                    
                    TextField("Search here !!!", text: $searchText, onEditingChanged: { editing in
                                        isSearchTapped = editing
                                    })
                                    .textFieldStyle(.roundedBorder)
                                    .padding()
                                    .padding(.horizontal,50)
                                    .padding(.vertical,-20)
                    
                    if isSearchTapped {
                                        ForEach(filteredExercises) { exercise in
                                            NavigationLink(destination: ExerciseDetailsView(exercise: exercise)
                                                .environmentObject(viewModel)
                                                .environmentObject(sessionConfig)) {
                                                ExerciseRowView(exercise: exercise, palPets: "", imageName: "", favoriteExercises: $favoriteExercises)
                                            }
                                            .padding(.horizontal, 68)
                                        }
                                    }
                    
                    ReviewsView()
                        .padding(.top,3)
                    
                    // Services Offered Section
                    Text("Favourite Workouts")
                        .font(.headline)
                        .foregroundColor(Color.primary) // Text color set to white
                        .padding(.leading)
                        .padding(.horizontal,54)
                    
                    if favoriteExercises.isEmpty {
                        Rectangle()
                                .fill(Color.gray.opacity(0.3)) // Adjust opacity as needed
                                .frame(width: 300, height: 110)
                                .cornerRadius(10)
                                .overlay(
                                    Text("Add your favorite exercises here")
                                        .foregroundColor(.gray)
                                        .padding()
                                )
                                .padding(.horizontal, 70)
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(favoriteExercises) { exercise in
                                    ExerciseRowView(exercise: exercise, palPets: "", imageName: "", favoriteExercises: $favoriteExercises)
                                }
                            }
                            .padding(.horizontal, 68)
                        }
                    }
                    
                    
                    // Pals Nearby Section
                    HStack {
                        Text("Core Exercises")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.primary)
                        
                        Spacer()
                        

                    }
                    .padding(.horizontal,68)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(exercises.prefix(6)) { exercise in
                                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)
                                    .environmentObject(viewModel)
                                    .environmentObject(sessionConfig)) {
                                        ExerciseRowView(exercise: exercise, palPets: "", imageName: "",favoriteExercises: $favoriteExercises)
                                    }
                                
                            }
                        }
                        .padding(.horizontal,68)
                    }
                    
                    HStack {
                        Text("Arms Exercises")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.primary)
                        
                        Spacer()

                    }
                    .padding(.horizontal,68)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(6..<13) { index in
                                let exercise = exercises[index]
                                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)
                                    .environmentObject(viewModel)
                                    .environmentObject(sessionConfig)) {
                                        ExerciseRowView(exercise: exercise, palPets: "", imageName: "",favoriteExercises: $favoriteExercises)
                                    }
                            }
                        }
                        .padding(.horizontal, 68)
                    }


                    
                    
                    HStack {
                        Text("Back Exercises")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.primary)
                        
                        Spacer()
                        

                    }
                    .padding(.horizontal,68)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(13..<16) { index in
                                let exercise = exercises[index]
                                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)
                                    .environmentObject(viewModel)
                                    .environmentObject(sessionConfig)) {
                                        ExerciseRowView(exercise: exercise, palPets: "", imageName: "",favoriteExercises: $favoriteExercises)
                                    }
                            }
                        }
                        .padding(.horizontal, 68)
                    }
                    
                    
                    
                    HStack {
                        Text("Chest Exercises")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.primary)
                        
                        Spacer()
                        

                    }
                    .padding(.horizontal,68)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(Array(exercises[16...16]), id: \.self) { exercise in
                                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)
                                    .environmentObject(viewModel)
                                    .environmentObject(sessionConfig)) {
                                        ExerciseRowView(exercise: exercise, palPets: "", imageName: "",favoriteExercises: $favoriteExercises)
                                    }
                            }
                        }
                        .padding(.horizontal, 68)
                    }

                    
                    
                    HStack {
                        Text("Legs Exercises")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.primary)
                        
                        Spacer()

                    }
                    .padding(.horizontal,68)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(17..<20) { index in
                                let exercise = exercises[index]
                                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)
                                    .environmentObject(viewModel)
                                    .environmentObject(sessionConfig)) {
                                        ExerciseRowView(exercise: exercise, palPets: "", imageName: "",favoriteExercises: $favoriteExercises)
                                    }
                            }
                        }
                        .padding(.horizontal, 68)
                    }
                    
                    HStack {
                        Text("Shoulders Exercises")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.primary)
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal,68)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(20..<23) { index in
                                let exercise = exercises[index]
                                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)
                                    .environmentObject(viewModel)
                                    .environmentObject(sessionConfig)) {
                                        ExerciseRowView(exercise: exercise, palPets: "", imageName: "",favoriteExercises: $favoriteExercises)
                                    }
                            }
                        }
                        .padding(.horizontal, 68)
                    }
                    // Become a Sitter Banner
                    becomeASitterBanner()

                }
                .padding(.horizontal, 300)
            }
            .background(Color.white.opacity(0.9))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            
        }
    }


struct Pals: Identifiable {
    let id = UUID()
    let name: String
    let pets: String
    let userimage: String
}

#Preview {
    HomeView()
}
