//  SignUpViewModel.swift
//  combineSignUp
//
//  Created by Simón Aparicio on 29/03/2020.
//  Copyright © 2020 iPon.es. All rights reserved.
//

import Foundation

class SignUpViewModel: ObservableObject{ // Needs to conform ObservableObject to use @Published
    
    // Form user entries
    @Published var username = ""
    @Published var password = ""
    @Published var passwordAgain = ""
    
    // Form validation
    @Published var isValidUsername = false
    @Published var isValidPasswordLength = false
    @Published var isValidPasswordCapitalLetter = false
    @Published var areMatchingPasswords = false
    
    private let maxUserName: Int = 6
    
    init() {
        // TODO: validation logic
        // All SwiftUI controls can be subscribers, so a Text can listen to changes and updates its style itself
        
        // When ViewModel starts, must listen the username var and recieve events on main (because are visual changes)
        // and each time a change are received will be transformed (with .map) to a boolean value thats indicates
        // if is valid or not. Finally this transformation must be assiged to its corresponding bool var on its own class
        
        $username
            .receive(on: RunLoop.main)                      // the suscriber receive changes
            .map{ username in                               // make the necessary transformations
                return username.count >= self.maxUserName   // and return the result value on a data type expected
        }
        .assign(to: \.isValidUsername, on: self)            // assignit to the corresponding var that will be published
        // TODO: store
        
    }
}
