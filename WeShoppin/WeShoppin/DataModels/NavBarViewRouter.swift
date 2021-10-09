//
//  NavBarViewRouter.swift
//  WeShoppin
//
//  Created by Dhiva Krishna on 10/4/21.
//

import Foundation


class NavBarViewRouter: ObservableObject {
    
    @Published var currentView: CurrentPage = .Home
    
}


enum CurrentPage{
    case Home
    case LiveStream
    case Profile
//    case Cart
    
}
