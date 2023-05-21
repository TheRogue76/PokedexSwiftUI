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
            NavigationStack {
                HomeScreen()
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            NavigationStack {
                CodexScreen()
            }
            .tabItem {
                Label("Codex", systemImage: "books.vertical.fill")
            }
            ProfileScreen()
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
