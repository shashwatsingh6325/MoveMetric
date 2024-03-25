import SwiftUI

struct Review {
    let review: String
    let rating: Int
    let username: String
    let profileImage: String
    let backgroundImage: String // New property for background image
}

struct ReviewCard: View {
    let review: Review

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(review.username)
                    .fontWeight(.bold)
                    .font(.headline)
                    .shadow(radius: 5)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    
                
                Text(review.review)
                    .font(.body)
                    .shadow(radius: 5)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
            }
        }
        .frame(width: 280, height: 110)
        .padding()
        .background(
            Image(review.backgroundImage) // Use background image dynamically
                .resizable()
                .scaledToFill()
                .opacity(0.9) // Adjust opacity as needed
        )
        .cornerRadius(15)
    }
}

struct ReviewsView: View {
    @State private var currentPage = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    let reviews: [Review] = [
        Review(review: "Don't stop when you're tired. Stop when you're done.", rating: 5, username: "David Goggins", profileImage: "profilepic-1", backgroundImage: "tree4"),
        Review(review: "The secret of getting ahead is getting started.", rating: 4, username: "Mark Twain", profileImage: "profilepic-2", backgroundImage: "tree3"),
        Review(review: "Exercise should be regarded as tribute to the heart.", rating: 5, username: "Gene Tunney", profileImage: "profilepic-3", backgroundImage: "tree2"),
        Review(review: "Take care of your body. It’s the only place you have to live.", rating: 4, username: "Jim Rohn", profileImage: "profilepic-4", backgroundImage: "tree1"),
        // Add more reviews as needed
    ]

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(reviews.indices, id: \.self) { index in
                    ReviewCard(review: reviews[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page)
            .frame(height: 160)
            .onReceive(timer) { _ in
                withAnimation {
                    currentPage = (currentPage + 1) % reviews.count
                }
            }
        }
        .cornerRadius(20)
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView().background(Color.white)
    }
}
