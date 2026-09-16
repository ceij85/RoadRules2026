import SwiftUI

struct ResultsView: View {

    let score: Int
    let totalQuestions: Int
    let restartQuiz: () -> Void

    @AppStorage("bestScore") private var bestScore = 0
    @AppStorage("testsTaken") private var testsTaken = 0
    @AppStorage("lastScore") private var lastScore = 0
    @AppStorage("totalScore") private var totalScore = 0

    var percentage: Int {
        Int((Double(score) / Double(totalQuestions)) * 100)
    }

    var letterGrade: String {
        switch percentage {
        case 90...100:
            return "A"
        case 80..<90:
            return "B"
        case 70..<80:
            return "C"
        case 60..<70:
            return "D"
        default:
            return "F"
        }
    }

    var gradeColors: [Color] {
        switch letterGrade {

        case "A":
            return [.green, .mint]

        case "B":
            return [.blue, .cyan]

        case "C":
            return [.yellow, .orange]

        case "D":
            return [.orange, .red]

        default:
            return [.red, .black]
        }
    }

    var body: some View {

        ZStack {

            LinearGradient(
                colors: gradeColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {

                Text("🎉 Quiz Complete!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("\(score) / \(totalQuestions)")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("\(percentage)%")
                    .font(.title)
                    .foregroundColor(.white)

                Text("Grade: \(letterGrade)")
                    .font(.title2)
                    .foregroundColor(
                        letterGrade == "A" ? .green :
                        letterGrade == "B" ? .blue :
                        letterGrade == "C" ? .yellow :
                        letterGrade == "D" ? .orange :
                        .red
                    )

                VStack(spacing: 10) {

                    Text("Best Score: \(bestScore)%")

                    Text("Last Score: \(lastScore)%")

                    Text("Tests Taken: \(testsTaken)")
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(15)

                Button("Try Again") {
                    restartQuiz()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .onAppear {

            testsTaken += 1

            totalScore += percentage

            lastScore = percentage

            if percentage > bestScore {
                bestScore = percentage
            }
        }
    }
}

#Preview {
    ResultsView(
        score: 8,
        totalQuestions: 10,
        restartQuiz: {}
    )
}
