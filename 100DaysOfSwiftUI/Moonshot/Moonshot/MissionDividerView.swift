//
//  MissionDividerView.swift
//  Moonshot
//
//  Created by sky on 2024/3/5.
//

import SwiftUI

struct MissionDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    MissionDividerView()
        .preferredColorScheme(.dark)
}
