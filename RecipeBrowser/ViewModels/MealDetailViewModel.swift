//
//  MealDetailViewModel.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//

import Foundation

@MainActor

// The MealDetailViewModel is responsable for the fetching and management
// of the detailed information about a specific meal.
class MealDetailViewModel: ObservableObject {
    
    // @Published properties to hold the meal detail data and any error messages and will automatically update in the UI
    @Published var mealDetail: MealDetail?
    @Published var errorMessage: String?
    
    // Asynchronous function to fetch detailed information about a meal by its unique ID.
    func fetchMealDetail(by id: String) async {
        do {
            
            // Fetch meal details from the API using the Webservice class.
            // The URL used is stored in Constants.Urls.mealById.
            let mealDetailResponse = try await Webservice().get(url: Constants.Urls.mealById(id)) { data in
                return try? JSONDecoder().decode(MealDetailResponse.self, from: data)
            }
            
            // If the response contains a valid meal detail, assign it to the mealDetail property,
            // and clear any previous error messages.
            if let mealDetail = mealDetailResponse.meals?.first {
                self.mealDetail = mealDetail
                self.errorMessage = nil
            } else {
                // Sends a error message if no meal details are found
                self.errorMessage = "Meal details not found."
            }
        } catch {
            // If an error occurs during data fetching or decoding, catch it and set an error message.
            self.errorMessage = "Error fetching meal details: \(error.localizedDescription)"
        }
    }
}
