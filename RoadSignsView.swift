//
//  RoadSignsView.swift
//  MyApp
//
//  Created by Charles E Ingram Jr on 9/16/26.
//

import SwiftUI

struct RoadSignsView: View {

    var body: some View {

        List {

            Text("🛑 STOP")
            Text("Yield the right of way.")

            Text("⚠️ WARNING")
            Text("Hazard ahead.")

            Text("🚸 SCHOOL")
            Text("School zone or crossing.")

            Text("🚂 RAILROAD")
            Text("Railroad crossing ahead.")
        }
        .navigationTitle("Road Signs")
    }
}

#Preview {
    RoadSignsView()
}
