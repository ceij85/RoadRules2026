//
//  StudyModeView.swift
//  RoadRules2026
//
//  Created by Charles E Ingram Jr on 9/16/26.
//

import SwiftUI

struct StudyModeView: View {

    var body: some View {

        ZStack {

            LinearGradient(
                colors: [.indigo, .purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {

                Text("📖 Study Mode")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Study questions and answers without taking a test.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)

                Text("🚧 Coming Soon")
                    .font(.title2)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
            }
            .padding()
        }
    }
}

#Preview {
    StudyModeView()
}
