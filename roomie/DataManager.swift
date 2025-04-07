//
//  DataManager 2.swift
//  roomie
//
//  Created by Jack Oehling on 4/6/25.
//


//
//  DataManager.swift
//  roomie
//
//  Created by Jack Oehling on 3/30/25.
//

import Foundation
import Firebase

class DataManager: ObservableObject {
    @Published var dogs: [Dog] = []
    
    init() {
        // fetchDogs()
         fetchFakeDogs()
    }
    
    func fetchDogs() {
        dogs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Dogs")
        ref.getDocuments { (querySnapshot, err) in
            guard err == nil else {
                print(err!.localizedDescription)
                return
            }
            if let snapshot = querySnapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let breed = data["breed"] as? String ?? ""
                    let dog = Dog(id:id, breed:breed)
                    self.dogs.append(dog)
                }
            }
        }
    }
    
    func fetchFakeDogs() {
        self.dogs = [Dog(id:"123",breed:"Labrador"),Dog(id:"456",breed:"Poodle"),Dog(id:"789",breed:"Beagle")]
    }
}
