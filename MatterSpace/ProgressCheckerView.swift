//
//  StudentUpdates.swift
//  MatterSpace
//
//  Created by Boitumelo Sialumba on 12/12/2025.
//

import SwiftUI

struct EditUpdateView: View {
    @Environment(\.dismiss) var dismiss
    var update: ProjectUpdate
    @Binding var updates: [ProjectUpdate]

    @State private var title: String
    @State private var description: String
    @State private var status: String
    @State private var stakeholder: String

    init(update: ProjectUpdate, updates: Binding<[ProjectUpdate]>) {
        self.update = update
        self._updates = updates
        _title = State(initialValue: update.title)
        _description = State(initialValue: update.description)
        _status = State(initialValue: update.status)
        _stakeholder = State(initialValue: update.stakeholder)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Update")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    Picker("Status", selection: $status) {
                        Text("In Progress").tag("In Progress")
                        Text("Completed").tag("Completed")
                        Text("Not Done").tag("Blocked")
                    }
                    TextField("Submitted By", text: $stakeholder)
                }

                Button("Save Changes") {
                    if let index = updates.firstIndex(where: { $0.id == update.id }) {
                        updates[index].title = title
                        updates[index].description = description
                        updates[index].status = status
                        updates[index].stakeholder = stakeholder
                    }
                    dismiss()
                }
            }
            .navigationTitle("Edit Update")
            .navigationBarItems(trailing: Button("Cancel") { dismiss() })
        }
    }
}

struct ProjectUpdate: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var status: String // e.g., "In Progress", "Completed", "Blocked"
    var timestamp: Date
    var stakeholder: String // User role (e.g., "Manager", "Donor", etc.)
}


struct ProgressCircle: View {
    var status: String
    
    var body: some View {
        Circle()
            .fill(getColor(for: status))
            .frame(width: 24, height: 24) // Circle size
            .overlay(Circle().stroke(Color.black, lineWidth: 1))
    }
    
    private func getColor(for status: String) -> Color {
        switch status {
        case "Completed":
            return .green
        case "In Progress":
            return .blue
        case "Not Done":
            return .red
        default:
            return .gray
        }
    }
}


struct ProgressCheckerView: View {
    @State private var updates: [ProjectUpdate] = []
    @State private var showAddUpdateSheet = false
    @State private var searchText = ""
    @State private var editMode: EditMode = .inactive
    @State private var editingUpdate: ProjectUpdate? = nil

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                
                List {
                    ForEach(filteredUpdates) { update in
                        HStack {
                            ProgressCircle(status: update.status)
                            VStack(alignment: .leading) {
                                Text(update.title).font(.headline)
                                Text(update.description).font(.subheadline)
                                Text("Status: \(update.status)").foregroundColor(getStatusColor(status: update.status))
                                Text("Submitted by: \(update.stakeholder)").font(.caption).foregroundColor(.gray)
                                
                                Spacer()
                                
                                if editMode == .active {
                                                                Button(action: {
                                                                    editingUpdate = update
                                                                }) {
                                                                    Image(systemName: "pencil")
                                                                }
                                                                .buttonStyle(BorderlessButtonStyle()) // makes it clickable inside List
                                                            }
                            }
                        }
                    }
                    .onDelete(perform: deleteUpdate)
                }
                .sheet(item: $editingUpdate) { update in
                    EditUpdateView(update: update, updates: $updates)
                }
                .environment(\.editMode, $editMode) // <--- Connect edit mode here
            }
            .navigationTitle("Progress Checker")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Toggle EditMode
                        editMode = (editMode == .active) ? .inactive : .active
                    }) {
                        Text(editMode == .active ? "Done" : "Edit")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddUpdateSheet = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddUpdateSheet) {
                AddUpdateView(updates: $updates)
            }
        }
    }
    
    private var filteredUpdates: [ProjectUpdate] {
        if searchText.isEmpty {
            return updates
        } else {
            return updates.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    private func getStatusColor(status: String) -> Color {
        switch status {
        case "Completed": return .green
        case "In Progress": return .blue
        case "Not Done": return .red
        default: return .gray
        }
    }
    
    private func deleteUpdate(at offsets: IndexSet) {
        updates.remove(atOffsets: offsets)
    }
}



struct AddUpdateView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var updates: [ProjectUpdate]
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var status: String = "In Progress" // Default status
    @State private var stakeholder: String = "" // User role input
    @State private var student: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Update Information")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    TextField("For",text: $student)
                    Picker("Status", selection: $status) {
                        Text("In Progress").tag("In Progress")
                        Text("Completed").tag("Completed")
                        Text("Not Done").tag("Blocked")
                    }
                    TextField("Submitted By", text: $stakeholder)
                }
                
                Button("Submit Update") {
                    let newUpdate = ProjectUpdate(title: title, description: description, status: status, timestamp: Date(), stakeholder: stakeholder)
                    updates.append(newUpdate)
                    dismiss()
                }
            }
            .navigationTitle("Add Update")
            .navigationBarItems(trailing: Button("Cancel") {
                dismiss()
            })
        }
    }
}


struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        SearchBarRepresentable(text: $text)
    }
}

struct SearchBarRepresentable: UIViewRepresentable {
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    @Binding var text: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.placeholder = "Search Updates"
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}


#Preview {
    ProgressCheckerView()
}
