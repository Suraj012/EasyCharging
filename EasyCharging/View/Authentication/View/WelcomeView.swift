//
//  WelcomeView.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/02/2023.
//

import SwiftUI

enum UserType {
    case user
    case owner
    case both
}


struct WelcomeView: View {
    
    //Its same like a shared model which can be used in any view
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var selectedType: UserType?
    
    @Environment(\.presentationMode) var presentatioMode
    
    var body: some View {
        NavigationView {
            VStack {
                Image("icn_car")
                    .resizable()
                //                    .renderingMode(.template)
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 250)
                
                Image("icn_logo")
                    .resizable()
                //                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(height:80, alignment: .center)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 48)
                    .padding(.top, 16)
                    .padding(.bottom, 16)
                
                Text("Select Login Type:")
                    .font(.title)
                
                
                VStack {
                    HStack(spacing: 24) {
                        CardView(userType: .user, selectedType: $selectedType)
                        CardView(userType: .owner, selectedType: $selectedType)
                    }
                    
                    NavigationLink(destination: LoginView().navigationBarHidden(true), label: {
                        Capsule()
                            .frame(height: 45, alignment: .center)
                            .foregroundColor(.blue)
                            .overlay(
                                Text("Continue")
                                    .foregroundColor(.white)
                            )
                    })
                    .padding(.top, 24)
                    
                    Spacer()
                    
                    NavigationLink(destination: RegisterView().navigationBarHidden(true), label: {
                        Text("Don't have account? Click here to create your account")
                            .foregroundColor(.gray)
                        
                    })
                    .padding(.top, 4)
                    
                }
                .padding(.all, 16)
            }
            //            .edgesIgnoringSafeArea(.top)
        }
    }
    
}

struct CardView: View {
    let userType: UserType
    @Binding var selectedType: UserType?

    var body: some View {
        VStack {
            Button(action: {
                self.selectedType = userType
            }) {
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: userType == selectedType ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(userType == selectedType ? .blue : .gray)
                    }
                    let imageName = userType == .user ? "icn_user" : "icn_owner"
                    Image(imageName) // Sample image, replace it with your own
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)
                    
                    Text(userType == .user ? "User" : "Owner")
                        .foregroundColor(.black)
                        .padding(.top, 4)

           
                }
                .frame(width: UIScreen.main.bounds.width / 4)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 1)
            }
        }
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
