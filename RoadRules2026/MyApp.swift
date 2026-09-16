import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

                Text("Illinois Permit Prep")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                NavigationLink("Practice Test") {
                    PracticeTestView()
    
                }

                NavigationLink("Road Signs") {
                    Text("Road Signs Screen")
                }

                NavigationLink("Study Guide") {
                    Text("Study Guide Screen")
                }

            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
