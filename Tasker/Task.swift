//
//  Task.swift
//  Tasker
//
//  Created by CEDAM19 on 25/11/24.
//
import SwiftUI

#Preview{
    Task()
}

struct Task: View{
    @State private var Tarea1: Bool = false
    @State private var Tarea2: Bool = false
    @State private var Tarea3: Bool = false
    @State private var Tarea4: Bool = false
    @State private var Tarea5: Bool = false
    @State private var Tarea6: Bool = false
    @State private var Tarea7: Bool = false
    @State private var Tarea8: Bool = false
    @State private var timer: Timer? = nil
    
    func marcarTarea1() {
            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                Tarea1 = true
            }
        }
    
    func marcarTarea2() {
            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                Tarea2 = true
            }
        }
    
    var progresoTareas: Double {
            let tareasCompletadas = [Tarea6, Tarea7, Tarea8].filter { $0 }.count
            return Double(tareasCompletadas) / Double(3)
        }
    var progresoHabitos: Double {
            let tareasCompletadas = [Tarea1, Tarea2, Tarea3, Tarea4, Tarea5].filter { $0 }.count
            return Double(tareasCompletadas) / Double(5)
        }
    var body: some View{
        @State var Fecha: Date=Date()
        NavigationStack(){
            ZStack{
                Color(hex: "#001F3d").ignoresSafeArea(.all)
                ScrollView{
                    VStack{
                        HStack{
                            ProgressView(value: progresoTareas,total:1).accentColor(progresoTareas == 1.0 ? .green : .purple).frame(width: 100)
                            NavigationLink{
                                addTask()
                            } label: {
                                Label("",systemImage: "plus.app")
                            }
                            NavigationLink{
                                addHabit()
                            } label:{
                                Label("",systemImage: "plus.app.fill")
                            }
                            ProgressView(value: progresoHabitos,total:1).accentColor(progresoHabitos == 1.0 ? .green : .blue).frame(width: 100)
                        }
                        DatePicker("Estas son tus tareas y habitos", selection: $Fecha,displayedComponents: [.date]).datePickerStyle(.graphical).colorScheme(.dark)
                        Toggle(isOn: $Tarea1){
                            HStack{
                                Image("Habito_enfoque").resizable()
                                    .scaledToFit().frame(width:30,height:30)
                                Text("Estudiar 30 minutos").strikethrough(Tarea1)
                                Button("Iniciar") {
                                    marcarTarea1()
                                }.padding().frame(height: 25)
                            }
                        }
                        Toggle(isOn:$Tarea2){
                            HStack{
                                Image("Habito_lectura").resizable()
                                    .scaledToFit().frame(width:30,height:30)
                                Text("Leer 15 minutos").strikethrough(Tarea2)
                                Button("Iniciar") {
                                    marcarTarea2()
                                }.padding().frame(height: 25)
                            }
                        }
                        Toggle(isOn:$Tarea3){
                            HStack{
                                Image("Habito_ejercicio").resizable()
                                    .scaledToFit().frame(width:30,height:30)
                                Text("Hacer sentadillas").strikethrough(Tarea3)
                            }
                        }
                        Toggle(isOn:$Tarea4){
                            HStack{
                                Image("Habito_saluddental").resizable()
                                    .scaledToFit().frame(width:30,height:30)
                                Text("Cepillarse los dientes").strikethrough(Tarea4)
                            }
                        }
                        Toggle(isOn:$Tarea5){
                            HStack{
                                Image("Habito_tomaragua").resizable()
                                    .scaledToFit().frame(width:30,height:30)
                                Text("Tomar 6 vasos de agua").strikethrough(Tarea5)
                            }
                        }
                        Toggle(isOn:$Tarea6){
                            HStack{
                                Image("Habito_comersaludable").resizable()
                                    .scaledToFit().frame(width:30,height:30)
                                Text("Comer una fruta").strikethrough(Tarea6)
                            }
                        }
                        Toggle(isOn:$Tarea7){
                            HStack{
                                Image("Habito_ahorrardinero").resizable()
                                    .scaledToFit().frame(width:30,height:30)
                                Text("Reducir gastos hormiga").strikethrough(Tarea7)
                            }
                        }
                        Toggle(isOn:$Tarea8){
                            HStack{
                                Image("Habito_Organizacion").resizable()
                                    .scaledToFit().frame(width:30,height:30)
                                Text("Escombrar el cuarto").strikethrough(Tarea8)
                            }
                        }
                        NavigationLink(destination: piñata(),isActive: .constant(progresoTareas==1)){EmptyView()}
                        NavigationLink(destination: piñata(),isActive: .constant(progresoHabitos==1)){EmptyView()}
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
                }.foregroundStyle(.white)
            }
        }
    }
}


