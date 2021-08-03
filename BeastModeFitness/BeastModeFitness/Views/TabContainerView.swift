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
            Text("Tab 1")
                .tabItem { Image(systemName: "note.text") }
            Text("Challenges")
                .tabItem { Image(systemName: "clock.arrow.2.circlepath") }
            Text("Settings")
                .tabItem { Image(systemName: "gear") }
        }.accentColor(.primary)
    }
}
//
//struct TabContainerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabContainerView()
//    }
//}

final class TabContainerViewModel: ObservableObject {
    
}


///
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
