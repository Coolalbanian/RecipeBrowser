//
//  RecipeScrollViewModel.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//

import Foundation

@MainActor

// This class manages the state and data fetching logic for the array of meal objects in the different meal categories.
class MealScrollViewModel: ObservableObject {
    
    // The @Published attribute ensures that any changes to the MealViewModel will automatically update the UI.
    @Published var meals: [MealViewModel] = []
    
    // Asynchronous function to fetch and populate the Dessert Category.
    func populateDessertMeals() async {
        do {
            
            // fetch data from the API using the Webservice class.
            // The URL used is stored in Constants.Urls.mealByCategoryName.
            // Specifially fetches the meals in the Dessert Category
            let mealResponse = try await Webservice().get(url: Constants.Urls.mealByCategoryName("Dessert")) { data in
                return try? JSONDecoder().decode(MealResponse.self, from: data)
            }
            
            // Sort meals alphabetically by name.
            // The sorted array is then assigned to the meals property
            self.meals = mealResponse.meals.map(MealViewModel.init).sorted { $0.strMeal < $1.strMeal }
            
        } catch {
            
            // if a error occurs during the data fetching or decoding process. it will get caught here.
            print("Error fetching dessert meals: \(error)")
        }
    }
}
// The MealViewModel struct represents a list of meal.
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
