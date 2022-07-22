//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Krupa Patel on 22/7/2022.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(ContentModel())
        }
    }
}
