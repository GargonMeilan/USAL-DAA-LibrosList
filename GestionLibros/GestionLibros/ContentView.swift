import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var libros: [Libro] // Asegúrate de que la clase Libro esté bien definida
    @State private var showingAddItemView = false // Estado para mostrar el formulario

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(libros) { libro in
                    NavigationLink {
                        // Aquí puedes agregar la vista detallada del libro
                        BookDetailView(libro: libro)
                    } label: {
                        Text(libro.titulo) // Muestra el título del libro en la lista
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: { showingAddItemView = true }) { // Cambia a true para mostrar el formulario
                        Label("Añadir Libro", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Selecciona un libro")
        }
        .sheet(isPresented: $showingAddItemView) { // Presenta el formulario como un sheet
            AddItemView() // Aquí llamas a tu vista de formulario
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(libros[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Libro.self, inMemory: true)
}
