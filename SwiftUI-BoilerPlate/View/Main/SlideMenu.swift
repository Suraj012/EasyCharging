//
//  SlideMenu.swift
//  SwiftUI-BoilerPlate
//
//  Created by Suraj Bhandari on 22/03/2023.
//

import SwiftUI

struct SlideMenu: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
                
    var body: some View {
        let _ = Self._printChanges()
        GeometryReader { proxy in
            VStack {
                HStack(spacing: 0, content: {
                    VStack(alignment: .leading, content: {
                        Text("Side Menu")
                    })
                    .padding(.horizontal, 20)
                    .frame(width: UIScreen.main.bounds.width - 90, height: UIScreen.main.bounds.height)
                    .background(.white)
                    .ignoresSafeArea(.all, edges: .vertical)
                    
                })
            }
        }
    }
}

struct SlideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenu()
    }
}
