//
//  LoginView.swift
//  WeShoppin
//
//  Created by Dhiva Krishna on 9/26/21.
//

import SwiftUI

struct LoginView: View {
    //This is used to prevent the navbar from overlaying onto all the child views
    @State private var navBarIsHidden = true
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showHomeScreen: Bool = false
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    

    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .topLeading, endPoint: .bottomTrailing);
                VStack {
                    Text("Welcome Back!")
                        .font(.custom("Zapfino", size: 30))
                    Spacer()
                        .frame(height: 200)
                    TextField("Email", text: $email)
                        .font(Font.headline.weight(.semibold))
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    Spacer()
                        .frame(height: 10)
                    SecureField("Password", text: $password)
                        .font(Font.headline.weight(.semibold))
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    Spacer()
                        .frame(height: 20)
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else { return }
                        DispatchQueue.main.async {
                            if (authViewModel.signIn(email: email, password: password)) {
                                showHomeScreen = true
                            }
                        }
                    }) {
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
                    }
                    NavigationLink(destination: RootView(navbarViewRouter: NavBarViewRouter()), isActive: $showHomeScreen) {}
                    Spacer()
                        .frame(height:200)
                    NavigationLink(
                        destination: CreateAccountView(),
                    label: {
                        Text("Don't have an account? Click here")
                            .fontWeight(.bold)
                            .font(.body)
                            .padding()
                            
                        
                    })
                    
                }
                .textFieldStyle(OvalTextFieldStyle())
                .padding()
            }
            
            .ignoresSafeArea()
        }
    }
}


struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
