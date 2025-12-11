//
//  Signup.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//

import SwiftUI

struct Signup: View {
    
    @State var userName: String = ""
    @State var email: String = ""
    @State var password:String = ""
    @State var confirmPassword = ""
    @State var isSignup: Bool = false
    @State var seeConfirmPassword: Bool = false
    @State var seePassword:Bool = false
    @AppStorage("userType") var userType:String = "Student"
    let userTypes = ["Student", "Facilitator", "Donor", "Hiring Company", "Project Manager", "Manager"]
    
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack(spacing: 30){
                    HStack {
                        TextField("Username", text: $userName)
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
                        Text("User Type")
                            .padding(.leading, 25)
                            .opacity(0.3)
                        Spacer()
                        Picker("User Type", selection: $userType){
                            ForEach(userTypes, id: \.self) { userType in
                                Text(userType)
                            }
                        }
                        .pickerStyle(.menu)
                        .padding(.trailing, 15)
                    }
                    .overlay{
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
                            .frame(width: 370, height: 50)
                            .foregroundStyle(.orange)
                    }
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
                            Image(systemName: seeConfirmPassword ? "eye.slash" : "eye")
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
                    
                    HStack {
                        Group{
                            if seeConfirmPassword{
                                TextField("Confirm Password", text: $confirmPassword)
                                    .padding(.leading, 5)
                            } else{
                                SecureField("Confirm Password", text: $confirmPassword)
                                    .padding(.leading, 5)
                            }
                        }
                        
                        Button{
                            seeConfirmPassword.toggle()
                        } label:{
                            Image(systemName: seeConfirmPassword ? "eye.slash" : "eye")
                                .foregroundStyle(.gray)
                                .padding(.trailing, 20)
                        }
                    }
                    .padding(.leading)
                    .padding(.vertical, 5)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
                            .frame(width: 370, height: 50)
                            
                            .foregroundStyle(.orange)
                        
                    }
                    
                    Button{
                        isSignup.toggle()
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
                    .navigationDestination(isPresented: $isSignup){
                        HomePage()
                    }
                    
                    HStack {
                        Text("Already have an account?")
                            .foregroundStyle(.gray)
                            .opacity(0.5)
                        NavigationLink("Sign In"){
                            Login()
                        }
                        .foregroundStyle(.orange)
                    }
                }
            }
            .navigationTitle("Sign Up")
        }
    }
}

#Preview {
    Signup()
}
