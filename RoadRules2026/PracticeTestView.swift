import SwiftUI

struct PracticeTestView: View {
    
    @State private var currentQuestion = 0
    @State private var score = 0
    @State private var result = ""
    @State private var quizComplete = false
    @State private var quizQuestions = questions.shuffled()
    
    private func saveMissedQuestion(
        question: String,
        correctAnswer: String
    ) {
        let defaults = UserDefaults.standard
        
        var existing =
        defaults.string(forKey: "missedQuestions")?
            .components(separatedBy: "\n") ?? []
        
        let entry = "\(question)|\(correctAnswer)"
        
        if !existing.contains(entry) {
            existing.append(entry)
        }
        
        defaults.set(
            existing.joined(separator: "\n"),
            forKey: "missedQuestions"
        )
    }
    var body: some View {
        
        if quizComplete {
            
            ResultsView(
                score: score,
                totalQuestions: questions.count,
                restartQuiz: {
                    
                    score = 0
                    currentQuestion = 0
                    result = ""
                    quizComplete = false
                    
                }
            )
            
        } else {
            
            let question = quizQuestions[currentQuestion]
            
            VStack(spacing: 20) {
                Text("Question \(currentQuestion + 1) of \(quizQuestions.count)")
                    .font(.headline)
                
                Text("Score: \(score)")
                    .font(.headline)
                
                Text(question.question)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                
                ForEach(question.answers, id: \.self) { answer in
                    
                    Button(answer) {
                        
                        if answer == question.correctAnswer {
                            
                            score += 1
                            result = "✅ Correct"
                            
                        } else {
                            
                            saveMissedQuestion(
                                question: question.question,
                                correctAnswer: question.correctAnswer
                            )
                            
                            result = "❌ Incorrect"
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            
                            if currentQuestion < quizQuestions.count - 1 {
                                
                                currentQuestion += 1
                                result = ""
                                
                            } else {
                                
                                quizComplete = true
                            }
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                Text(result)
                    .font(.headline)
            }
            .padding()
        }
    }
}

#Preview {
    PracticeTestView()
}
