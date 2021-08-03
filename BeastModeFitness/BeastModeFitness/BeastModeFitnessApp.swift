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
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ///Check to see if logged in or not - Choose landing page or TabBarview
            if appState.isLoggedIn {
                TabContainerView()
                } else {
                    LandingPageView()
                }
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

    ///create init & set userService
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
        
        ///To logout manually from FB - For Testing Only
//        try? Auth.auth().signOut()
        
        ///start observing publisher
        userService.observeAuthChanges() ///gives us option user
            ///Map to allow user asLong as its not nil
            .map { $0 != nil }
            ///map will pass true or false value for $isLoggedIn to determine user login state
            .assign(to: &$isLoggedIn)
    }
    
}
