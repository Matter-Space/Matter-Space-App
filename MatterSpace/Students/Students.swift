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
    
    @State var students: [StudentModel] = [
        StudentModel(id:"1", name: "Sean", academicInfo: "He joined MCRI in May 2025. He has managed to get certfications in Swift Associate and Jamf certified Associate"),
        StudentModel(id:"2", name: "Crown", academicInfo: "He joined MCRI in Feb 2025. He has managed to get certfications in Swift Associate and Jamf certified Associate")
    ]
    
    var body: some View {
        NavigationStack {
            VStack{
                List(students, id: \.id){ student in
                    NavigationLink(student.name){
                        StudentDetails(student: student)
                    }
                }
                
            }
            
        }
    }
}

    struct InternPage: View {
        @AppStorage("selectedTab") var selectedTab: String = "Students"
        @State var interns: [Intern] = [
            Intern(id:"1", name: "Faffie", academicInfo: "He joined MCRI in May 2025. He has managed to get certfications in Swift Associate,  Swift Certified User and Jamf certified Associate"),
            Intern(id:"2", name: "Mildred", academicInfo: "She joined MCRI in 2024. She has managed to get certfications in Swift Associate, Swift Certified User, and Jamf certified Associate.")
        ]
        
        
        var body: some View {
            NavigationStack {
                List(interns, id: \.id){ intern in
                    NavigationLink(intern.name){
                        InternDetails(intern: intern)
                    }
                }
            }
        }
    }

struct GraduatePage: View {
    @AppStorage("selectedTab") var selectedTab: String = "Students"
    @State var graduates: [Graduate] = [
        Graduate(id:"1", name: "Faffie", academicInfo: "He joined MCRI in May 2025. He has managed to get certfications in Swift Associate,  Swift Certified User and Jamf certified Associate"),
        Graduate(id:"2", name: "Mildred", academicInfo: "She joined MCRI in 2024. She has managed to get certfications in Swift Associate, Swift Certified User, and Jamf certified Associate.")
    ]
    
    var body: some View {
        NavigationStack {
            List(graduates, id: \.id){ graduate in
                NavigationLink(graduate.name){
                    GraduateDetails(graduate: graduate)
                }
            }
        }
    }
    
}

#Preview {
    StudentPage()
}

