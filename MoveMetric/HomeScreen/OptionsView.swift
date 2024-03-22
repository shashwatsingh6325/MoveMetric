//
//  OptionsView.swift
//  HomeView
//
//  Created by shashwat singh   on 17/03/24.
//

import SwiftUI

struct OptionsView: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
                .frame(width: 30, height: 30)
            
            Text(title)
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.black)
                .padding(.horizontal)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.primary, lineWidth: 1)
                        )
                        
        )
    }
}

#Preview {
    OptionsView(title: "Help Center", icon: "questionmark.circle")
}
