import SwiftUI

struct RoadSignsView: View {

    var body: some View {

        List {

            Section("Common Signs") {

                VStack(alignment: .leading) {
                    Text("🛑 STOP")
                        .font(.headline)

                    Text("Come to a complete stop.")
                }

                VStack(alignment: .leading) {
                    Text("🔺 YIELD")
                        .font(.headline)

                    Text("Give the right of way to traffic and pedestrians.")
                }

                VStack(alignment: .leading) {
                    Text("🚸 SCHOOL")
                        .font(.headline)

                    Text("School crossing or school zone ahead.")
                }

                VStack(alignment: .leading) {
                    Text("🚂 RAILROAD")
                        .font(.headline)

                    Text("Railroad crossing ahead.")
                }

                VStack(alignment: .leading) {
                    Text("⚠️ WARNING")
                        .font(.headline)

                    Text("A hazard or road condition is ahead.")
                }
            }
        }
        .navigationTitle("Road Signs")
    }
}

#Preview {
    RoadSignsView()
}
