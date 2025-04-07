
import Foundation
import SwiftUICore
import SwiftUI

struct DogDetailView: View {
    @Environment(\.dismiss) var dismiss
    let dog: Dog

    var body: some View {
        VStack(spacing: 20) {
            Text("Breed: \(dog.breed)")
            // Add more info here
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                    Text("Back")
                }
                .foregroundColor(.blue)
            }
        )
    }
}

#Preview {
    DogDetailView(dog: Dog(id:"23",breed:"Lebron Dog"))
}
