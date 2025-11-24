//
//  ContentView.swift
//  LoginAppMVVM
//
//  Created by Nagesh Allur on 11/23/25.
//

import SwiftUI
import Foundation
internal import Combine

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        if vm.authenticated {
            VStack(spacing: 20) {
                Text("Welcome back my name is dhyan, \(vm.username)!")
                    .font(.title2)
                
                Button("Logout",action:vm.logOut).tint(.red).buttonStyle(.bordered)
            }
        } else {
            ZStack {
                Image("Dhyan1").resizable().cornerRadius(20).padding().ignoresSafeArea()
                VStack(alignment: .leading,spacing:20) {
                    Spacer()
                    Text("Login").foregroundColor(.white).font(.system(size:50,weight: .medium,design:.rounded)).padding(20).padding(.horizontal)
                    TextField("username",text: $vm.username).textFieldStyle(.roundedBorder).textInputAutocapitalization(.never).padding(10).padding(.horizontal)
                    SecureField("password",text:$vm.password).textFieldStyle(.roundedBorder).textInputAutocapitalization(.never).padding(10).padding(.horizontal)
                    
                    HStack{
                        
                        Spacer()
                        
                        Button("Forgot password?",action:vm.logPressed).tint(.red.opacity(3.9)).padding(10).padding(.horizontal)
                        Spacer()
                        Button("LogIn",action:vm.autheticate).buttonStyle(.bordered).background(Color(.white)).foregroundColor(.blue)
                        Spacer()
                        
                        }
                    
                    Spacer()
                    }
                
                }
            }
            
        }
    }


#Preview {
    ContentView()
}
