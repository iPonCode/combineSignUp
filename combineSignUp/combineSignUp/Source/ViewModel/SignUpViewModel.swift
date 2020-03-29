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
    
    init() {
        // TODO: validation logic
    }
}
