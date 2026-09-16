import SwiftUI

struct StatisticsView: View {

    @AppStorage("bestScore") private var bestScore = 0
    @AppStorage("lastScore") private var lastScore = 0
    @AppStorage("testsTaken") private var testsTaken = 0
    @AppStorage("totalScore") private var totalScore = 0
    
    var averageScore: Int {

        if testsTaken == 0 {
            return 0
        }

        return totalScore / testsTaken
    }

    var body: some View {

        ZStack {

            LinearGradient(
                colors: [.purple, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {

                Text("📊 Statistics")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                VStack(spacing: 12) {

                    Text("🏆 Best Score: \(bestScore)%")

                    Text("📈 Last Score: \(lastScore)%")

                    Text("📚 Tests Taken: \(testsTaken)")
                    
                    Text("📊 Average Score: \(averageScore)%")
                    
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                VStack(alignment: .leading, spacing: 10) {

                    Text("🏅 Achievements")
                        .font(.title2)
                        .fontWeight(.bold)

                    if testsTaken >= 1 {
                        Text("✅ First Quiz")
                    }

                    if testsTaken >= 5 {
                        Text("✅ Quiz Master (5 Tests)")
                    }

                    if bestScore >= 90 {
                        Text("✅ Scored 90%")
                    }

                    if bestScore == 100 {
                        Text("✅ Perfect Score")
                    }
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    StatisticsView()
}
