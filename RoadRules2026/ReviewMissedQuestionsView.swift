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

    var entries: [(question: String, answer: String)] {

        missedQuestionsData
            .split(separator: "\n")
            .map { item in

                let parts = item.components(
                    separatedBy: "|"
                )

                return (
                    question: parts.first ?? "",
                    answer: parts.count > 1
                        ? parts[1]
                        : "Unknown"
                )
            }
    }

    var body: some View {

        List {

            if entries.isEmpty {

                ContentUnavailableView(
                    "No Missed Questions",
                    systemImage: "checkmark.circle"
                )

            } else {

                ForEach(
                    Array(entries.enumerated()),
                    id: \.offset
                ) { _, entry in

                    VStack(
                        alignment: .leading,
                        spacing: 10
                    ) {

                        Text(entry.question)
                            .font(.headline)

                        Text(
                            "Correct Answer: \(entry.answer)"
                        )
                        .foregroundColor(.green)

                    }
                    .padding(.vertical, 6)
                }
            }
        }
        .navigationTitle("Review Mistakes")
    }
}

#Preview {
    ReviewMissedQuestionsView()
}
