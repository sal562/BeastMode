//
//  SettingsView.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/17/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var settingsVM = SettingsViewModel()
    
    var body: some View {
        
        List(settingsVM.itemViewModels.indices, id:\.self) { index in
            
            ///Create Button to Detect if clicked
            Button(action: {
                settingsVM.tappedItem(at: index)
            }, label: {
                HStack {
    //                Image(systemName:settingsVM.itemViewModels[index].iconName)
    //                Text(settingsVM.itemViewModels[index].title)
                    ///new way using item(at) function
                    Image(systemName:settingsVM.item(at: index).iconName)
                    Text(settingsVM.item(at: index).title)
                }
            })
        }.onAppear(perform: {
            settingsVM.onAppear()
        })
        ///use background for NavLink to signup page
        .background(
        
            NavigationLink(
                ///create a binding with isPushed
                destination: LoginSignupPageView(mode: .signup, isPushed: $settingsVM.loginSignupPush),
                isActive: $settingsVM.loginSignupPush,
                label: {
                    Text("Navigate")
                })
        
        )
        
        ///set nav title
        .navigationTitle(settingsVM.title)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
