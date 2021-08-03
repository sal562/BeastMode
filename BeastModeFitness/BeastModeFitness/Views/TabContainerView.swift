//
//  TabContainerView.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/3/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct TabContainerView: View {
    var body: some View {
        TabView {
           
        }.accentColor(.primary)
    }
}
//DISABLED PREVIEW
//struct TabContainerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabContainerView()
//    }
//}

final class TabContainerViewModel: ObservableObject {
    
    ///Create variable to show selectedTab
    @Published var selectedTab: TabItemViewModel.TabItemType = .challengeList
    
    
    let tabItemViewModels = [
        TabItemViewModel(imageName: "note.text", title: "Log", type: .log),
        .init(imageName: "clock.arrow.2.circlepath", title: "Challenges", type: .challengeList),
        .init(imageName: "gear", title: "Settings", type: .settings)
        
    ]
}


///Create struct for TabItemViewModel
struct TabItemViewModel {
    let imageName: String
    let title: String
    let type: TabItemType
    
    ///Create enum for each Tab
    enum TabItemType {
        case log
        case challengeList
        case settings
    }
}
