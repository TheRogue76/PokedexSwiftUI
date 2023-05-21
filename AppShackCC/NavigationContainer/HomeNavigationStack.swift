//
//  HomeNavigationStack.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-21.
//

import SwiftUI

struct HomeNavigationStack: View {
    var body: some View {
        NavigationStack {
            HomeScreen()
        }
    }
}

struct HomeNavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationStack()
    }
}
