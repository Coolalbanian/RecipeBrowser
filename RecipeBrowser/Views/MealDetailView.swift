//
//  MealDetailView.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//

import SwiftUI

struct MealDetailView: View {
    let mealID: String
    
    @StateObject private var mealDetailVM = MealDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let mealDetail = mealDetailVM.mealDetail {
                    Text(mealDetail.strMeal)
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Instructions")
                        .font(.headline)
                    Text(mealDetail.strInstructions)
                    
                    Text("Ingredients")
                        .font(.headline)
                    ForEach(mealDetail.ingredientsAndMeasurements, id: \.self) { ingredient in
                        Text(ingredient)
                    }
                } else if let errorMessage = mealDetailVM.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.headline)
                } else {
                    ProgressView("Loading...")
                }
            }
            .padding()
        }
        .task {
            await mealDetailVM.fetchMealDetail(by: mealID)
        }
        .navigationTitle("Meal Details")
    }
}
