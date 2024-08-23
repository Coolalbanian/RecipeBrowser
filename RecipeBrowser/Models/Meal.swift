//
//  Recipe.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//

import Foundation
// MealResponse is used to represent the overall structure of JSON response which contains a array of Meal objects
struct MealResponse: Decodable {
    let meals: [Meal]
}
// Meal models each individual meals information
struct Meal: Decodable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
