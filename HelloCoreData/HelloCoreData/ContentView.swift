//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Oles Novikov on 27.07.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var movieName: String = ""
    @State private var movies: [Movie] = [Movie]()
    @State private var needsRefresh: Bool = false
    
    let coreDM: CoreDataManager
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter movie name", text: $movieName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save") {
                    coreDM.saveMovie(title: movieName)
                    populateMovies()
                }
                
                List {
                    ForEach(movies, id: \.self) { movie in
                        NavigationLink(destination: MovieDetailView( needsRefresh: $needsRefresh, movie: movie, coreDM: coreDM)) {
                            Text(movie.title ?? "")
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let movie = movies[index]
                            coreDM.deleteMovie(movie: movie)
                            populateMovies()
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .accentColor(needsRefresh ? .white : .black)
                
                Spacer()
            }
            .padding()
            .onAppear() {
                populateMovies()
            }
        }
    }
    
    private func populateMovies() {
        movies = coreDM.getAllMovies()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
