//
//  ChallengeListView.swift
//  BeastModeFitness
//
//  Created by sal562 on 8/8/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import SwiftUI

struct ChallengeListView: View {
    //MARK: - Properties
    @StateObject private var challengeListViewModel = ChallengeListViewModel()
    
    var body: some View {
        Text("Challenge List")
    }
}

struct ChallengeListView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeListView()
    }
}
