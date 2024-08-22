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
            let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
            let mealResponse = try await Webservice().get(url: url) { data in
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
