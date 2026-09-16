//
//  ResultsView.swift
//  MyApp
//
//  Created by Charles E Ingram Jr on 9/16/26.
//

import SwiftUI

struct ResultsView: View {

    let score: Int
    let totalQuestions: Int
    let restartQuiz: () -> Void

    var body: some View {

        VStack(spacing: 20) {

            Text("🎉 Quiz Complete!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Final Score")
                .font(.title2)
            let percentage = Int(
                Double(score) /
                Double(totalQuestions) * 100
            )

            Text("\(score) / \(totalQuestions)")
                .font(.system(size: 50))
                .fontWeight(.bold)

            Button("Try Again") {
                restartQuiz()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ResultsView(
        score: 8,
        totalQuestions: 10,
        restartQuiz: {}
        
    )
}

