//
//  UserProfileView.swift
//  PetPals
//
//  Created by user2 on 24/12/23.
//

import SwiftUI

struct UserProfileView: View {
    
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack {
                        // Your existing views here
                        VStack {
                            OptionsView(title: "My Account", icon: "person.crop.circle")
                            Divider()
                            NavigationLink(destination: FavPalView()) {
                                OptionsView(title: "My Pets", icon: "pawprint")
                            }
                            Divider()
                            OptionsView(title: "My Address", icon: "location")
                            Divider()
                            OptionsView(title: "Favourite Exercise", icon: "heart")
                            Divider()
                            OptionsView(title: "Help Center", icon: "questionmark.circle")
                            Divider()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .padding(.horizontal))
                        .padding(.top,110)
                        
                        // Booking section
                        
                        Button("Log Out") {
                            // Perform logout action
                        }
                        .frame(width: 300, height: 40, alignment: .center)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                    }
                }
                
                // Overlaying ZStack
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.orange) // Use the color you want for the rounded rectangle
                        .frame(height: 220) // Set the height you want for the rounded rectangle
                    
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("John Doe")
                                    .fontWeight(.bold)
                                    .font(.title)
                                
                                HStack(spacing: 2) {
                                    Text("9876543210")
                                    Text(" ")
                                    Text("test@gmail.com")
                                }
                            }
                            Image("vsitup")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 54, height: 54)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.top, 120)
                }
                .offset(y: -55)
                .padding(.bottom, 360)
                .edgesIgnoringSafeArea(.top)
                .offset(y: -60)
                
            }
            
        }
        
    }
}



#Preview {
    UserProfileView()
}
