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
                    
                    TextField("Search here !!!", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .padding(.horizontal,50)
                        .padding(.vertical,-20)
                    
                    ReviewsView()
                        .padding(.top,3)
                    
                    // Services Offered Section
                    Text("Favourite Workouts")
                        .font(.headline)
                        .foregroundColor(.black) // Text color set to white
                        .padding(.leading)
                        .padding(.horizontal,50)
                    
                    HStack(spacing: -10) {
                        ServiceView(serviceName: "Core", serviceImage: "beautiful-young-slim-woman-doing-stretching-exercises-gym-against-white-studio")
                        ServiceView(serviceName: "Back", serviceImage: "young-beautiful-sportive-girl-training-with-dumbbells-dark-wall")
                        ServiceView(serviceName: "Chest", serviceImage: "portrait-athletic-muscular-shirtless-middle-age-male-holds-dumbbell")
                        ServiceView(serviceName: "Legs", serviceImage: "muscle-sexy-lighting-fitness-body")
                        }
                    .padding(.leading,50)
                    
                    
                    // Pals Nearby Section
                    HStack {
                        Text("Core Exercises")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.primary)
                        
                        Spacer()
                        
//                        NavigationLink(destination: PalsNearbyView(serviceName: "None")) {
//                            HStack(spacing: 6.0) {
//                                Text("View All")
//                                    .foregroundColor(.white)
//                                Image(systemName: "chevron.right")
//                                    .foregroundColor(.white)
//                                
//                            }
//                            .padding(6.0)
//                        }
//                        .background(Color.orange)
//                        .cornerRadius(15)
                    }
                    .padding(.horizontal,68)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 1) {
                            ForEach(exercises) { exercise in
                                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)
                                    .environmentObject(viewModel)
                                    .environmentObject(sessionConfig)) {
                                        ExerciseRowView(exercise: exercise,palPets: "", imageName: "")
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
                        
//                        NavigationLink(destination: PalsNearbyView(serviceName: "None")) {
//                            HStack(spacing: 6.0) {
//                                Text("View All")
//                                    .foregroundColor(.white)
//                                Image(systemName: "chevron.right")
//                                    .foregroundColor(.white)
//                                
//                            }
//                            .padding(6.0)
//                        }
//                        .background(Color.orange)
//                        .cornerRadius(15)
                    }
                    .padding(.horizontal,68)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 1) {
                            ForEach(exercises) { exercise in
                                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)
                                    .environmentObject(viewModel)
                                    .environmentObject(sessionConfig)) {
                                        ExerciseRowView(exercise: exercise,palPets: "", imageName: "")
                                    }
                            }
                        }
                        .padding(.horizontal,68)
                    }
                    
                    
                    HStack {
                        Text("Back Exercises")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.primary)
                        
                        Spacer()
                        
//                        NavigationLink(destination: PalsNearbyView(serviceName: "None")) {
//                            HStack(spacing: 6.0) {
//                                Text("View All")
//                                    .foregroundColor(.white)
//                                Image(systemName: "chevron.right")
//                                    .foregroundColor(.white)
//                                
//                            }
//                            .padding(6.0)
//                        }
//                        .background(Color.orange)
//                        .cornerRadius(15)
                    }
                    .padding(.horizontal,68)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 1) {
                            ForEach(exercises) { exercise in
                                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)
                                    .environmentObject(viewModel)
                                    .environmentObject(sessionConfig)) {
                                        ExerciseRowView(exercise: exercise,palPets: "", imageName: "")
                                    }
                            }
                        }
                        .padding(.horizontal,68)
                    }
                    
                    
                    
                    HStack {
                        Text("Chest Exercises")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.primary)
                        
                        Spacer()
                        
