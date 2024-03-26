//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by sky on 2024/3/26.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("welcome to snowseeker")
                .font(.largeTitle)
            Text("please select a resort from the left hand menu: swipe from the edge to show it")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
