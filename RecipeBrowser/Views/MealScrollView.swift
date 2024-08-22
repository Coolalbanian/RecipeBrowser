//
//  MealScrollView.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//

import SwiftUI

struct MealScrollView: View {
    
    let meals: [MealViewModel]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(meals) { meal in
                    NavigationLink(destination: MealDetailView(mealID: meal.idMeal)) {
                        MealCellView(meal: meal)
                    }
                }
            }
            .padding()
        }
    }
}
