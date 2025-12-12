//
//  StartupPage.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//

import SwiftUI

struct StartupPage: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Logo")
               
                    .resizable()
                   .scaledToFit()
                   .aspectRatio(contentMode: .fill)
                   .frame(width:500, height: 200)
                   .blur(radius: 3)
                   .opacity(0.6)
                  
                
                VStack{
                    Image("MCRI")
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .clipShape(Circle())
                        .opacity(0.9)
                        
                    
                   // Spacer()
                    Image("Matter")
                        .shadow(radius: 5)
                        .offset(x: 3, y: -2)
                   
                        
                        
               //   Spacer()
                        .offset(x: 00, y: -160)
                }
                
                VStack(spacing: 25){
                    NavigationLink(destination: Signup()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 9)
                                .foregroundStyle(.orange)
                                .frame(width: 330, height: 50)
                            Text("Sign Up")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.white)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            
                            
                            
                            
                                .padding(9)
                        }
                    }
                    .offset(x: -1, y: 250)
                    
                    NavigationLink(destination: Login()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 9).stroke(lineWidth: 1)
                                .foregroundStyle(.white)
                                .frame(width: 330, height: 50)
                            Text("Login")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.orange)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            
                            
                            
                            
                                .padding(9)
                        }
                    }
                    .offset(x: -1, y: 250)
                    
                    Text("Select option to continue")
                        .font(.title3)
                        .foregroundStyle(.black)
                        .offset(y: 240)
                        .opacity(0.8)
                        .bold()
                }
                
            }
            
            }
        }
        
    }


#Preview {
    StartupPage()
}
