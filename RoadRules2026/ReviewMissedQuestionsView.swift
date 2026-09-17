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
                        spacing: 12
                    ) {

                        Text(entry.question)
                            .font(.headline)

                        Text("Correct Answer")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text(entry.answer)
                            .font(.title3)
                            .foregroundColor(.green)

                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.thinMaterial)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.15),
                            radius: 5,
                            x: 0,
                            y: 3)
                    .padding(.vertical, 4)
                }
            }
        }
        .listStyle(.automatic)
        .navigationTitle("Review Mistakes")
    }
}

#Preview {
    ReviewMissedQuestionsView()
}
