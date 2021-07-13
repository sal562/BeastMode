//
//  BeastModeFitnessApp.swift
//  BeastModeFitness
//
//  Created by sal562 on 7/7/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.

import SwiftUI
import Firebase

@main
struct BeastModeFitnessApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            LandingPageView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        print("Setting Up firebase")
        FirebaseApp.configure()
        return true
    }
}
