//
//  Login.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//

import SwiftUI

struct Login: View {
    
    @State var email: String = ""
    @State var password:String = ""
    @State var seePassword:Bool = false
    @State var isLogging:Bool = false
    @AppStorage("userType") var userType: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack {
                    TextField("Email", text: $email)
                        .padding(.leading, 25)
                    Image(systemName: "person.fill")
                        .foregroundStyle(.gray)
                        .padding(.trailing,25)
                }
                .overlay{
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
                        .frame(width: 370, height: 50)
                        .foregroundStyle(.orange)
                }
                .padding(.vertical,20)
                
                HStack {
                    Group{
                        if seePassword{
                            TextField("Confirm Password", text: $password)
                                .padding(.leading, 20)
                        } else{
                            SecureField("Confirm Password", text: $password)
                                .padding(.leading, 20)
                        }
                    }
                    
                    Button{
                        seePassword.toggle()
                    } label:{
                        Image(systemName: seePassword ? "eye.slash" : "eye")
                            .foregroundStyle(.gray)
                            .padding(.trailing, 20)
                    }
                }
                .overlay{
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
                        .frame(width: 370, height: 50)
                        .foregroundStyle(.orange)
                }
                .padding(.vertical,23)
                
                Button{
                    isLogging.toggle()
                }label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.orange)
                            .frame(width: 330, height: 50)
                        Text("Sign Up")
                            .foregroundStyle(.white).font(.title2)
                            .bold()
                    }
                    
                }
                .padding(.top, 30)
                .navigationDestination(isPresented: $isLogging){
                    HomePage()
                }
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundStyle(.gray)
                        .opacity(0.5)
                    NavigationLink("Sign Up"){
                        Signup()
                    }
                    .foregroundStyle(.orange)
                }
                .padding(.top)
            }
            .navigationTitle("Login")
        }
        
    }
}

#Preview {
    Login()
}
