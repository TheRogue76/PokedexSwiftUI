//
//  CodexScreen.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-19.
//

import SwiftUI

struct CodexScreen: View {
    var body: some View {
        Text("Codex Screen")
            .task {
                do {
                    let data = try await Network.shared.getRandomPokemon()
                    print(data)
                } catch {
                    print(String(describing: error))
                }
            }
    }
}

struct CodexScreen_Previews: PreviewProvider {
    static var previews: some View {
        CodexScreen()
    }
}
