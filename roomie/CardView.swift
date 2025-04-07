//
//  CardView.swift
//  roomie
//
//  Created by Jack Oehling on 3/31/25.
//

import Foundation
import SwiftUI


struct CardView: View {
    let dog: Dog


    var body: some View {
        NavigationLink(destination: DogDetailView(dog: dog)) {
            VStack(alignment: .leading) {
                Text(dog.breed)
                    .font(.headline)
                    .accessibilityAddTraits(.isHeader)
                Spacer()
                HStack {
                    Label("\(dog.breed)", systemImage: "person.3")
                        .accessibilityLabel("\(dog.breed) attendees")
                }
                .font(.caption)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .padding(5)
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}


