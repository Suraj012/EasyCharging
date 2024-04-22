//
//  LoginView.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/02/2023.
//

import SwiftUI

struct LoginView: View {
    
    //Its same like a shared model which can be used in any view
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var phoneEmail = ""
    @State var password = ""
    @State var emailDone = false
    
    @Environment(\.presentationMode) var presentatioMode
    
    var body: some View {
            VStack {
                VStack {
                    ZStack {
                        VStack {
                            HStack {
                                Button(action: {
                                    presentatioMode.wrappedValue.dismiss()
                                }) {
                                    HStack {
                                        Image(systemName: "chevron.left")
                                            .foregroundColor(.blue)
                                    }
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            Image("icn_car")
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 250)
                                .padding(.top, 4)
                        }
                        
                    }
                }
                                
                Image("icn_logo")
                    .resizable()
//                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(height:80, alignment: .center)
                    .foregroundColor(.blue)
                    .padding(.top, 0)
                
                CustomTextField(placeholder: "Email", text: $phoneEmail)
                
                SecureTextField(placeholder: "Password", text: $password)
                    .padding(.top, 12)
                                
                VStack {
                    Button(action: {
                        if !phoneEmail.isEmpty {
                            self.emailDone.toggle()
                        }
                    }, label: {
                        Capsule()
                            .frame(height: 45, alignment: .center)
                            .foregroundColor(.blue)
                            .overlay(
                            Text("Login")
                                .foregroundColor(.white)
                            )
                    })
                    .padding(.bottom, 4)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Don't have account? Click here to create your account")
                            .foregroundColor(.gray)
                            
                    })
                    .padding(.top, 4)
                }.padding(.all, 16)
                Spacer()
            }
//            .edgesIgnoringSafeArea(.top)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
