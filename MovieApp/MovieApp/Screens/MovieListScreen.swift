//
//  MovieListScreen.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/24/21.
//

import SwiftUI

struct MovieListScreen: View {
    
    @StateObject private var movieListViewModel = MovieListViewModel()
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        List {
            ForEach(movieListViewModel.movies, id: \.id) { movie in
                MovieCell(movie: movie)
            }
            .onDelete(perform: deleteMovie)
        }.listStyle(PlainListStyle())
        
        .navigationTitle("Movies")
        .navigationBarItems(trailing: Button("Add Movie") {
            isPresented = true 
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            movieListViewModel.getAllMovies()
        }, content: {
            AddMovieScreen()
        })
        .embedInNavigationView()
        
        .onAppear {
//            UITableView.appearance().separatorStyle = .none
//            UITableView.appearance().separatorColor = .clear
            movieListViewModel.getAllMovies()
        }
    }
    
    private func deleteMovie(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let movie = movieListViewModel.movies[index]
            movieListViewModel.deleteMovie(movie: movie)
            movieListViewModel.getAllMovies()
        }
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieListScreen()
        }
    }
}

struct MovieCell: View {
    
    let movie: MovieViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .fontWeight(.bold)
//                    .font(.system(size: 22))
                Text(movie.director)
                    .font(.caption2)
//                    .opacity(0.5)
                Text(movie.releaseDate ?? "")
                    .font(.caption)

            }
            Spacer()
            RatingView(rating: .constant(movie.rating))
//            HStack {
//                Image(systemName: "star.fill")
//                    .foregroundColor(.yellow)
//                Text("\(movie.rating!)")
//            }
        }
//        .padding()
//        .foregroundColor(Color.black)
//        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9567790627, green: 0.9569163918, blue: 0.9567491412, alpha: 1)), Color(#colorLiteral(red: 0.9685427547, green: 0.9686816335, blue: 0.9685124755, alpha: 1))]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
//        .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
    }
}
