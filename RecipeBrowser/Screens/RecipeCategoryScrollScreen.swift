//
//  RecipeCategoryListScreen.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//

import SwiftUI

// The RecipeCategoryScrollScreen struct is a SwiftUI view responsible for displaying
// the available recipe categories in the application.
struct RecipeCategoryScrollScreen: View {
    
    @StateObject var model:RecipeCategoryScrollViewModel = RecipeCategoryScrollViewModel()
    
    var body: some View {
        
            NavigationView{
                RecipeCategoryScrollView(categories: model.recipeCategories)
                    .task {
                        await model.populateCategories()
                    }
                
                    .navigationTitle("Categories")
        }
    }
}

#Preview {
    RecipeCategoryScrollScreen()
}
