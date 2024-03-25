import SwiftUI


class SessionConfig: ObservableObject {
    @Published var nReps : Int = 1
    @Published var nMinutes : Int = 0
    @Published var nSeconds : Int = 1
    @Published var useReps: Bool = true
    @Published var exercise: Exercise = exercises[0] // use first exercise by default but change in the ExerciseDetailsView
}



struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @StateObject var sessionConfig = SessionConfig()

    var body: some View {
        NavigationView {
            TabView {
                NavigationView {
                    HomeView()
                }
                .tabItem {
                    Label("Home", systemImage: "house.circle.fill")
                }
                .tag(0)

                MainView()
                    .tabItem {
                        Label("Reminders", systemImage: "clock")
                    }
                    .tag(1)

                DetailsView()
                    .tabItem {
                        Label("Catalog", systemImage: "figure.run.circle.fill")
                    }
                    .tag(2)

                UserProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
                    .tag(3)
            }
            .accentColor(.orange)
            .navigationViewStyle(StackNavigationViewStyle()) // Ensure consistent navigation behavior
            .navigationBarHidden(true) // Hide the main navigation bar
            .navigationBarBackButtonHidden(true) // Hide back button
            .toolbar {
                // Add toolbar if necessary
            }
        }
    }
}


struct ExerciseRowView: View {
    let exercise: Exercise
//    var palName: String
    var palPets: String
    var imageName: String
    @State private var isFavorite: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topTrailing) {
                Image(exercise.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipped()
                    .cornerRadius(8)
                    .shadow(radius:10)

                
                Button(action: {
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .white)
                        .padding(8)
                        .background(Color.black.opacity(0.2))
                        .clipShape(Circle())
                    
                }
                .offset(x: -5, y: 10)
            }
            
            VStack(alignment: .leading, spacing: 0){
                Text(exercise.name)
                    .font(.headline)
                    .foregroundColor(.black)
                    .lineLimit(1)
                Text(palPets)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .lineLimit(1)
            }.padding([.vertical],3)
        }
        .frame(width: 150, height: 190)
        .background(Color.clear)
        .cornerRadius(8)
        

    }
}

class ViewModel: ObservableObject {
    @Published var path = NavigationPath()
    
    func popToRoot(){
        path.removeLast(path.count) // pop to root
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
