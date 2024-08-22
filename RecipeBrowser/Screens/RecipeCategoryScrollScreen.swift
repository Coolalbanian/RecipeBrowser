//
//  RecipeCategoryListScreen.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//

import SwiftUI

struct RecipeCategoryScrollScreen: View {
    
    @StateObject var model:RecipeCategoryScrollViewModel = RecipeCategoryScrollViewModel()
    
    var body: some View {
        
            NavigationView{
                RecipeCategoryScrollView(mealCategory: model.recipeCategories)
                    .task {
                        await model.populateCategories()
                    }
                
                    .navigationTitle("Recipes")
        }
    }
}

#Preview {
    RecipeCategoryScrollScreen()
}
