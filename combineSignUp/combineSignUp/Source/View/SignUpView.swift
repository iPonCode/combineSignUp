//  SignUpView.swift
//  combineSignUp
//
//  Created by Simón Aparicio on 28/03/2020.
//  Copyright © 2020 iPon.es. All rights reserved.
//

import SwiftUI

struct SignUpView: View {

    @ObservedObject private var viewModel = SignUpViewModel()

    var body: some View {
        VStack {
            HStack {
                Image("LaunchScreen").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 65, height: 65).cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.gray)
                            .opacity(0.2)
                )
                Text("Crea tu cuenta")
                    .font(.system(.largeTitle, design: .rounded)).bold()
            }
            .padding(.top)
            
            ScrollView {
                TextFieldView(fieldName: "Nombre de Usuario", fieldValue: $viewModel.username)
                    //.padding(.top)
                ValidationView(
                    formText: "Al menos 6 caracteres",
                    conditionChecked: $viewModel.isValidUsername)

                HStack {
                    VStack{
                        TextFieldView(fieldName: "Contraseña", fieldValue: $viewModel.password, isSecure: true)
                        ValidationView(
                            formText: "8 caracteres",
                            conditionChecked: $viewModel.isValidPasswordLength)
                        ValidationView(
                            formText: "1 mayúscula",
                            conditionChecked: $viewModel.isValidPasswordUpperCaseLetter)
                        ValidationView(
                            formText: "1 minúscula",
                            conditionChecked: $viewModel.isValidPasswordLowerCaseLetter)
                        Spacer()
                    }
                    VStack {
                        TextFieldView(fieldName: "Repetir", fieldValue: $viewModel.passwordAgain, isSecure: true)
                        ValidationView(
                            formText: "Son distintos",
                            conditionChecked: $viewModel.areMatchingPasswords)
                        Spacer()
                    }
                }
                .padding(.bottom)

                Button(action: {
                    //TODO: next step
                }){
                    Text("Registrarme")
                        .font(.system(.largeTitle, design: .rounded)).bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(LinearGradient(
                            gradient: Gradient(colors: [.blue, .purple]),
                            startPoint: .top, endPoint: .bottom))
                        .cornerRadius(8)
                }
                
                HStack {
                    Text("¿Tienes una cuenta?")
                        .font(.system(.body, design: .rounded)).bold()
                        .foregroundColor(.secondary)
                    Button(action: {
                        //TODO: to login
                    }){
                        Text("Entra ahora")
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.purple)
                    }
                }.padding()
            }.padding(.horizontal)
            Spacer()
        }
    }
}

struct TextFieldView: View {
    
    var fieldName = ""
    @Binding var fieldValue: String
    var isSecure = false
    
    var body: some View{
        VStack{
            if isSecure {
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .padding(.horizontal)
            } else {
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .padding(.horizontal)
            }
            Divider()
                .frame(height: 1)
                .background(Color.secondary)
                .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

struct ValidationView: View {
    
    var formText = ""
    @Binding var conditionChecked: Bool

    var body: some View {
        HStack{
            Image(systemName: conditionChecked ? "checkmark.circle" : "xmark.circle")
                .foregroundColor(conditionChecked ? .blue : .pink)
            Text(formText)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.secondary)
                .strikethrough(conditionChecked)
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
