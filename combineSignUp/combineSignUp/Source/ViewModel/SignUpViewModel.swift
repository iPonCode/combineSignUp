//  SignUpViewModel.swift
//  combineSignUp
//
//  Created by Simón Aparicio on 29/03/2020.
//  Copyright © 2020 iPon.es. All rights reserved.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject{ // Needs to conform ObservableObject to use @Published
    
    // Form user entries
    @Published var username = ""
    @Published var password = ""
    @Published var passwordAgain = ""
    
    // Form validation
    @Published var isValidUsername = false
    @Published var isValidPasswordLength = false
    @Published var isValidPasswordUpperCaseLetter = false
    @Published var isValidPasswordLowerCaseLetter = false
    @Published var areMatchingPasswords = false
    
    private var cancellableObjects: Set<AnyCancellable> = []

    private let minUsername: Int = 6
    private let minPassword: Int = 8

    init() {
        // TODO: validation logic
        // All SwiftUI controls can be subscribers, so a Text can listen to changes and updates its style itself
        
        // When ViewModel starts, must listen the username var and recieve events on main (because are visual changes)
        // and each time a change are received will be transformed (with .map) to a boolean value thats indicates
        // if is valid or not. Finally this transformation must be assiged to its corresponding bool var on its own class
        
        $username
            .receive(on: RunLoop.main)                    // the suscriber receive changes
            .map{ username in                             // make the necessary transformations
                return username.count >= self.minUsername // and return the result value on a data type expected
        }
        .assign(to: \.isValidUsername, on: self)          // assign it to the corresponding var that will be published
        .store(in: &cancellableObjects)

        // Password minimum lenght
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                return password.count >= self.minPassword
        }
        .assign(to: \.isValidPasswordLength, on: self)
        .store(in: &cancellableObjects)

        // Password Upper case
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                let regExPattern = "[A-Z]" // RegEx with Uppercased char
                if let _ = password.range(of: regExPattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
        }
        .assign(to: \.isValidPasswordUpperCaseLetter, on: self)
        .store(in: &cancellableObjects)

        // Password Upper case
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                let regExPattern = "[a-z]" // RegEx with Lowercased char
                if let _ = password.range(of: regExPattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
        }
        .assign(to: \.isValidPasswordLowerCaseLetter, on: self)
        .store(in: &cancellableObjects)

        // Combine the two password published vars
        Publishers.CombineLatest($password, $passwordAgain)
            .receive(on: RunLoop.main)
            .map{ (pass, passAgain) in
                return !pass.isEmpty && pass == passAgain //&& !passAgain.isEmpty
        }
        .assign(to: \.areMatchingPasswords, on: self)
        .store(in: &cancellableObjects)
    }

}
