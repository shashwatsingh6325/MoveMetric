//
//  ServiceView.swift
//  HomeView
//
//  Created by shashwat singh   on 17/03/24.
//

import SwiftUI


struct ServiceView: View {
    var serviceName: String
    var serviceImage: String
    var body: some View {
        NavigationLink(destination: PalsNearbyView(serviceName: serviceName)) {
            VStack {
                // Service Image Placeholder
                Image(serviceImage)
                
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                Text(serviceName)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
        }
        .padding(14)
        .buttonStyle(PlainButtonStyle())
        .shadow(radius: 5)
    }
}

#Preview {
    ServiceView(serviceName: "Boarding", serviceImage: "p16")
}
