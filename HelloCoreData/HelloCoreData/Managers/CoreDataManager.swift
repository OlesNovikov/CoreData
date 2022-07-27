//
//  CoreDataManager.swift
//  HelloCoreData
//
//  Created by Oles Novikov on 27.07.22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "HelloCoreDataModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data Store failed to initialize \(error.localizedDescription)")
            }
        }
    }
    
    func getAllMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Fetch error \(error.localizedDescription)")
            return []
        }
    }
    
    func saveMovie(title: String) {
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title
        do {
            try persistentContainer.viewContext.save()
            print("Movie saved!")
        } catch {
            print("Failed to save movie \(error.localizedDescription)")
        }
    }
    
    func deleteMovie(movie: Movie) {
        persistentContainer.viewContext.delete(movie)
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Delete error \(error.localizedDescription)")
        }
    }
    
    func updateMovie() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Error in updating movie \(error.localizedDescription)")
        }
    }
    
}
