//
//  TabContainerView.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/3/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct TabContainerView: View {
    
    @State private var tabContainerVM = TabContainerViewModel()
    
    var body: some View {
        TabView(selection: $tabContainerVM.selectedTab) {
            ForEach(tabContainerVM.tabItemViewModels, id:\.self) { vmTabSelected in
                ///create view for each
                tabView(for: vmTabSelected.type)
                    .tabItem {
                        Label(
                            title: { Text(vmTabSelected.title) },
                            icon: { Image(systemName: vmTabSelected.imageName) })
                    } ///Necessary to add tag function propertly and show default tab
                    .tag(vmTabSelected.type)
            }
        }///end of tabView
        .accentColor(.primary)
    }
    ///dont need to return anything with ViewBuilder
    @ViewBuilder
    func tabView(for tabItemType: TabItemViewModel.TabItemType) -> some View {
        switch tabItemType {
        case .log:
            Text("Log")
        case .challengeList:
//            Text("Challenge List")
            NavigationView {
                ChallengeListView()
            }
        case .settings:
            SettingsView()
        }
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
struct TabItemViewModel: Hashable {
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