struct addHabit:View {
    let imagenes = ["Habito_enfoque", "Habito_lectura", "Habito_ejercicio", "Habito_saluddental", "Habito_tomaragua","Habito_ahorrardinero","Habito_comersaludable","Habito_Organizacion","Habito_organizarcomida","Habito_puntualidad","Habito_trabajarenMetas"]
    @State private var imagenSeleccionada: String = "Habito_enfoque"
    var body: some View {
        @Environment(\.calendar) var calendar
        @Environment(\.timeZone) var timeZone
    

        var bounds: Range<Date> {
            let start = Date()
            let end = Calendar.current.date(byAdding:.year,value:1, to:Date())!
            return start ..< end
        }
        @State var HabitoP = Habit(Nombre:"", Desc:"",Fecha: [], Hora: Date())
        ZStack{
            Color(hex: "#001F3d").ignoresSafeArea(.all)
            ScrollView{
                VStack{
                        TextField("Tarea", text: $HabitoP.Nombre)
                        TextField("Descripción", text: $HabitoP.Desc)
                        MultiDatePicker("Elige las Fechas", selection: $HabitoP.Fecha, in: bounds)
                        DatePicker("Elige la hora", selection: $HabitoP.Hora,displayedComponents: [.hourAndMinute])
                        HStack {
                                        Text("¿Qué tipo de Habito será?")
                                            .font(.title)
                                            .padding()

                                        Picker("Selecciona una imagen", selection: $imagenSeleccionada) {
                                            ForEach(imagenes, id: \.self) { imagen in
                                                HStack {
                                                    Image(imagen)
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 30, height: 30)
                                                }
                                                .padding(5)
                                            }
                                        }
                                        .pickerStyle(WheelPickerStyle())
                                        .padding()
                                    }
                        NavigationLink(destination: Task()) {
                                            Text("Agregar")
                                                .font(.title)
                                                .padding()
                                                .background(Color.blue)
                                                .foregroundColor(.white)
                                                .cornerRadius(10)
                                                .shadow(radius: 5)
                                                .frame(width: 150,height: 50)
                                        }
                    }.foregroundStyle(.white).colorScheme(.dark)
                }
            }
    }
}

struct addTask:View {
    let imagenes = ["Habito_enfoque", "Habito_lectura", "Habito_ejercicio", "Habito_saluddental", "Habito_tomaragua","Habito_ahorrardinero","Habito_comersaludable","Habito_Organizacion","Habito_organizarcomida","Habito_puntualidad","Habito_trabajarenMetas"]
    @State private var imagenSeleccionada: String = "Habito_enfoque"
    var body: some View {
        var rango: ClosedRange<Date> {
            let today = Calendar.current.date(byAdding: .minute, value: -1, to: Date())!
            let uno = Calendar.current.date(byAdding: .year, value: 1, to: Date())!
            return today...uno
        }
        @State var TareaP = Tarea(Nombre:"", Desc:"",Fecha:Date())
        ZStack{
            Color(hex: "#001F3d").ignoresSafeArea(.all)
            VStack{
                TextField("Tarea", text: $TareaP.Nombre)
                TextField("Descripción", text: $TareaP.Desc)
                DatePicker("ELige la fecha", selection: $TareaP.Fecha,in: rango)
                HStack {
                                Text("¿Qué tipo de Tarea será?")
                                    .font(.title)
                                    .padding()

                                Picker("Selecciona una imagen", selection: $imagenSeleccionada) {
                                    ForEach(imagenes, id: \.self) { imagen in
                                        HStack {
                                            Image(imagen)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 30, height: 30)
                                        }
                                        .padding(5)
                                    }
                                }
                                .pickerStyle(WheelPickerStyle())
                                .padding()
                            }
                NavigationLink(destination: Task()) {
                                    Text("Agregar")
                                        .font(.title)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .frame(width: 150,height: 50)
                                }
            }.foregroundStyle(.white).colorScheme(.dark)
        }
    }
}

class Tarea{
    var Nombre: String
    var Desc: String
    var Fecha: Date
    init(Nombre: String, Desc: String, Fecha: Date) {
        self.Nombre = Nombre
        self.Desc = Desc
        self.Fecha = Fecha
    }
}

class Habit{
    var Nombre: String
    var Desc: String
    var Fecha: Set<DateComponents>
    var Hora: Date
    init(Nombre: String, Desc: String, Fecha: Set<DateComponents>, Hora:Date) {
        self.Nombre = Nombre
        self.Desc = Desc
        self.Fecha = Fecha
        self.Hora = Hora
    }
}
