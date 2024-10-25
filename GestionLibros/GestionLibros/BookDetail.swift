import SwiftUI

struct BookDetailView: View {
    var libro: Libro // Recibe el libro como un parámetro

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(libro.titulo)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Año de Publicación: \(libro.anoPublicacion, formatter: dateFormatter)")
            Text("Número de Páginas: \(libro.nPaginas)")
            Text("Precio: $\(libro.precio, specifier: "%.2f")")
            Text("Autor: \(libro.autor.name) \(libro.autor.ape_1) \(libro.autor.ape_2)")
            Text("Progreso: \(libro.status)%")
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detalles del Libro")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Formateador de fecha para mostrar el año
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
}
