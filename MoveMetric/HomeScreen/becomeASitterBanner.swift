//
//  becomeASitterBanner.swift
//  HomeView
//
//  Created by shashwat singh   on 17/03/24.
//

import SwiftUI

struct becomeASitterBanner: View {
    var body: some View {
        ZStack {
            Image("young-shirtless-caucasian-male-working-out-park-daytime")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 20)
                .frame(height: 250.0)
                .cornerRadius(10)
                .opacity(0.6)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Are you ready for challange ?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    
                
                Text("Click the button below and explore our fitness challanges.")
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                    .shadow(radius: 5)
                    
                
                NavigationLink(destination: UserProfileView()) {
                    Text("Lets get started !!")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
            .padding()
            .frame(width: 320, height: 240.0)
            .cornerRadius(10)
        }
        .padding(.horizontal,60)
        .shadow(radius: 5)
    }
}

#Preview {
    becomeASitterBanner()
}
