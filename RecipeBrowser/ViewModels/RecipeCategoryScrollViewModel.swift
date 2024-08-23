//
//  RecipeCategoryListViewModel.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/20/24.
//

import Foundation


@MainActor
// This class manages the state and data fetching logic for recipe categories in the Recipe Browser app.
class RecipeCategoryScrollViewModel: ObservableObject {
    
    // The @Published attribute ensures that any changes to the RecipeCategoryViewModel will automatically update the UI.
    @Published var recipeCategories: [RecipeCategoryViewModel] = []
    
    // Asynchronous function to fetch and populate the recipe categories.
    func populateCategories() async {
        do{
            
            // fetch data from the API using the Webservice class.
            // The URL used is stored in Constants.Urls.recipeCategoriesUrl.
            let recipeCategoryResponse = try await Webservice().get(url: Constants.Urls.recipeCategoriesUrl) { data in
                return try? JSONDecoder().decode(RecipeCategoryResponse.self, from: data)
            }
            
            // Map the decoded categories into an array of RecipeCategoryViewModel objects.
            self.recipeCategories = recipeCategoryResponse.categories.map(RecipeCategoryViewModel.init)
            
        } catch {
            
            // if a error occurs during the data fetching or decoding process, it will get caught here.
            print(error)
        }
    }
    
}
// The RecipeCategoryViewModel struct represents a single recipe category.
struct RecipeCategoryViewModel: Identifiable {
    
    let id = UUID()
    private let recipeCategory: RecipeCategory
    
    init(_ recipeCategory: RecipeCategory) {
        self.recipeCategory = recipeCategory
    }
    
    var strCategory: String {
        recipeCategory.strCategory
    }
    
    var strCategoryThumb: URL? {
        URL(string: recipeCategory.strCategoryThumb)
    }
}

