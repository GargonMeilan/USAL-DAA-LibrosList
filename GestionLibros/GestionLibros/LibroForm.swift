import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var titulo: String = ""
    @State private var anoPublicacion: Date = Date()
    @State private var nPaginas: String = ""
    @State private var precio: String = ""
    @State private var autorNombre: String = ""
    @State private var autorApe1: String = ""
    @State private var autorApe2: String = ""
    @State private var progreso: Double = 0

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Información del Libro")) {
                    TextField("Título", text: $titulo)
                    DatePicker("Año de Publicación", selection: $anoPublicacion, displayedComponents: .date)
                    TextField("Número de Páginas", text: $nPaginas)
                        .keyboardType(.numberPad)
                    TextField("Precio", text: $precio)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Información del Autor")) {
                    TextField("Nombre del Autor", text: $autorNombre)
                    
                    TextField("Apellido1", text: $autorApe1)
                    TextField("Apellido2", text: $autorApe2)

                }

                Section(header: Text("Progreso de Lectura")) {
                                    Slider(value: $progreso, in: 0...100, step: 1) // Slider para el progreso
                                    Text("Progreso: \(Int(progreso))%") // Muestra el progreso actual
                                }
                
                Button("Añadir Libro") {
                    addItem()
                }
            }
            .navigationTitle("Añadir Libro")
            .navigationBarItems(trailing: Button("Cerrar") {
                dismiss()
            })
        }
    }

    private func addItem() {
        guard let nPaginasInt = Int(nPaginas), let precioFloat = Float(precio) else { return }
        //init(id: Int, titulo: String, anoPublicacion: Date, nPaginas: Int, precio: Float, autor: Autor, status: Int)
        let autor = Autor(id: 2, name: autorNombre, ape_1: autorApe1, ape_2: autorApe2)
        let nuevoLibro = Libro(id: 1, titulo: titulo, anoPublicacion: anoPublicacion, nPaginas: nPaginasInt, precio: precioFloat, autor: autor, status: Int(progreso))
        
        modelContext.insert(nuevoLibro)
        dismiss()
    }
}

