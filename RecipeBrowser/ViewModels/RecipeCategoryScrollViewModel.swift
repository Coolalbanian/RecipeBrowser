//
//  RecipeCategoryListViewModel.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/20/24.
//

import Foundation


@MainActor
class RecipeCategoryScrollViewModel: ObservableObject {
    
    @Published var recipeCategories: [RecipeCategoryViewModel] = []
    
    func populateCategories() async {
        do{
            let recipeCategoryResponse = try await Webservice().get(url: Constants.Urls.recipeCategoriesUrl) { data in
                return try? JSONDecoder().decode(RecipeCategoryResponse.self, from: data)
            }
            
            self.recipeCategories = recipeCategoryResponse.categories.map(RecipeCategoryViewModel.init)
            
        } catch {
            print(error)
        }
    }
    
}

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

