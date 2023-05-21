//
//  ContentView.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeNavigationStack()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            CodexNavigationStack()
                .tabItem {
                    Label("Codex", systemImage: "books.vertical.fill")
                }
            ProfileNavigationStack()
                .tabItem {
                    Label("My Profile", systemImage: "person.crop.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
