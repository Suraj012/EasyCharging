//
//  Home.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 20/01/2023.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var selectedIndex = 0
    @State var showCreateTweet = false
    @State var text = ""
    var body: some View {
        VStack{
            ZStack{
                TabView {
                    Text("Home")
                        .onTapGesture {
                            selectedIndex = 0
                        }
                        .tabItem {
                            if selectedIndex == 0 {
                                Image("icn_home")
                                    .renderingMode(.template)
                                    .foregroundColor(Color.blue)
                            } else {
                                Image("icn_home")
                            }
                        }
                    Text("User")
                        .onTapGesture {
                            selectedIndex = 1
                        }
                        .tabItem {
                            if selectedIndex != 1 {
                                Image("icn_user")
                                    .renderingMode(.template)
                                    .foregroundColor(Color.blue)
                            } else {
                                Image("icn_user")
                            }
                        }
                    Text("Notification")
                        .onTapGesture {
                            selectedIndex = 2
                        }
                        .tabItem {
                            if selectedIndex != 2 {
                                Image("icn_notification")
                                    .renderingMode(.template)
                                    .foregroundColor(Color.blue)
                            } else {
                                Image("icn_notification")
                            }
                        }
                    Text("Message")
                        .onTapGesture {
                            selectedIndex = 3
                        }
                        .tabItem {
                            if selectedIndex != 3 {
                                Image("icn_message")
                                    .renderingMode(.template)
                                    .foregroundColor(Color.blue)
                            } else {
                                Image("icn_message")
                            }
                        }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            showCreateTweet.toggle()
                        }, label: {
                            Image("icn_create_tweet")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 20, height: 20).padding()
                                .foregroundColor(.white)
                                .background(.blue)
                                .clipShape(Circle())
                                .padding()
                        })
                    }
                    .padding(.bottom, 65)
                }
                .sheet(isPresented: $showCreateTweet, content: {
                    Text("Test")
                })
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
