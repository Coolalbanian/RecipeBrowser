//
//  RecipeScrollViewModel.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//

import Foundation

@MainActor
class MealScrollViewModel: ObservableObject {
    
    @Published var meals: [MealViewModel] = []
    
    func populateDessertMeals() async {
        do {
            let mealResponse = try await Webservice().get(url: Constants.Urls.mealByCategoryName("Dessert")) { data in
                return try? JSONDecoder().decode(MealResponse.self, from: data)
            }
            
            // Sort meals alphabetically by name
            self.meals = mealResponse.meals.map(MealViewModel.init).sorted { $0.strMeal < $1.strMeal }
            
        } catch {
            print("Error fetching dessert meals: \(error)")
        }
    }
}
struct MealViewModel: Identifiable {
    let id = UUID()
    private let meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    var idMeal: String{
        meal.idMeal
    }
    
    var strMeal: String {
        meal.strMeal
    }
    
    var strMealThumb: URL? {
        URL(string: meal.strMealThumb)
    }
}
