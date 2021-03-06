//
//  SettingsViewModel.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/17/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI
import Combine
import Firebase

final class SettingsViewModel : ObservableObject {

    @Published private(set) var itemViewModels: [SettingsItemViewModel] = []
    ///shortcut for userDefault
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @Published var loginSignupPush = false
    
    let title = "Settings"
    private let userService: UserServiceProtocol
    private var cancellables: [AnyCancellable] = []
    
    ///inject userService
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
    }
    
    ///new way using item(at) function to pass position
    func item(at index: Int) -> SettingsItemViewModel {
        ///grab index from itemViewModel
        itemViewModels[index]
    }
    ///new method of detecting tap
    func tappedItem(at index: Int)   {
        switch itemViewModels[index].type {
        
        case .account:
            ///will prevent user from going to signup page if email already exists (logged in)
            guard userService.currentUser?.email == nil else { return }
            loginSignupPush = true
        case .mode:
            ///change from light to dark
            isDarkMode = !isDarkMode
            ///rebuilt setttings items
            buildItems()
        case .logout:
            userService.logout().sink { completion in
                switch completion {
                case let .failure(error):
                    print(error.localizedDescription)
                case let .finished: break
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
        default:
            break
        }
    }
    
    private func buildItems() {
        itemViewModels = [
            ///initialize the settings items
//            .init(title: "Create Account", iconName: "person.circle", type: .account),
            ///user userService to display currentUser email from firebase instead of asking to Create Account
            .init(title: userService.currentUser?.email ?? "Create Account", iconName: "person.circle", type: .account),
            .init(title: "Switch to \(isDarkMode ? "Light" : "Dark") Mode", iconName: "lightbulb", type: .mode),
            .init(title: "Privacy Policy", iconName: "lock.shield", type: .privacy)
        ]
        
        ///setup ability to logout if logged in - only appears if logged in
        if userService.currentUser?.email != nil {
            itemViewModels += [.init(title: "Logout", iconName: "arrowshape.turn.up.left.circle", type: .logout)]
        }
    }
    
    ///func to trigger onApper and init default settings
    func onAppear() {
        buildItems()
    }
    
    
}
