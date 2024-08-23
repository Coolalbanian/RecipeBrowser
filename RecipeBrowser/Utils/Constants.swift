//
//  Constants.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/20/24.
//

import Foundation
//Contains a structure that is used to store the URLs needed to interact with the MealDB API.
struct Constants {
    
    struct Urls{
        
        static let recipeCategoriesUrl = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!
        
        static func mealByCategoryName(_ name: String) -> URL {
            return URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=\(name)")!
        }
        
        static func mealById(_ id: String) -> URL {
            return URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
        }
    }
}
