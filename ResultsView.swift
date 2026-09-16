import SwiftUI

struct ResultsView: View {

    let score: Int
    let totalQuestions: Int
    let restartQuiz: () -> Void

    var body: some View {

        let percentage = Int(
            Double(score) /
            Double(totalQuestions) * 100
        )

        let letterGrade: String

        switch percentage {
        case 90...100:
            letterGrade = "A"
        case 80..<90:
            letterGrade = "B"
        case 70..<80:
            letterGrade = "C"
        case 60..<70:
            letterGrade = "D"
        default:
            letterGrade = "F"
        }

        return VStack(spacing: 20) {

            Text("🎉 Quiz Complete!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Final Score")
                .font(.title2)

            Text("\(score) / \(totalQuestions)")
                .font(.system(size: 50))
                .fontWeight(.bold)

            Text("\(percentage)%")
                .font(.title)
                .fontWeight(.semibold)

            Text("Grade: \(letterGrade)")
                .font(.title2)

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
