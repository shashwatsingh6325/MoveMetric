import SwiftUI

struct OnboardingView: View {
    @State private var showWelcomeMessage = false
    @State private var redirectToNextPage = false
    
    var body: some View {
            NavigationView{
                VStack {
                    // Image occupying 2/3 of the page
                    Image("p2bg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.height * 2 / 3)
                    
                    // Welcome title
                    Text("Welcome to Move Metric")
                        .font(.title2)
                        .foregroundColor(.orange)
                        .fontWeight(.bold)
                        .padding(.top, -70)
                        .padding(.bottom,-50)
                    
                    // Description
                    Text("Your personal fitness companion to track and achieve your exercise goals.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                        .padding(.top, -33)
                    
                }
                .padding()
                .onAppear {
                    // Show welcome message after 1 second
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        self.showWelcomeMessage = true
                    }
                    
                    // Redirect to next page after 2 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
                        redirectToNextPage = true
                    }
                }
                .background(
                    NavigationLink(destination:BoardingView(), isActive: $redirectToNextPage) {
                        EmptyView()
                    }
                )
                
            }
            
        }
  
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
