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
                    RoadSignsView()
                }

                NavigationLink("Study Guide") {
                    Text("Study Guide Coming Soon")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
