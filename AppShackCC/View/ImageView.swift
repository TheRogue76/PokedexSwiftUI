//
//  ImageView.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-20.
//

import SwiftUI

struct ImageView: View {
    var pokeUrlString: String?
    
    var placeholder: some View {
        Rectangle()
    }
    
    var body: some View {
        if let pokeUrlString, let imageUrl = URL(string: pokeUrlString) {
            AsyncImage(url: imageUrl) { phase in
                switch phase {
                case .empty:
                    Rectangle()
                case .failure(_):
                    Rectangle()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                @unknown default:
                    Rectangle()
                }
            }
        } else {
            Rectangle()
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
