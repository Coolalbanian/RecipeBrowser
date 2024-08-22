//
//  Recipe.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//

import Foundation

struct MealResponse: Decodable {
    let meals: [Meal]
}
struct Meal: Decodable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
