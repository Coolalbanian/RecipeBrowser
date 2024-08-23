//
//  EmptyMealScreen.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/22/24.
//

import SwiftUI

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
