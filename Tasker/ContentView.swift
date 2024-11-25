//
//  ContentView.swift
//  Tasker
//
//  Created by CEDAM18 on 25/11/24.
//

import SwiftUI


extension Color {
    init(hex: String) {
        // Asegúrate de que el hex tiene 6 caracteres o 8 (con transparencia)
        let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
        
        // Asegúrate de que la cadena tenga 6 o 8 caracteres
        let scanner = Scanner(string: hexSanitized)
        var hexNumber: UInt64 = 0
        scanner.scanHexInt64(&hexNumber)
        
        // Si el color tiene 6 caracteres (sin transparencia)
        if hexSanitized.count == 6 {
            self.init(
                .sRGB, red: Double((hexNumber & 0xFF0000) >> 16) / 255.0,
                green: Double((hexNumber & 0x00FF00) >> 8) / 255.0,
                blue: Double(hexNumber & 0x0000FF) / 255.0,
                opacity: 1.0
            )
        }
        // Si tiene 8 caracteres (con transparencia)
        else if hexSanitized.count == 8 {
            self.init(
                .sRGB, red: Double((hexNumber & 0xFF000000) >> 24) / 255.0,
                green: Double((hexNumber & 0x00FF0000) >> 16) / 255.0,
                blue: Double((hexNumber & 0x0000FF00) >> 8) / 255.0,
                opacity: Double(hexNumber & 0x000000FF) / 255.0
            )
        } else {
            self.init(.gray)  // Si el valor no es válido, usa un gris por defecto
        }
    }
}


struct ContentView: View {
    @State var value = ""
    @State var usuario: String = ""
    @State var contraseña: String = ""
    var carreras: [String]  = ["MAC", "Derecho", "Arquitectura", "Actuaria"]
    var body: some View {
        NavigationStack{
            ZStack{
                Color(hex: "#001F3d").ignoresSafeArea(.all)
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
                        
                  
                             Menu {
                                 ForEach(carreras, id: \.self){ item in
                                     Button(item) {
                                         self.value = item
                                    
                                     }
                                 }
                             } label: {
                                 VStack{
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
                        NavigationLink(destination: Task()){
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

struct vista_principal: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color(hex: "#001F3d").ignoresSafeArea(.all)
                VStack{
                    Spacer()
                    HStack{
                        
                        Button(action: {
                            print("Hola")
                        }){
                            NavigationLink(destination: torneos()){
                                Image("Torneo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    
                            }
                        }
                        Button(action: {
                            print("Hola")
                        }){
                            NavigationLink(destination: personalizacion()){
                                Image("tareas")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    
                            }
                        }
                        Button(action: {
                            print("Hola")
                        }){
                            NavigationLink(destination: personalizacion()){
                                Image(systemName: "gear")
                                   
                                
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    
                            }
                        }
                    }
                }
           
            }
        }
    }
}


struct segunda: View{
    var body: some View{
        ZStack{
            
            VStack{
                Image("chambeame")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 96)
            }
        }
        
    }
}

struct piñata: View {
    @State private var boton_presionado = false
    @State private var pressCount = 0
    @State private var navigateToPremioUno = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#001F3d").ignoresSafeArea(.all)
                VStack {
                    Button(action: {
                        // Incrementa el contador de presiones
                        pressCount += 1
                        
                        // Si el contador llega a 3, activa la navegación
                        if pressCount == 3 {
                            navigateToPremioUno = true
                        }
                        
                        // Resetea el estado de la animación del botón
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
                
                // Navegación condicional hacia premioUno cuando el contador llegue a 3
                NavigationLink(
                    destination: premioUno(),
                    isActive: $navigateToPremioUno
                ) {
                    EmptyView()
                }
            }
        }
    }
}



struct torneos: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo con color hexadecimal
                Color(hex: "#001F3d").ignoresSafeArea()
                
                VStack {
                    // Título en la parte superior
                    Text("Torneos")
                        .font(.largeTitle) // Tamaño de la fuente
                        .foregroundColor(.white)
                        .padding(.top, 40) // Espacio superior para el título
                    
                    Spacer() // Espacio flexible entre el título y los botones

                    // Contenedor vertical para los botones
                    VStack(spacing: 40) {  // Cambié a VStack y agregué espacio entre los botones
                        // Botón 1: Busca objetos
                        VStack {
                            Text("Busca objetos")
                                .foregroundColor(.white)
                                .font(.headline)
                            NavigationLink(destination: BuscarObjetos()) {  // Navegación a BuscarObjetos
                                Image("lupa")  // Asegúrate de tener una imagen llamada "Lup" en tu proyecto
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)  // Tamaño cuadrado del botón
                                    .background(Color.white)  // Fondo blanco para el botón
                                    .clipShape(RoundedRectangle(cornerRadius: 10))  // Esquinas redondeadas
                                    .foregroundColor(.blue)  // Color del ícono
                            }
                        }

                        // Botón 2: Laberinto
                        VStack {
                            Text("Laberinto")
                                .foregroundColor(.white)
                                .font(.headline)
                            NavigationLink(destination: Laberinto()) {  // Navegación a Laberinto
                                Image("laberinto")  // Asegúrate de tener una imagen llamada "Labe" en tu proyecto
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)  // Tamaño cuadrado del botón
                                    .background(Color.white)  // Fondo blanco para el botón
                                    .clipShape(RoundedRectangle(cornerRadius: 10))  // Esquinas redondeadas
                                    .foregroundColor(.red)  // Color del ícono
                            }
                        }

                        // Botón 3: Trivia
                        VStack {
                            Text("Trivia")
                                .foregroundColor(.white)
                                .font(.headline)
                            NavigationLink(destination: Trivia()) {  // Navegación a Trivia
                                Image("quiz")  // Asegúrate de tener una imagen llamada "trivia" en tu proyecto
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)  // Tamaño cuadrado del botón
                                    .background(Color.white)  // Fondo blanco para el botón
                                    .clipShape(RoundedRectangle(cornerRadius: 10))  // Esquinas redondeadas
                                    .foregroundColor(.orange)  // Color del ícono
                            }
                        }
                    }
                    .padding() // Padding para los botones
                    Spacer() // Espacio flexible al final
                }
            }
        }
    }
}







