import SwiftUI

// DATA MODEL
import SwiftUI

// DATA MODEL
struct NewsItem: Codable, Identifiable {
    var id: String? = UUID().uuidString
    var imageURL: String?
    var category: String
    var title: String
    var description: String
    var createdAt: String?
}

// NEWS CARD COMPONENT
struct NewsCard: View {
    var imageURL: String?
    var category: String
    var title: String
    var description: String
    var createdAt: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Image
            if let imageURL,
               let url = URL(string: imageURL) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 350, height: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 350, height: 200)
                            .clipped()
                            .cornerRadius(16)
                    case .failure(_):
                        Color.gray.opacity(0.3)
                            .frame(width: 350, height: 200)
                            .overlay(
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                                    .foregroundColor(.gray)
                            )
                            .cornerRadius(16)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Color.gray.opacity(0.3)
                    .frame(width: 350, height: 200)
                    .overlay(
                        Text("No Image")
                            .foregroundColor(.black)
                            .font(.headline)
                    )
                    .cornerRadius(16)
            }

            // Category + createdAt
            HStack(spacing: 8) {
                Text(category)
                    .font(.caption2)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.red.opacity(0.2))
                    .foregroundColor(.red)
                    .cornerRadius(8)

                Text(createdAt)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            // Title & description
            Text(title)
                .font(.headline)
                .bold()

            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .shadow(radius: 8)
        .frame(width: 350)
    }
}

// ADD NEWS SHEET (POPUP FORM)
struct AddNewsSheet: View {
    @Environment(\.dismiss) var dismiss
    @Binding var newsItems: [NewsItem]

    @State private var category = ""
    @State private var title = ""
    @State private var description = ""
    @State private var imageURL = ""
    @State private var createdAt = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Image URL") {
                    TextField("Enter image URL", text: $imageURL)
                        .keyboardType(.URL)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)

                    if let url = URL(string: imageURL), !imageURL.isEmpty {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(height: 150)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 150)
                                    .clipped()
                                    .cornerRadius(12)
                            case .failure(_):
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 150)
                                    .foregroundColor(.gray)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                }

                Section("Category") { TextField("Category", text: $category) }
                Section("Title") { TextField("News title", text: $title) }
                Section("Description") { TextField("Description", text: $description) }
            }
            .navigationTitle("Add News")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newCard = NewsItem(
                            imageURL: imageURL.isEmpty ? nil : imageURL,
                            category: category,
                            title: title,
                            description: description,
                            createdAt: createdAt
                        )
                        newsItems.append(newCard)
                        dismiss()
                    }
                    .disabled(category.isEmpty || title.isEmpty || description.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}

// EDIT NEWS SHEET
struct EditNewsSheet: View {
    @Environment(\.dismiss) var dismiss
    @Binding var newsItems: [NewsItem]
    var item: NewsItem

    @State private var imageURL = ""
    @State private var category = ""
    @State private var title = ""
    @State private var description = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Image URL") {
                    TextField("Image URL", text: $imageURL)

                    if let url = URL(string: imageURL), !imageURL.isEmpty {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView().frame(height: 150)
                            case .success(let image):
                                image.resizable().scaledToFill().frame(height: 150).clipped()
                            case .failure(_):
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 150)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                }

                Section("Category") { TextField("Category", text: $category) }
                Section("Title") { TextField("Title", text: $title) }
                Section("Description") { TextField("Description", text: $description) }
            }
            .navigationTitle("Edit News")
            .onAppear {
                imageURL = item.imageURL ?? ""
                category = item.category
                title = item.title
                description = item.description
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if let index = newsItems.firstIndex(where: { $0.id == item.id }) {
                            newsItems[index].imageURL = imageURL
                            newsItems[index].category = category
                            newsItems[index].title = title
                            newsItems[index].description = description
                        }
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}

// MAIN VIEW
struct Community: View {
    @State private var showAddSheet = false
    @State private var newsItems: [NewsItem] = []
    
    // Used to trigger the Edit sheet
    @State private var selectedItem: NewsItem? = nil

    var body: some View {
        VStack {
            // HEADER
            HStack {
                Text("Matter Community")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Button { showAddSheet.toggle() } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                }
            }
            .padding()

            // CARDS
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 50) {
                    ForEach(newsItems) { item in
                        ZStack(alignment: .bottomTrailing) {

                            NewsCard(
                                imageURL: item.imageURL,
                                category: item.category,
                                title: item.title,
                                description: item.description,
                                createdAt: item.createdAt ?? ""
                            )

                            Menu {
                                Button("Edit") {
                                    selectedItem = item  // THIS now opens the sheet
                                }
                                Button("Delete", role: .destructive) {
                                    if let index = newsItems.firstIndex(where: { $0.id == item.id }) {
                                        newsItems.remove(at: index)
                                    }
                                }
                            } label: {
                                Image(systemName: "ellipsis.circle.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.gray)
                                    .padding(8)
                                    .offset(x: 13)
                            }
                        }
                        .frame(width: 350)
                    }
                }
                .padding()
            }

            Spacer()
        }
        .sheet(isPresented: $showAddSheet) {
            AddNewsSheet(newsItems: $newsItems)
        }

        // THIS is the correct way to show the edit sheet
        .sheet(item: $selectedItem) { item in
            EditNewsSheet(newsItems: $newsItems, item: item)
        }
    }
}


// PREVIEW
#Preview {
    Community()
}
