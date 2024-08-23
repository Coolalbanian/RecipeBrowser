//
//  MealCellView.swift
//  RecipeBrowser
//
//  Created by Alban Reci on 8/21/24.
//

import SwiftUI

// The MealCellView struct is a SwiftUI view that represents a single meal cell,
// and displays the meal's thumbnail image and name, styled with various visual effects.
struct MealCellView: View {
    
    // The meal property holds an instance of MealViewModel.
    // This view model provides the data needed to display the meal's image and name.
    let meal: MealViewModel
    
    var body: some View {
        VStack {
            // AsyncImage is used to load and display the meal's thumbnail image asynchronously.
            // It provides a placeholder image while the actual image is being loaded.
            AsyncImage(url: meal.strMealThumb) { image in 
                // Once the image is loaded, it is resized and displayed with a specific aspect ratio.
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    // Overlay adds the meals name as a text overlay at the bottom of the image.
                    .overlay(alignment: .bottom){
                        Text(meal.strMeal)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            } placeholder: {
                // Placeholder image is displayed while the actual image is being loaded.
                // It provides a fallback in case the image fails to load.
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom){
                        // Adds the meal name as a text overlay on the placeholder image.
                        Text(meal.strMeal)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            }
        }
        .frame(width: 160, height: 217, alignment: .center) // Sets the size of the entire cell.
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3),Color(.gray)]), startPoint: .top, endPoint: .bottom)) // Applies a gradient background to the cell.
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)) // Clips the cell to a rounded rectangle shape with a corner radius of 20 points.
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10) // Adds a shadow to the entire cell for a raised effect.
    }
}
