//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by vijeesh k on 30/01/25.
//

import SwiftUI

@main
struct MovieAppApp: App {
    @StateObject private var router = Router()

     var body: some Scene {
         WindowGroup {
             CoordinatorView()
                 .environmentObject(router)
         }
     }
}
