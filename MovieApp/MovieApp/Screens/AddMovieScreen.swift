//
//  AddMovieScreen.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/24/21.
//

import SwiftUI

struct AddMovieScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var addMovieViewModel = AddMovieViewModel()
    
    var body: some View {
        Form {
            TextField("Enter name", text: $addMovieViewModel.title)
            TextField("Enter director", text: $addMovieViewModel.director)
            HStack {
                Text("Rating")
                Spacer()
                RatingView(rating: $addMovieViewModel.rating)
            }
            DatePicker("Release Date", selection: $addMovieViewModel.releaseDate)
            
            HStack {
                Spacer()
                Button("Save") {
                    addMovieViewModel.save()
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }
            
        }
        .navigationTitle("Add Movie")
        .embedInNavigationView()
    }
}

struct AddMovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieScreen()
    }
}
