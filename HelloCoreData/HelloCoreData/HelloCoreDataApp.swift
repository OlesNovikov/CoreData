//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by Oles Novikov on 27.07.22.
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
