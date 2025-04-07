//
//  ListView.swift
//  roomie
//
//  Created by Jack Oehling on 3/30/25.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    
    
    var body: some View {
        NavigationStack {
            List(dataManager.dogs, id: \.id) { dog in
                CardView(dog: dog)        .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 7)
                    .listRowBackground(Color.clear)
                    .padding(.vertical, 5)
            }
            .padding(.horizontal, 15)
            .listStyle(.plain)
        }
    }
}

#Preview {
    ListView().environmentObject(DataManager())
}
