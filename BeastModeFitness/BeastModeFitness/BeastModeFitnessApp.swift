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
            //check firebase auth state to determine view - tabBar (logged in) vs create but not save?
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


///Create App State
class AppState: ObservableObject {
    
    @Published private(set) var isLoggedIn = false
    
    ///create userServiceProtocol
    private let userService: UserServiceProtocol
    

    
    ///create init
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
        
        ///start observing publisher
    }
    
}
