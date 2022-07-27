//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Oles Novikov on 27.07.22.
//

import Foundation
import CoreData

class MovieListViewModel: ObservableObject {
    
    @Published var movies: [MovieViewModel] = [MovieViewModel]()
    
    func getAllMovies() {
        let movies = CoreDataManager.shared.getAllMovies()
        DispatchQueue.main.async {
            self.movies = movies.map(MovieViewModel.init)
        }
    }
    
    func deleteMovie(movie: MovieViewModel) {
        let movie = CoreDataManager.shared.getMovieById(id: movie.id)
        if let movie = movie {
            CoreDataManager.shared.deleteMovie(movie)
        }
    }
    
}

struct MovieViewModel {
    
    let movie: Movie
    
    var id: NSManagedObjectID {
        return movie.objectID
    }
    
    var title: String {
        return movie.title ?? ""
    }
    
    var director: String {
        return movie.director ?? "Not available"
    }
    
    var releaseDate: String? {
        return movie.releaseDate?.asFormattedString()
    }
    
    var rating: Int? {
        return Int(movie.rating)
    }
    
}
