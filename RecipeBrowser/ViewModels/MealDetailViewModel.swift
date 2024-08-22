//
//  MealDetailViewModel.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//

import Foundation

@MainActor
class MealDetailViewModel: ObservableObject {
    
    @Published var mealDetail: MealDetail?
    @Published var errorMessage: String?
    
    func fetchMealDetail(by id: String) async {
        do {
            let mealDetailResponse = try await Webservice().get(url: Constants.Urls.mealById(id)) { data in
                return try? JSONDecoder().decode(MealDetailResponse.self, from: data)
            }
            
            if let mealDetail = mealDetailResponse.meals?.first {
                self.mealDetail = mealDetail
                self.errorMessage = nil
            } else {
                self.errorMessage = "Meal details not found."
            }
        } catch {
            self.errorMessage = "Error fetching meal details: \(error.localizedDescription)"
        }
    }
}
