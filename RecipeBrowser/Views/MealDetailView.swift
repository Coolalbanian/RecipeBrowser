//
//  MealDetailView.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//

import SwiftUI

// The MealDetailView struct is a SwiftUI view that displays detailed information about a specific meal.
struct MealDetailView: View {
    // The mealID property holds the unique identifier for the meal.
    // Which is used to fetch the detailed information for the specific meal.
    let mealID: String
    
    // The mealDetailVM property is an instance of MealDetailViewModel, which is responsible
    // for fetching and managing the meal's details. Which is marked with @StateObject to observe
    // changes and update the UI accordingly.
    @StateObject private var mealDetailVM = MealDetailViewModel()
    
    var body: some View {
        // ScrollView allows the content to be scrollable if it exceeds the screen height.
        ScrollView {
            // VStack arranges the content vertically.
            VStack(alignment: .leading, spacing: 20) {
                // Check if mealDetail is available.
                if let mealDetail = mealDetailVM.mealDetail {
                    // Display the meal's name as a large
                    Text(mealDetail.strMeal)
                        .font(.largeTitle)
                        .bold()
                    // Section title for the instructions.
                    Text("Instructions")
                        .font(.headline)
                    // Display the meal's instructions.
                    Text(mealDetail.strInstructions)
                    
                    // Section title for the ingredients.
                    Text("Ingredients")
                        .font(.headline)
                    // ForEach loop iterates over the ingredientsAndMeasurements array,
                    // displaying each ingredient with its corresponding measurement.
                    ForEach(mealDetail.ingredientsAndMeasurements, id: \.self) { ingredient in
                        Text(ingredient)
                    }
                } else if let errorMessage = mealDetailVM.errorMessage {
                    // If an error occurred while fetching data, display the error message in red.
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.headline)
                } else {
                    // While the data is being loaded, display a loading indicator.
                    ProgressView("Loading...")
                }
            }
            // Adds padding around the VStack for better spacing from the edges.
            .padding()
        }
        // The .task modifier calls the fetchMealDetail method of the ViewModel, passing the mealID to fetch the meal details.
        .task {
            await mealDetailVM.fetchMealDetail(by: mealID)
        }
        // Sets the navigation title for this view to "Meal Details".
        .navigationTitle("Meal Details")
    }
}
