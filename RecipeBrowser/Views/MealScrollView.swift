//
//  MealScrollView.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//

import SwiftUI

// The MealScrollView struct is a SwiftUI view responsible for displaying
// a grid of meals.
struct MealScrollView: View {
    
    // The meals property holds an array of MealViewModel objects which represents the data
    // for each meal that will be displayed in the grid.
    let meals: [MealViewModel]
    
    // The columns array defines a flexible grid layout with two columns.
    // Each column can flexibly adjust its size to fit the content.
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    // The body property defines the view's content and layout.
    var body: some View {
        // ScrollView allows the content to be scrollable if it exceeds the screen height.
        ScrollView {
            // LazyVGrid is used to create a grid layout that loads cells lazily,
            // meaning only the visible cells are loaded into memory, improving performance.
            LazyVGrid(columns: columns, spacing: 20) {
                // ForEach iterates over each meal in the meals array.
                // It generates a NavigationLink for each meal, allowing users to navigate to a detailed view of the selected meal.
                ForEach(meals) { meal in
                    // NavigationLink creates a navigable item in the grid.
                    // When tapped, it navigates to the MealDetailView, passing the meal's ID.
                    NavigationLink(destination: MealDetailView(mealID: meal.idMeal)) {
                        // MealCellView is responsible for displaying the meal's thumbnail and name.
                        MealCellView(meal: meal)
                    }
                }
            }
            // Add's padding around the LazyVGrid allowing for better spacing
            .padding()
        }
    }
}