//                        NavigationLink(destination: PalsNearbyView(serviceName: "None")) {
//                            HStack(spacing: 6.0) {
//                                Text("View All")
//                                    .foregroundColor(.white)
//                                Image(systemName: "chevron.right")
//                                    .foregroundColor(.white)
//                                
//                            }
//                            .padding(6.0)
//                        }
//                        .background(Color.orange)
//                        .cornerRadius(15)
                    }
                    .padding(.horizontal,68)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 1) {
                            ForEach(exercises) { exercise in
                                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)
                                    .environmentObject(viewModel)
                                    .environmentObject(sessionConfig)) {
                                        ExerciseRowView(exercise: exercise,palPets: "", imageName: "")
                                    }
                            }
                        }
                        .padding(.horizontal,68)
                    }
                    
                    
                    HStack {
                        Text("Legs Exercises")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.primary)
                        
                        Spacer()
                        
//                        NavigationLink(destination: PalsNearbyView(serviceName: "None")) {
//                            HStack(spacing: 6.0) {
//                                Text("View All")
//                                    .foregroundColor(.white)
//                                Image(systemName: "chevron.right")
//                                    .foregroundColor(.white)
//                                
//                            }
//                            .padding(6.0)
//                        }
//                        .background(Color.orange)
//                        .cornerRadius(15)
                    }
                    .padding(.horizontal,68)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 1) {
                            ForEach(exercises) { exercise in
                                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)
                                    .environmentObject(viewModel)
                                    .environmentObject(sessionConfig)) {
                                        ExerciseRowView(exercise: exercise,palPets: "", imageName: "")
                                    }
                            }
                        }
                        .padding(.horizontal,68)
                    }
                    
                    HStack {
                        Text("Shoulders Exercises")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.primary)
                        
                        Spacer()
                        
//                        NavigationLink(destination: PalsNearbyView(serviceName: "None")) {
//                            HStack(spacing: 4.0) {
//                                Text("View All")
//                                    .foregroundColor(.white)
//                                Image(systemName: "chevron.right")
//                                    .foregroundColor(.white)
//                                
//                            }
//                            .padding(6.0)
//                        }
//                        .background(Color.orange)
//                        .cornerRadius(15)
                    }
                    .padding(.horizontal,68)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 1) {
                            ForEach(exercises) { exercise in
                                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)
                                    .environmentObject(viewModel)
                                    .environmentObject(sessionConfig)) {
                                        ExerciseRowView(exercise: exercise,palPets: "", imageName: "")
                                    }
                            }
                        }
                        .padding(.horizontal,68)
                    }
                    // Become a Sitter Banner
                    becomeASitterBanner()
                }
                .padding(.horizontal, 300)
                
            }
            .background(Color.white.opacity(0.9))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)

            
        }
    }




struct PalsNearbyView: View {
    var serviceName: String
    
    let pals: [Pals] = [
        Pals(name: "Jack Bird", pets: "Dogs, Cats", userimage:  "p1"),
        Pals(name: "Rimi Lan", pets: "Dogs, Cats", userimage:  "p2"),
        Pals(name: "iock Bird", pets: "Dogs, Cats", userimage:  "p3"),
        Pals(name: "Rdemi Lan", pets: "Dogs, Cats", userimage:  "p4"),
        Pals(name: "Jacrk Bird", pets: "Dogs, Cats", userimage:  "p5"),
        Pals(name: "Rimie Lan", pets: "Dogs, Cats", userimage:  "p11"),
        Pals(name: "Jack wBird", pets: "Dogs, Cats", userimage:  "p12"),
        // ... more pals
    ]
    
    // Define the grid layout
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: -20),
        GridItem(.flexible(), spacing: 0)
    ]
    
    // State to show/hide the filter options
    @State private var showFilters = false
    
    var body: some View {

            VStack {
                HStack {
                    Menu {
                        Button("Cost", action: { /* Apply cost filter */ })
                        Button("Distance", action: { /* Apply distance filter */ })
                    } label: {
                        Label("Filter", systemImage: "line.horizontal.3.decrease.circle")
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    .padding(.leading)
                    
                    Spacer()
                }
                .padding([.top, .trailing])
                
                
                // List of Pals
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(pals, id: \.id) { pal in
                            PalView(palName: pal.name, palPets: pal.pets, imageName: pal.userimage)
                                .padding(8)
                        }
                    }
                }
            }
            .navigationTitle("Pals Nearby")
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
