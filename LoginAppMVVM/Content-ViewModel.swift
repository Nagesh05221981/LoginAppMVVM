//
//  Content-ViewModel.swift
//  LoginAppMVVM
//
//  Created by Nagesh Allur on 11/23/25.
//

import SwiftUI
import Foundation
internal import Combine

extension ContentView {
    
    class ViewModel:ObservableObject {
        
        @AppStorage("AUTH_KEY") var authenticated = false{
            willSet { objectWillChange.send() }
        }
        @AppStorage("USER_KEY") var username = ""
        @Published var password = ""
        @Published var invalid: Bool = false
        
        private var sampleUser = "username"
        private var samplPassword = "password"
        init() {
            print ("logged on: \(authenticated) ")
            print ("current user : \(username) ")
            
            
        }
        func toggleAuthentication(){
            self.password = ""
            withAnimation{
                authenticated.toggle()
            }
        }
        
        func autheticate (){
            guard self.username.lowercased() == sampleUser else{
                self.invalid = true
                return
            }
            guard self.password.lowercased() == password else{
                self.invalid = true
                return
            }
            toggleAuthentication()
            }
        func logOut () {
            toggleAuthentication()
        }
        func logPressed() {
            print("Button Pressed")
        }
    }
}
