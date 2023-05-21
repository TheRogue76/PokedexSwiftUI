//
//  CodexNavigationStack.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-21.
//

import SwiftUI

struct CodexNavigationStack: View {
    var body: some View {
        NavigationStack {
            CodexScreen()
        }
    }
}

struct CodexNavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        CodexNavigationStack()
    }
}
