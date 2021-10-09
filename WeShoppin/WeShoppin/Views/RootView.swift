//
//  RootView.swift
//  WeShoppin
//
//  Created by Dhiva Krishna on 10/4/21.
//

import Foundation
import SwiftUI



struct RootView: View {
    
    @StateObject var navbarViewRouter: NavBarViewRouter
    
    var body: some View {
        VStack{
            ZStack{
                switch navbarViewRouter.currentView {
                case .Home:
                    HomeScreenView()
                case .LiveStream:
                    LiveStreamView()
                case .Profile:
                    ProfilePageView(viewRouter: ProfileViewRouter())
                }
            }
            Spacer()
            HStack {
                Button(action: {navbarViewRouter.currentView = .Home}) {
                    Image(systemName: "house")
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                }
                Spacer()
                Button(action: {navbarViewRouter.currentView = .LiveStream}) {
                    Image(systemName: "video")
                }
                Spacer()
                Button(action: {navbarViewRouter.currentView = .Profile}) {
                    Image(systemName: "person")
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "cart")
                }
            }
            .font(.system(size: 30))
            .frame(maxWidth: .infinity)
        }
        .navigationBarHidden(true)
        
       
    }
    
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}


