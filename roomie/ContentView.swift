//
//  ContentView 2.swift
//  roomie
//
//  Created by Jack Oehling on 4/6/25.
//


//
//  ContentView.swift
//  roomie
//
//  Created by Jack Oehling on 3/30/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    var body: some View {
        ListView()
    }
    
    var content: some View {
        ZStack{
            VStack{
                Text("Welcome").font(.system(size:40, weight:.bold))
                
                TextField("Email", text: $email)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email").foregroundColor(.secondary)
                    }
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Password").foregroundColor(.secondary)
                    }
                
                Button {
                    register()
                } label: {
                    Text("Sign Up")
                }
                
                Button {
                    login()
                } label: {
                    Text("Already have an account? Login")
                }
                
            }.onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }.ignoresSafeArea()
    }
        func register() {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error != nil {
                    print(error!.localizedDescription)
                }
        }
    }
    
    
        func login() {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if error != nil {
                    print(error!.localizedDescription)
                }
        }
    }
    
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
