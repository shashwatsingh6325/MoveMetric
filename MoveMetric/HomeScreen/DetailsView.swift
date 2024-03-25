//
//  ExerciseList.swift
//  Dummy
//
//  Created by user2 on 21/03/24.
//

import SwiftUI
import WebKit
// Exercise model
struct Exercise3: Identifiable {
    var id = UUID()
    var name: String
    let imageName: String
    var difficulty: String // Easy, Medium, Hard
    var description: String
    var youtubeVideoID: String
}

struct ExerciseDetail: View {
    var exercise3: Exercise3
    
    var body: some View {
        ScrollView {
            VStack {
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.orange, lineWidth: 2)
                    .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 4)
                    .overlay(
                        Image(exercise3.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4)
                            .cornerRadius(30)
                    )
                
                Text(exercise3.name)
                    .font(.title)
                    .foregroundColor(.orange) // Orange color for exercise name
                    .padding()
                
                Text(exercise3.description)
                    .padding()
                    .foregroundColor(.black) // Black color for exercise description
                    .font(.body) // Custom font for description
                   // .multilineTextAlignment(.center) // Center-align text
                    .lineSpacing(8) // Adjust line spacing
                    .padding([.leading, .trailing], 20) // Add padding to the sides
                   .background(Color.orange.opacity(0.1)) // Orange background color with opacity
                    .cornerRadius(30)// Rounded corners for description
                    .padding(.horizontal,10)
                WebView(urlString: "https://www.youtube.com/watch?v=\(exercise3.youtubeVideoID)")
                                   .frame(height: 300) // Adjust height as needed
                    
                Spacer()
            }
        }
        .navigationBarTitle(Text(exercise3.name))
    }
}
struct WebView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: urlString) else {
            return WKWebView()
        }
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
// Main content view
struct DetailsView: View {
    @State private var searchText = ""
    @State private var selectedDifficulty = "UpperBody"
    
