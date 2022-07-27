//
//  MovieListScreen.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/24/21.
//

import SwiftUI

struct MovieListScreen: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        List {
            Text("Movies")
        }.listStyle(PlainListStyle())
        
        .navigationTitle("Movies")
        .navigationBarItems(trailing: Button("Add Movie") {
            isPresented = true 
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            
        }, content: {
            AddMovieScreen()
        })
        .embedInNavigationView()
        
        .onAppear(perform: {
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().separatorColor = .clear
        })
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieListScreen()
        }
    }
}

//struct MovieCell: View {
//
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading, spacing: 5) {
//                Text(movie.title)
//                    .fontWeight(.bold)
//                    .font(.system(size: 22))
//                Text(movie.director)
//                    .font(.callout)
//                    .opacity(0.5)
//                Spacer()
//
//            }
//            Spacer()
//            HStack {
//                Image(systemName: "star.fill")
//                    .foregroundColor(.yellow)
//                Text("\(movie.rating!)")
//            }
//        }
//        .padding()
//        .foregroundColor(Color.black)
//        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9567790627, green: 0.9569163918, blue: 0.9567491412, alpha: 1)), Color(#colorLiteral(red: 0.9685427547, green: 0.9686816335, blue: 0.9685124755, alpha: 1))]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
//        .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
//    }
//}
