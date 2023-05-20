//
//  HomeScreen.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-19.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            Text("Home Screen")
            Text(viewModel.randomPokemon?.name ?? "None loaded")
        }
        .onAppear {
            viewModel.fetchRandomPokemon()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
