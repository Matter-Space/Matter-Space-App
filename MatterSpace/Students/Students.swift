//
//  Students.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//



import SwiftUI


struct Students: View {
    
    @AppStorage("selectedTab") var selectedTab: String = "Students"
    @State var tabs = ["Students", "Interns", "Graduates"]
    
    @AppStorage("token") var token:String = ""
    @AppStorage("userType") var userType:String = ""
    
    
    var body: some View {
        VStack{
            Picker("Tabs", selection: $selectedTab){
                ForEach(tabs, id: \.self) { tab in
                    Text(tab).tag(tab)
                }
            }
            .pickerStyle(.segmented)
            
            VStack{
                switch selectedTab{
                case "Students":
                    StudentPage()
                case "Interns":
                    InternPage()
                case "Graduates":
                    GraduatePage()
                default:
                    StudentPage()
                }
            }
        }
    }
}

struct StudentPage: View {
    
    @State var students: [StudentModel] = []
    @State var student = StudentModel(id:"2", name: "Crown", academicInfo: "He joined MCRI in Feb 2025. He has managed to get certfications in Swift Associate and Jamf certified Associate")
    @AppStorage("token") var token:String = ""
    @State var isAdding:Bool = false
    @State var errorMessage: String?
    let studentService: StudentService = StudentService()
    @State var searchStudent: String = ""
    
    var body: some View {
        NavigationStack {
            VStack{
               List(filteredStudents){ student in
                    NavigationLink(student.name){
                        StudentDetails(student: student)
                    }
               }
                
            }
            .searchable(text: $searchStudent, prompt: "Search for Student")
            .onAppear(){
                refresh()
            }
            .toolbar{
                ToolbarItem(placement: .bottomBar){
                    Button{
                        isAdding.toggle()
                    } label:{
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isAdding, onDismiss: dismiss){
                        AddStudent(added: $isAdding)
                            .presentationDetents([.medium])
                            .onDisappear(){
                                refresh()
                            }
                    }
                    
                }
            }
            
        }
    }
    func dismiss(){
        
    }
    var filteredStudents:[StudentModel]{
        if searchStudent.isEmpty{
            return students
        } else{
            return students.filter {$0.name.localizedCaseInsensitiveContains(searchStudent)}
        }
    }
}

struct InternPage: View {
    @AppStorage("selectedTab") var selectedTab: String = "Students"
    @State var interns: [Intern] = []
        @State var intern = Intern(id:"1", name: "Faffie", academicInfo: "He joined MCRI in May 2025. He has managed to get certfications in Swift Associate,  Swift Certified User and Jamf certified Associate")
    @State var isAdding:Bool = false
    let internService: InternService = InternService()
    @State private var searchIntern: String = ""
    @AppStorage("token") var token: String = ""
    
    var body: some View {
        NavigationStack {
           List(filteredInterns){ intern in
                NavigationLink(intern.name){
                    InternDetails(intern: intern)
              }
            }
           .searchable(text: $searchIntern, prompt: "Search for Intern")
                .onAppear(){
                    refresh()
                }
            .toolbar{
                ToolbarItem(placement: .bottomBar){
                    Button{
                        isAdding.toggle()
                    } label:{
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isAdding, onDismiss: dismiss){
                        AddIntern(added: $isAdding)
                            .presentationDetents([.medium])
                            .onDisappear(){
                                refresh()
                            }
                    }
                }
            }
        }
    }
    func dismiss(){
        
    }
    var filteredInterns:[Intern]{
        if searchIntern.isEmpty{
            return interns
        } else{
            return interns.filter {$0.name.localizedCaseInsensitiveContains(searchIntern)}
        }
    }
}

struct GraduatePage: View {
    @AppStorage("token") var token:String = ""
    @AppStorage("selectedTab") var selectedTab: String = "Students"
    let graduateService: GraduateService = GraduateService()
    @State var graduates: [Graduate] = []
    
        @State var graduate = Graduate(id:"1", name: "Faffie", academicInfo: "He joined MCRI in May 2025. He has managed to get certfications in Swift Associate,  Swift Certified User and Jamf certified Associate")
    
    @State var isAdding:Bool = false
    @State private var searchGraduate:String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                   List(filteredGraduates){ graduate in
                        NavigationLink(graduate.name){
                            GraduateDetails(graduate: graduate)
                        }
                    }
                }
                .searchable(text: $searchGraduate, prompt: "Search for a graduate")
                .onAppear(){
                    refresh()
                }
                .toolbar{
                    ToolbarItem(placement: .bottomBar){
                        Button{
                            isAdding.toggle()
                        } label:{
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $isAdding, onDismiss: dismiss){
                            AddGraduate(added: $isAdding)
                                .presentationDetents([.medium])
                                .onDisappear(){
                                    refresh()
                                }
                        }
                    }
                }
            }
            
        }
    }
    func dismiss(){
        
    }
    var filteredGraduates:[Graduate]{
        if searchGraduate.isEmpty{
            return graduates
        } else{
            return graduates.filter {$0.name.localizedCaseInsensitiveContains(searchGraduate)}
        }
    }
}




#Preview {
    StudentPage()
}

