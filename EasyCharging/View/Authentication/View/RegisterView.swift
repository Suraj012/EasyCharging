import SwiftUI

struct RegisterView: View {
    
    //Its same like a shared model which can be used in any view
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var phoneEmail = "surajb@gmail.com"
    @State var confirmPassword = ""
    @State var password = "12345678"
    @State var optionSelected = false
    @State private var selectedType: UserType?
    
    
    @Environment(\.presentationMode) var presentatioMode
    
    var body: some View {
        if !optionSelected {
            VStack {
                VStack {
                    ZStack {
                        HStack {
                            Button(action: {
                                presentatioMode.wrappedValue.dismiss()
                            }) {
                                HStack {
                                    Image(systemName: "chevron.left")
                                        .padding(.bottom, 12)
                                    .foregroundColor(.blue)
                                }
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Image("icn_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 60)
                            .foregroundColor(.blue)
                    }
                }
                
                Text("Select your account type")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom)
                
                
                VStack {
                    Button(action: {
                        if !phoneEmail.isEmpty {
                            self.optionSelected.toggle()
                            self.selectedType = .user
                        }
                    }, label: {
                        Capsule()
                            .frame(width: UIScreen.main.bounds.width*0.8, height: 40, alignment: .center)
                            .foregroundColor(.blue)
                            .overlay(
                            Text("User")
                                .foregroundColor(.white)
                            )
                    })
                    .padding(.bottom, 4)
                    
                    Button(action: {
                        if !phoneEmail.isEmpty {
                            self.optionSelected.toggle()
                            self.selectedType = .owner
                        }
                    }, label: {
                        Capsule()
                            .frame(width: UIScreen.main.bounds.width*0.8, height: 40, alignment: .center)
                            .foregroundColor(.blue)
                            .overlay(
                            Text("Owner")
                                .foregroundColor(.white)
                            )
                    })
                    .padding(.bottom, 4)
                    
                    Button(action: {
                        if !phoneEmail.isEmpty {
                            self.optionSelected.toggle()
                            self.selectedType = .both
                        }
                    }, label: {
                        Capsule()
                            .frame(width: UIScreen.main.bounds.width*0.8, height: 40, alignment: .center)
                            .foregroundColor(.blue)
                            .overlay(
                            Text("Both (User and Owner)")
                                .foregroundColor(.white)
                            )
                    })
                    .padding(.bottom, 4)
                }
                Spacer()
            }
        } else {
            VStack {
                VStack {
                    ZStack {
                        HStack {
                            Button(action: {
                                self.optionSelected.toggle()
                            }) {
                                HStack {
                                    Image(systemName: "chevron.left")
                                        .padding(.bottom, 12)
                                    .foregroundColor(.blue)
                                }
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Image("icn_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 60)
                            .foregroundColor(.blue)
                    }
                }
                
                VStack(alignment: .leading, spacing: 20, content: {
                    CustomTextField(placeholder: "First Name", text: $phoneEmail)
                    CustomTextField(placeholder: "Middle Name", text: $phoneEmail)
                    CustomTextField(placeholder: "Last Name", text: $phoneEmail)
                    CustomTextField(placeholder: "Phone number or email", text: $phoneEmail)
                    SecureTextField(placeholder: "Password", text: $password)
                    SecureTextField(placeholder: "Confirm Password", text: $confirmPassword)
                })
                Button(action: {
                    if !phoneEmail.isEmpty {
                        self.optionSelected.toggle()
                        self.selectedType = .both
                    }
                }, label: {
                    Capsule()
                        .frame(height: 45, alignment: .center)
                        .foregroundColor(.blue)
                        .overlay(
                        Text("Continue")
                            .foregroundColor(.white)
                        )
                })
                .padding(.all, 16)
                Spacer()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
