//
//  ContentView.swift
//  Tasker
//
//  Created by CEDAM18 on 25/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var value = ""
    @State var usuario: String = ""
    @State var contraseña: String = ""
    var carreras: [String]  = ["MAC", "Derecho", "Arquitectura", "Actuaria"]
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                VStack{
                    Image("chambeame")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 96)
                    
                    Text("Ingresa tu usuario")
                        .foregroundColor(Color.white)
                        .padding(.top, 70)
                    TextField("Usuario", text: $usuario)
                        .foregroundColor(Color.white)
                        .accentColor(Color.white)
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(.headline)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(6)
                        .padding(.horizontal, 60)
                        .padding(.top, 10)
                        .padding(.vertical, 4)
                    Text("Selecciona tu carrera")
                        .foregroundColor(Color.white)
                        .padding(.top, 30)
                    HStack{
                             TextField("Selecciona tu carrera", text: $value)
                           
                                 .textFieldStyle(.roundedBorder)
                                 .background(Color.gray.opacity(0.3))
                  
                             Menu {
                                 ForEach(carreras, id: \.self){ item in
                                     Button(item) {
                                         self.value = item
                                    
                                     }
                                 }
                             } label: {
                                 VStack(spacing: 5){
                                     Image(systemName: "chevron.down")
                                         .font(.title3)
                                         .fontWeight(.bold)
                                         
                                 }
                             }
                  
                         }
                    Text("Ingresa tu contraseña")
                        .foregroundColor(Color.white)
                        .padding(.top, 20)
                    SecureField("Password", text: $contraseña)
                        .foregroundColor(Color.white)
                        .accentColor(Color.white)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding(8)
                        .font(.headline)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(6)
                        .padding(.horizontal, 60)
                        .padding(.vertical, 10)
                    Spacer()
                    
                    
                    Button(action: {
                        print("Hola")
                    }){
                        NavigationLink(destination: segunda_vista()){
                            Text("Ingresar")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                        }
                    }
                }
        
            }
        }
    }
    
}
#Preview {
    ContentView()
    
}


struct segunda: View{
    var body: some View{
        ZStack{
            Color.green.edgesIgnoringSafeArea(.all)
            VStack{
                Image("chambeame")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 96)
            }
        }
        
    }
}

struct segunda_vista : View{
    @State private var boton_presionado = false
    var body: some View{
        NavigationStack{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                VStack{
                    
                    
                    /*Button(action: {
                        print("Hola")
                    }){
                        NavigationLink(destination: segunda()){
                            Image("piñata_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 290)

                            }
                    }
                    
                    Text("Rompe la piñata!!!")
                        .foregroundColor(Color.white)
                        .padding(.top, 30)
                        .font(.title)
                     */
                    Button(action: {
                        self.boton_presionado = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    self.boton_presionado = false
                                }
                            }) {
                                ZStack {
                                    ButtonAnimation(isExpanded: $boton_presionado, color: .black)
                                    Rectangle()
                                        .frame(width: 120, height: 60)
                                        .foregroundColor(.black)
                                    Image("piñata_logo")
                                        .foregroundColor(.white)
                                }
                            }
                    Text("Rompe La piñata!!!")
                        .foregroundColor(Color.white)
                        .font(.title)
                    
                    
                }
            }
        }
    }
}

struct ButtonAnimation: View {
    @Binding var isExpanded: Bool
    let color: Color

    var body: some View {
        Rectangle()
            .frame(width: 120, height: 60)
            .foregroundColor(color)
            .opacity(isExpanded ? 0 : 0.5)
            .scaleEffect(isExpanded ? 2.5 : 1)
            .animation(isExpanded ? .easeOut(duration: 0.5) : nil)
    }
}







