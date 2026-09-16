import SwiftUI

struct ContentView: View {

    @AppStorage("bestScore") private var bestScore = 0
    @AppStorage("testsTaken") private var testsTaken = 0

    var body: some View {

        NavigationStack {

            ZStack {

                LinearGradient(
                    colors: [.purple, .blue],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 20) {

                    Text("🚦 Illinois Permit Prep")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    VStack(spacing: 10) {

                        Text("🏆 Best Score: \(bestScore)%")

                        Text("📚 Tests Taken: \(testsTaken)")
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)

                    Spacer()

                    NavigationLink("📝 Practice Test") {
                        PracticeTestView()
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)

                    NavigationLink("🚦 Road Signs") {
                        RoadSignsView()
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)

                    NavigationLink("📊 Statistics") {
                        StatisticsView()
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)

                    NavigationLink("📖 Study Guide") {
                        Text("Study Guide Coming Soon")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)

                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
