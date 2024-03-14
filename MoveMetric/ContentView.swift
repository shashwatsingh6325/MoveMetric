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
                    List(exercises) { exercise in
                        NavigationLink(destination: ExerciseDetailsView(exercise: exercise)
                                        .environmentObject(viewModel)
                                        .environmentObject(sessionConfig)) {
                            ExerciseRowView(exercise: exercise)
                        }
                    }
                    .navigationBarTitle("Exercises")
                }
                .tabItem {
                    Label("Exercises", systemImage: "figure.strengthtraining.functional")
                }
                .tag(0)

                MainView()
                    .tabItem {
                        Label("Reminders", systemImage: "clock")
                    }
                    .tag(1)
            }
            .accentColor(.orange)
            .navigationViewStyle(StackNavigationViewStyle()) // Ensure consistent navigation behavior
        }
        .navigationBarHidden(true) // Hide the main navigation bar
    }
}

struct ExerciseRowView: View {
    let exercise: Exercise

    var body: some View {
        VStack(alignment: .center) {
            Text(exercise.name)
                .frame(width: 230,height: 30)
                .font(.headline)
                .foregroundColor(.primary)
                .padding()
                .background(Color.orange)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                .padding(.horizontal)
                .padding(.vertical, 4)
        }
        .padding(.leading,20)
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
