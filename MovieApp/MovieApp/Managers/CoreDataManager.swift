//
//  CoreDataManager.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/23/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared: CoreDataManager = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "MovieAppModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error.localizedDescription)")
            }
        }
    }
    
    func getMovieById(id: NSManagedObjectID) -> Movie? {
        do {
            return try persistentContainer.viewContext.existingObject(with: id) as? Movie
        } catch {
            print("Failed to get movie by id \(error.localizedDescription)")
            return nil
        }
    }
    
    func save() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save a movie \(error.localizedDescription)")
        }
    }
    
    func getAllMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Error in fetching movies \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteMovie(_ movie: Movie) {
        persistentContainer.viewContext.delete(movie)
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to delete movie \(error.localizedDescription)")
            persistentContainer.viewContext.rollback()
        }
    }
    
}


