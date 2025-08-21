//
//  HomeHeaderView.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI

struct HomeHeaderView: View {
    var title: LocalizedStringKey = "Welcome"
    var notificationCount: Int? = 1
    var onNotificationPressed: (() -> Void)? = nil
    var body: some View {
        HStack(spacing: 4){
            Image(systemName: "person.circle.fill")
                .font(.largeTitle)
                .foregroundStyle(.appRed)
            
            Text(title)
                .font(.ibmSemiBold(.title3))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "bell")
                .font(.title2)
                .overlay(alignment: .topTrailing) {
                    if notificationCount != nil && notificationCount != 0 {
                        notificationCountView
                    }
                }
                .onTapGesture {
                    onNotificationPressed?()
                }
        }
        .foregroundStyle(.appWhite)
    }
    private var notificationCountView: some View {
        Circle()
            .fill(.appRed)
            .frame(width: 15, height: 15)
            .overlay {
                Text("\(notificationCount ?? 0)")
                    .font(.ibmRegular(.caption2))
                    .foregroundStyle(.white)
            }
            .offset(x: 1,y: -2)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        HomeHeaderView()
    }
}
