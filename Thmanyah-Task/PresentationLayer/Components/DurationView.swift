//
//  DurationView.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI

struct DurationView: View {
    var duration: Int = 5
    var body: some View {
        HStack(spacing: 4){
            Image(systemName: "play.fill")
            Text("\(duration.asDurationReadable)")
                .lineLimit(1)
        }
        .font(.ibmRegular(.caption))
        .padding(.vertical, 4)
        .padding(.horizontal, 10)
        .foregroundStyle(.appWhite)
        .background(.appDarkBlueGray)
        .cornerRadius(Constants.CORNER_RADIUS * 1.5)
    }
}

#Preview {
    DurationView()
}
