//
//  RecipeScrollScreen.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//
import SwiftUI

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