    // Exercise data with descriptions
    let exercises: [Exercise3] = [
        Exercise3(name: "Jumping Jacks", imageName: "jumping_jacks_image1" ,difficulty: "Core", description:
            """
            Instructions:
            - Start standing with your feet together and arms at your sides.
            - Jump while spreading your legs shoulder-width apart and simultaneously raise your arms above your head.
            - Return to the starting position by jumping back to the original stance with arms at your sides.

            Benefits:
            - Improves cardiovascular endurance.
            - Helps in warming up the body before more intense exercises.
            - Engages multiple muscle groups including legs, arms, and core.
            """
                  ,
                          youtubeVideoID: "CWpmIW6l-YA"
                 ),
        Exercise3(name: "Glute Bridge", imageName: "glute_bridge_image",difficulty: "LowerBody", description: """
            Instructions:
            - Lie on your back with knees bent and feet flat on the floor, hip-width apart.
            - Lift your hips towards the ceiling by squeezing your glutes and pressing through your heels.
            - Hold the position for a few seconds, then lower your hips back to the starting position.

            Benefits:
            - Strengthens the gluteal muscles.
            - Helps improve hip mobility and stability.
            - Can alleviate lower back pain by engaging the core muscles.
            """,youtubeVideoID: "zAraUpwz1l4" ),
        Exercise3(name: "Leg Raises", imageName: "leg_raises_image",difficulty: "LowerBody", description: """
            Instructions:
            - Lie on your back with legs straight and arms by your sides or under your glutes for support.
            - Lift both legs towards the ceiling while keeping them straight.
            - Slowly lower your legs back to the starting position without touching the ground.

            Benefits:
            - Targets the lower abdominal muscles.
            - Improves core strength and stability.
            - Helps in strengthening hip flexors.
            """,youtubeVideoID: "rmkU63oFYxE" ),
        Exercise3(name: "Lunges", imageName: "lunges_image",difficulty: "UpperBody", description: """
            Instructions:
            
            - Stand with feet hip-width apart and hands on hips or clasped together in front of you.
            - Take a large step forward with one leg and lower your body until both knees are bent at a 90-degree angle.
            - Push back to the starting position and repeat with the other leg.
            
            Benefits:
            
            - Strengthens the quadriceps, hamstrings, and glutes.
            - Improves balance and stability.
            - Enhances lower body mobility.
            """,youtubeVideoID: "ugW5I-a5A-Q"),
        Exercise3(name: "Squats",imageName: "squats_image", difficulty: "LowerBody", description: """
            Instructions:
            
            - Stand with feet shoulder-width apart, toes slightly turned out, and arms extended in front of you or crossed over your chest.
            - Lower your body by bending your knees and pushing your hips back as if sitting into a chair.
            - Keep your chest up and back straight, then return to the starting position by pushing through your heels.
            
            
            Benefits:
            
            - Targets the quadriceps, hamstrings, and glutes.
            - Builds lower body strength and muscle mass.
            - Improves functional movement patterns.
            """,youtubeVideoID: "PGdn6cANpjI"),
        Exercise3(name: "Pushups",imageName: "pushups_image", difficulty: "UpperBody", description: """
            Instructions:
            
            - Start in a plank position with hands shoulder-width apart, arms straight, and body in a straight line from head to heels.
            - Lower your body towards the ground by bending your elbows while keeping them close to your body.
            - Push back up to the starting position by straightening your arms.
            
            
            Benefits:
            
            - Strengthens the chest, shoulders, and triceps.
            - Improves upper body strength and stability.
            - Engages core muscles for added support.
            """,youtubeVideoID: "tf3VNkmzHq0" ),
        Exercise3(name: "Plank", imageName: "pushups_image",difficulty: "UpperBody", description: """
            Instructions:
            
            - Start in a push-up position with hands directly under your shoulders and body in a straight line from head to heels.
            - Engage your core muscles and hold the position, keeping your back flat and avoiding sagging or arching.
            - Aim to hold the plank for a specific duration, gradually increasing over time.
            

            Benefits:
            
            - Strengthens the core muscles including abdominals, obliques, and lower back.
            - Improves overall stability and posture.
            - Can help reduce the risk of lower back pain.
            """,
                  youtubeVideoID: "KtwlJHbvRYk"),
        Exercise3(name: "Situps", imageName: "situps_image",difficulty: "Core", description: """
            Instructions:
            
            - Lie on your back with knees bent, feet flat on the floor, and hands behind your head or crossed over your chest.
            - Engage your core muscles and lift your upper body towards your knees by flexing your spine.
            - Lower your body back to the starting position with control.

            
            Benefits:
            
            - Targets the abdominal muscles, particularly the rectus abdominis.
            - Improves core strength and endurance.
            - Helps in developing a strong and stable midsection.
            """,
                  youtubeVideoID: "UMaZGY6CbC4"),
        Exercise3(name: "Cobra Wings", imageName: "cobra_wings_image",difficulty: "UpperBody", description: """
            Instructions:
        
            - Lie face down with arms extended out to the sides at shoulder height and palms facing down.
            - Lift your chest and arms off the ground by squeezing your shoulder blades together and engaging your back muscles.
           
        - Hold the position for a few seconds, then lower back down with control.

        
        Benefits:
        
        - Strengthens the muscles of the upper back, including the rhomboids and trapezius.
        - Improves posture by counteracting the effects of slouching.
        - Helps in reducing tension and tightness in the upper back and shoulders.
        """,
                  youtubeVideoID: "CxI6DjNafyw" ),
        Exercise3(name: "Hip Abduction Standing", imageName: "hip_abduction_standing_image",difficulty: "LowerBody", description: """
            Instructions:
            
            - Stand tall with feet hip-width apart and hands on your hips or holding onto a stable surface for balance.
            - Lift one leg out to the side while keeping it straight, then lower it back down with control.
            - Repeat the movement on the other side.

            
            Benefits:
            
            - Targets the hip abductor muscles, including the gluteus medius and minimus.
            - Improves hip stability and lateral movement.
            - Can help in preventing injuries related to hip and knee alignment.
            """,
                  youtubeVideoID: "xUxWsvWj3Go"),
        Exercise3(name: "Bicep Curls", imageName: "bicep_curls",difficulty: "UpperBody", description: """
            Instructions:
            
            - Stand with feet hip-width apart, holding a dumbbell in each hand with arms fully extended down by your sides.
            - Keeping your elbows close to your body, curl the weights towards your shoulders by bending your elbows.
            - Lower the weights back to the starting position with control.

            
            Benefits:
            
            - Targets the bicep muscles for strength and definition.
            - Improves arm strength and grip strength.
            - Can help in enhancing overall upper body aesthetics.
            """ ,
                  youtubeVideoID: "l7Dkj6X76B8"),
        Exercise3(name: "Front Raises",imageName: "front_raises_image 1", difficulty: "UpperBody", description: """
            Instructions:
            
            - Stand with feet shoulder-width apart, holding a dumbbell in each hand with palms facing your thighs.
            - Keeping a slight bend in your elbows, lift the weights directly in front of you to shoulder height.
            - Lower the weights back down with control.

            
            Benefits:
            
            - Targets the front deltoid muscles for shoulder strength and definition.
            - Helps in improving shoulder stability and mobility.
            - Can contribute to a balanced upper body muscle development.
            """,
                  youtubeVideoID: "zkP0MsTcIVU"),
        Exercise3(name: "Overhead Dumbbell Press",imageName: "overhead_dumbbel_image", difficulty: "UpperBody", description: """
            Instructions:
            
            - Stand with feet hip-width apart, holding a dumbbell in each hand at shoulder height with elbows bent.
            - Press the weights overhead by straightening your arms, fully extending them without locking out the elbows.
            - Lower the weights back to the starting position with control.

            
            Benefits:
            
            - Targets the shoulder muscles, including the deltoids and trapezius.
            - Improves upper body strength and stability.
            - Enhances shoulder mobility and range of motion.
            """,
                  youtubeVideoID: "0rChzYPyuYI"),
        Exercise3(name: "Side Lunges",imageName: "side_lunges_image", difficulty: "LowerBody", description: """
            Instructions:
            
            - Stand with feet wider than shoulder-width apart, toes pointed forward, and hands on hips or clasped together in front of you.
            - Shift your body weight to one side and bend that knee while keeping the other leg straight.
            - Lower your body by pushing your hips back and keeping your chest up.
            - Push off the bent leg to return to the starting position and repeat on the other side.

            
            Benefits:
            
            - Targets the quadriceps, hamstrings, adductors, and abductors.
            - Enhances lower body strength and stability.
            - Improves lateral movement and agility.
            """,
                  youtubeVideoID: "ugW5I-a5A-Q"),
        Exercise3(name: "Lateral Raises",imageName: "lateral_raises_image", difficulty: "UpperBody", description: """
            Instructions:
            
            - Stand with feet hip-width apart, holding a dumbbell in each hand by your sides with palms facing your thighs.
            - Keeping a slight bend in your elbows, lift the weights out to the sides until they reach shoulder height.
            - Keep the movement controlled and avoid swinging the weights.
            - Lower the weights back to the starting position with control.

            
            Benefits:
            
            - Targets the lateral deltoid muscles, improving shoulder width and definition.
            - Enhances shoulder stability and mobility.
            - Helps in strengthening the rotator cuff muscles, reducing the risk of shoulder injuries.
            """,
                  youtubeVideoID: "XPPfnSEATJA"),
        Exercise3(name: "Sumo Squats", imageName: "sumo_squats_image",difficulty: "LowerBody", description: """
            Instructions:
            
            - Stand with feet wider than shoulder-width apart, toes pointed out at about a 45-degree angle, and hands clasped in front of you or holding a weight at your chest.
            - Lower your body by bending your knees and pushing your hips back, keeping your chest up and back straight.
            - Lower until your thighs are parallel to the ground or as low as comfortable.
            - Push through your heels to return to the starting position.

            
            Benefits:
            
            - Targets the quadriceps, hamstrings, glutes, adductors, and calves.
            - Increases hip flexibility and mobility.
            - Improves lower body strength and power.
            """ ,
                  youtubeVideoID: "kjlfpqXnyL8" ),
        Exercise3(name: "V-Ups", imageName: "v_ups_image",difficulty: "Core", description: """
            Instructions:
            
            - Lie flat on your back with arms extended overhead and legs straight.
            - Simultaneously lift your legs and upper body off the ground, reaching your hands toward your feet to form a "V" shape.
            - Keep your core engaged throughout the movement to prevent overarching the lower back.
            - Slowly lower back down to the starting position with control.

            
            Benefits:
            
            - Targets the rectus abdominis, obliques, hip flexors, and lower back muscles.
            - Enhances core strength and stability.
            - Improves overall body control and coordination.
            """,
                  youtubeVideoID: "nfWQihJo-Mc"),
    ]
    
    var filteredExercises: [Exercise3] {
        if searchText.isEmpty {
            return exercises.filter { $0.difficulty == selectedDifficulty }
        } else {
            return exercises.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search exercises", text: $searchText)
                    .foregroundColor(.orange)
                    .padding()
                    .foregroundColor(.orange)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                    
                   
                Picker("Difficulty", selection: $selectedDifficulty) {
                    Text("Upper Body").tag("UpperBody")
                    Text("Lower Body").tag("LowerBody")
                    Text("Core").tag("Core")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .background(.orange)

//                TextField("Search exercises", text: $searchText)
//                    .foregroundColor(.orange)
//                    .padding()
//                    .foregroundColor(.orange)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())

                List(filteredExercises) { exercise in
                    NavigationLink(destination: ExerciseDetail(exercise3: exercise)) {
                        HStack {
                            Image(exercise.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50) // Adjust size as needed
                                .cornerRadius(15) // Optional: Apply corner radius for rounded corners
                            
                            Text(exercise.name)
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                    }
                }

            }
            .navigationBarTitle(Text("Exercise Catalog"))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
        
    }
}

