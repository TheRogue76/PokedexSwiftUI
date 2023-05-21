//
//  ProfileNavigationStack.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-21.
//

import SwiftUI

struct ProfileNavigationStack: View {
    var body: some View {
        NavigationStack {
            ProfileScreen()
        }
    }
}

struct ProfileNavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        ProfileNavigationStack()
    }
}
