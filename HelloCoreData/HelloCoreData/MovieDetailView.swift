//
//  MovieDetailView.swift
//  HelloCoreData
//
//  Created by Oles Novikov on 27.07.22.
//

import SwiftUI

struct MovieDetailView: View {
    
    @State private var movieName: String = ""
    
    @Binding var needsRefresh: Bool
    
    let movie: Movie
    let coreDM: CoreDataManager
    
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Update") {
                if !movieName.isEmpty {
                    movie.title = movieName
                    coreDM.updateMovie()
                    needsRefresh.toggle()
                }
            }
        }
        .padding()
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let coreDM = CoreDataManager()
        let movie = Movie(context: coreDM.persistentContainer.viewContext)
        MovieDetailView(needsRefresh: .constant(false), movie: movie, coreDM: coreDM)
    }
}
