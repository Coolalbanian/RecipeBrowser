//
//  RecipeCategoryResponse.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/20/24.
//

import Foundation

// RecipeCategoryResponse is used to represent the overall structure of JSON response which contains a array of RecipeCategory objects
struct RecipeCategoryResponse: Decodable {
    let categories : [RecipeCategory]
}

// RecipeCategory models each individual Categories information
struct RecipeCategory: Decodable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}
