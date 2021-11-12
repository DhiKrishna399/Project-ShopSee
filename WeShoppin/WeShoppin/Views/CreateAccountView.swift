//
//  CreateAccountView.swift
//  WeShoppin
//
//  Created by Dhiva Krishna on 9/26/21.
//

import SwiftUI

struct CreateAccountView: View {
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordVerify: String = ""
    @State private var phonenumber: String = ""
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
      
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .topLeading, endPoint: .bottomTrailing);
              
                VStack (alignment: .center, spacing: 15 ){
                    Text("Create an Account")
                     .font(.largeTitle)
                    TextField("Username", text: $username)
                        .font(Font.headline.weight(.semibold))
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    TextField("Email", text: $email)
                        .font(Font.headline.weight(.semibold))
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    TextField("Password", text: $password)
                        .font(Font.headline.weight(.semibold))
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    TextField("Re-Enter Password", text: $passwordVerify)
                        .font(Font.headline.weight(.semibold))
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    TextField("Phone Number", text: $phonenumber)
                        .font(Font.headline.weight(.semibold))
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else { return }
                        if passwordVerify == password {
                            authViewModel.createAccount(email: email, password: password)
                        }
                    }) {
                    NavigationLink(
                        destination: RootView(navbarViewRouter: NavBarViewRouter()),
                        label: {
                            Text("Login")
                                .fontWeight(.bold)
                                .font(.body)
                                .padding()
                                .frame(width: 200,alignment: .center)
                                .background(Color.white)
                                .cornerRadius(40)
                                .foregroundColor(.orange)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.orange, lineWidth: 5)
                                        .frame(width: 200,alignment: .center)
                                )
                        })
                    }
                }
                .textFieldStyle(OvalTextFieldStyle())
                .padding(.all)
      
            }
            .ignoresSafeArea()
    }
    
  
}




struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
