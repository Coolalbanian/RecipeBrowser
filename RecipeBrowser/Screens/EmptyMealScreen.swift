//
//  EmptyMealScreen.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/22/24.
//

import SwiftUI

// The EmptyMealScreen struct is a SwiftUI view responsible for displaying a message
// when the user navigates to a meal category that is not "Dessert."
struct EmptyMealScreen: View {
    var body: some View {
        Text("No meals available for this category.")
            .font(.headline)
            .padding()
    }
}

#Preview {
    EmptyMealScreen()
}
