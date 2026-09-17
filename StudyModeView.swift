import SwiftUI

struct StudyModeView: View {

    @State private var currentQuestion = 0
    @State private var showAnswer = false
    @State private var selectedCategory = "All"

    @AppStorage("cardsViewed") private var cardsViewed = 0
    @AppStorage("roadRulesViewed") private var roadRulesViewed = 0
    @AppStorage("roadSignsViewed") private var roadSignsViewed = 0
    @AppStorage("safetyViewed") private var safetyViewed = 0

    var filteredQuestions: [StudyQuestion] {

        if selectedCategory == "All" {
            return studyQuestions
        }

        return studyQuestions.filter {
            $0.category == selectedCategory
        }
    }
    func nextRandomQuestion() {

        var newQuestion = currentQuestion

        while newQuestion == currentQuestion &&
              filteredQuestions.count > 1 {

            newQuestion =
                Int.random(in: 0..<filteredQuestions.count)
        }

        currentQuestion = newQuestion
        showAnswer = false
    }
    var body: some View {

        ZStack {

            LinearGradient(
                colors: [.indigo, .purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                Picker("Category", selection: $selectedCategory) {

                    Text("📚 All").tag("All")

                    Text("⚖️ Road Rules").tag("Road Rules")

                    Text("🚦 Road Signs").tag("Road Signs")

                    Text("🦺 Safety").tag("Safety")
                    
                    Text("🚗 Parking").tag("Parking")
                }
                .pickerStyle(.menu)

                Text("📖 Study Mode")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Cards Viewed: \(cardsViewed)")
                    .foregroundColor(.white)

                Text("⚖️ Road Rules: \(roadRulesViewed)")
                    .foregroundColor(.white)

                Text("🚦 Road Signs: \(roadSignsViewed)")
                    .foregroundColor(.white)

                Text("🦺 Safety: \(safetyViewed)")
                    .foregroundColor(.white)

                Text("🦺 Safety: \(safetyViewed)")
                    .foregroundColor(.white)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                VStack(spacing: 15) {

                    Text(filteredQuestions[currentQuestion].category)
                        .font(.headline)
                        .foregroundColor(.yellow)

                    Text(filteredQuestions[currentQuestion].question)
                        .font(.title2)
                        .multilineTextAlignment(.center)

                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(radius: 10)

                Button(showAnswer ? "Hide Answer" : "Show Answer") {
                    showAnswer.toggle()
                }
                .buttonStyle(.borderedProminent)

                if showAnswer {

                    VStack(spacing: 12) {

                        Text("✅ Answer")
                            .font(.headline)

                        Text(filteredQuestions[currentQuestion].answer)

                        Divider()

                        Text("📘 Explanation")
                            .font(.headline)

                        Text(filteredQuestions[currentQuestion].explanation)
                            .multilineTextAlignment(.center)

                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    
                        .padding()
                    
                }

                Button("🎲 Random Question") {

                    let category =
                        filteredQuestions[currentQuestion].category

                    cardsViewed += 1

                    if category == "Road Rules" {
                        roadRulesViewed += 1
                    }

                    if category == "Road Signs" {
                        roadSignsViewed += 1
                    }

                    if category == "Safety" {
                        safetyViewed += 1
                    }

                    currentQuestion =
                        Int.random(in: 0..<filteredQuestions.count)

                    showAnswer = false

                    if category == "Road Rules" {
                        roadRulesViewed += 1
                    }

                    if category == "Road Signs" {
                        roadSignsViewed += 1
                    }

                    if category == "Safety" {
                        safetyViewed += 1
                    }

                    showAnswer = false                }
                .buttonStyle(.bordered)

                Spacer()
            }
            .padding()
            .onChange(of: selectedCategory) {
                currentQuestion = 0
                showAnswer = false
            }
        }
    }
}

#Preview {
    StudyModeView()
}
