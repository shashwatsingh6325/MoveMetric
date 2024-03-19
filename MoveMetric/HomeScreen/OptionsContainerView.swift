//
//  OptionsContainerView.swift
//  HomeView
//
//  Created by shashwat singh   on 17/03/24.
//

import SwiftUI

struct OptionsContainerView: View {
    var body: some View {
        VStack(spacing: 1) {
            OptionsView(title: "My Address", icon: "location")
            Divider()
            OptionsView(title: "Payment", icon: "creditcard")
            
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
        )
    }
}

#Preview {
    OptionsContainerView()
}