struct Laberinto: View {
    var body: some View {
        
        ZStack {
            // Fondo de color
            Color(hex: "#001F3d").ignoresSafeArea()
            
            VStack {
                // Título en la parte superior
                Text("Laberinto 1")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                Spacer() // Espacio flexible para el título

                // Imagen grande
                Image("Laberinto 1")  // Asegúrate de tener una imagen llamada "labrintoGrande"
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 400)  // Ajuste de tamaño de imagen
                
                Button(action: {
                    print("Hola")
                }){
                    NavigationLink(destination: score()){
                        Image("flechas_def")
                           
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)  // Tamaño pequeño
                            .padding(.top, 20) // Espacio entre las imágenes
                            
                    }
                }

                
            }
        }
    }
}

struct score: View{
    var body: some View{
        ZStack{
            Color(hex: "#001F3d").ignoresSafeArea()
            VStack{
                Text("Puntuación")
                    .font(.title)
                    .foregroundColor(.white)
                Image("Score")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                Image("Mandarinas_recompensa")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding(.top,40)
            }
        }
    }
}




struct Trivia: View {
    var body: some View {
        NavigationStack{
            ZStack {
                // Fondo con color hexadecimal
                Color(hex: "#001F3d").ignoresSafeArea()
                
                VStack {
                    // Título en la parte superior
                    Text("Trivia")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                    Image("SistemaSolar2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                    
                    Spacer() // Espacio flexible para el título

                    // Pregunta
                    Text("¿Cuál es el planeta más grande del sistema solar?")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding()

                    // Opciones
                    HStack(spacing: 40) {
                        Button(action: {
                            // Acción para opción 1
                            print("Opción 1: Jupiter")
                        }) {
                            NavigationLink(destination: respuesta_correcta()){
                                Text("Jupiter")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .padding()
                                    .frame(width: 150, height: 80)
                                    .background(Color.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                   
                        

                        Button(action: {
                            // Acción para opción 2
                            print("Opción 2 ")
                        }) {
                            NavigationLink(destination: respuesta_incorrecta()){
                                Text("Venus")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .padding()
                                    .frame(width: 150, height: 80)
                                    .background(Color.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                        }
                    }
                    .padding(.top, 20)
                }
            }
        }
      
    }
}

struct respuesta_incorrecta: View{
    var body: some View{
        ZStack{
            Color(hex: "#001F3d").ignoresSafeArea()
            VStack{
                Text("La respuesta es incorrecta")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
        }
    }
}

struct respuesta_correcta: View{
    var body: some View{
        ZStack{
            Color(hex: "#001F3d").ignoresSafeArea()
            VStack{
                Text("La respuesta es correcta Obtuviste 1 / 1")
                    .font(.title)
                    .foregroundColor(.white)
                
                Button(action: {
                    print("Hola")
                }){
                    NavigationLink(destination: score()){
                        Text("Ver resultados")
                           
                            .foregroundColor(.white)
                            .frame(width: 150, height: 150)  // Tamaño pequeño
                            .padding(.top, 20) // Espacio entre las imágenes
                            
                    }
                }            }
            
        }
    }
}


struct BuscarObjetos: View {
    var body: some View {
        ZStack {
            // Fondo con color hexadecimal
            
            Image("BuscarO")  // Asegúrate de tener una imagen .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
            
               
                
                Spacer() // Espacio flexible para el título

                
                
            }
                .ignoresSafeArea()
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
            
    }
}

struct personalizacion: View {
    var body: some View {
        ZStack {
            Color(hex: "#001F3d").ignoresSafeArea(.all)
            VStack {
                
                HStack {
                    Image(systemName: "person.fill")
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                    
                    Text("Cristiano")
                        .foregroundColor(Color.white)
                        .font(.title)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)

              
                HStack {
                    Image(systemName: "gear")
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                    
                    Text("Configuración")
                        .foregroundColor(Color.white)
                        .font(.title)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image("Gato_vestido2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400)
            }
            .padding()
        }
    }
}



struct premioUno: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#001F3d").ignoresSafeArea(.all)
                VStack{
                    Image("Piñata_sencilla")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 320)
                        .padding(.top,1)
                        .padding(.bottom,90)
                    HStack{
                        Image("Cañas")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 230)
                        Text("X10").foregroundStyle(.white).font(.system(size: 60))
                        
                    }
                }
                
            }
        }
    }
}



