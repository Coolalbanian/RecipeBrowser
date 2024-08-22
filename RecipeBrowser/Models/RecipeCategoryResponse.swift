//
//  RecipeCategoryResponse.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/20/24.
//

import Foundation

struct RecipeCategoryResponse: Decodable {
    let categories : [RecipeCategory]
}
struct RecipeCategory: Decodable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}
