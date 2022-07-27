//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by Mohammad Azam on 2/8/21.
//

import SwiftUI

@main
struct HelloCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
