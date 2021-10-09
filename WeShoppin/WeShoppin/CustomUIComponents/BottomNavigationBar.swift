//
//  BottomNavigationBar.swift
//  WeShoppin
//
//  Created by Dhiva Krishna on 9/26/21.
//

import SwiftUI

struct BottomNavigationBar: View {
    var body: some View {
        HStack {
            Image(systemName: "house")
            Spacer()
            Image(systemName: "magnifyingglass")
            Spacer()
            NavigationLink(
                destination: LiveStreamView(),
                label: {
                    Image(systemName: "video")
                        .foregroundColor(.black)
                })
            Spacer()
            NavigationLink(
                destination: ProfilePageView(viewRouter: ProfileViewRouter()),
                label: {
                    Image(systemName: "person")
                        .foregroundColor(.black)
                })
            Spacer()
            Image(systemName: "cart")
            
        }
        .font(.system(size: 30))
        .frame(maxWidth: .infinity)
    }
}

struct BottomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationBar()
    }
}
