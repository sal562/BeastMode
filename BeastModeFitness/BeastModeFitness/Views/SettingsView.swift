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
        
        List(settingsVM.itemViewModels.indices, id:\.self) { item in
            Text(settingsVM.itemViewModel[index].title)
        }
        
            .onAppear(perform: {
                settingsVM.onAppear()
            })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
