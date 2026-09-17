//
//  ReviewMissedQuestionsView.swift
//  RoadRules2026
//
//  Created by Charles E Ingram Jr on 9/17/26.
//

import SwiftUI

struct ReviewMissedQuestionsView: View {

    @AppStorage("missedQuestions")
    private var missedQuestionsData = ""

    var questions: [String] {
        missedQuestionsData
            .split(separator: "\n")
            .map(String.init)
    }

    var body: some View {

        NavigationStack {

            List {

                if questions.isEmpty {

                    ContentUnavailableView(
                        "No Missed Questions",
                        systemImage: "checkmark.circle"
                    )

                } else {

                    ForEach(questions, id: \.self) { question in

                        Text(question)

                    }
                }
            }
            .navigationTitle("Review Mistakes")
        }
    }
}
