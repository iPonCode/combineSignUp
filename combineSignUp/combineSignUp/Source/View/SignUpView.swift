//  SignUpView.swift
//  combineSignUp
//
//  Created by Simón Aparicio on 28/03/2020.
//  Copyright © 2020 iPon.es. All rights reserved.
//

import SwiftUI

struct SignUpView: View {

    @State private var username = ""
    @State private var password = ""
    @State private var passwordAgain = ""

    var body: some View {
        VStack{
            HStack {
                Image("LaunchScreen").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80).cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.gray)
                            .opacity(0.25)
                )
                Text("Crea tu cuenta")
                    .font(.system(.largeTitle, design: .rounded)).bold()
            }
            .padding(.top)
            
            ScrollView {
                TextFieldView(fieldName: "Nombre de Usuario", fieldValue: $username)
                    .padding(.top)
                HStack{
                    TextFieldView(fieldName: "Contraseña", fieldValue: $password, isSecure: true)
                    TextFieldView(fieldName: "Confirmar", fieldValue: $passwordAgain, isSecure: true)
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
                
                HStack{
                    Text("¿Tienes una cuenta?")
                        .font(.system(.body, design: .rounded))
                        .bold()
                    Button(action: {
                        //TODO: to login
                    }){
                        Text("Entra ahora")
                            .font(.system(.headline))
                            .foregroundColor(.purple)
                    }
                }.padding()
            }.padding()
        }
    }
}

struct TextFieldView: View {
    
    var fieldName = ""
    @Binding var fieldValue: String
    var isSecure = false
    
    var body: some View{
        VStack{
            if isSecure{
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .padding(.horizontal)
            }else{
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


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
