//
//  RecipeScrollScreen.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//
import SwiftUI

// The MealScrollScreen struct is a SwiftUI view responsible for displaying the meals
// in the "Dessert" category.
struct MealScrollScreen: View {
    
    @StateObject private var mealScrollVM = MealScrollViewModel()
    
    var body: some View {
        MealScrollView(meals: mealScrollVM.meals)
            .task {
                await mealScrollVM.populateDessertMeals()
            }
            .navigationTitle("Desserts")
    }
}

#Preview {
    
    MealScrollScreen()
}
