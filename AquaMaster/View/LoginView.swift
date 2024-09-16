//
//  LoginView.swift
//  AquaMaster
//
//  Created by Ali Agha Jafari on 16/9/2024.
//

import SwiftUI
import Lottie

struct LoginView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel

    var body: some View {
        ZStack {

            VStack {
                    Text("AquaMaster")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("primaryColor"))
                        .padding()
                    // Lottie Animation
                    LottieView(name: Constants.Animation, loopMode: .loop, animationSpeed: 1)
//                        .frame(width: 0.3, height: 2)
                        .scaleEffect(0.3)
                        .frame(width: 20, height: 150)
                        .scaledToFit()
                        .padding(.vertical, 60)
                    // Username Field
                VStack (spacing: 20){
                    TextField("Username", text: $loginViewModel.username)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                        .shadow(radius: 1)

                    // Password Field
                    SecureField("Password", text: $loginViewModel.password)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                        .shadow(radius: 1)

                    // Error Message
                    if !loginViewModel.errorMessage.isEmpty {
                        Text(loginViewModel.errorMessage)
                            .foregroundColor(.red)
                            .padding(.horizontal, 30)
                    }

                    // Login Button
                    Button(action: {
                        loginViewModel.login()
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("primaryColor"))
                            .cornerRadius(10)
                            .padding(.horizontal, 30)
                    }

                    // Sign Up Button
                    Button(action: {
                        loginViewModel.signUp()
                    }) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(Color("primaryColor"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.clear)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("primaryColor"), lineWidth: 1)
                                    .padding(.horizontal, 30)
                                   
                            )
                    }

                }
                   Spacer()
                }

            }
        }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewModel())
}
