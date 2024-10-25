//
//  Libro.swift
//  GestionLibros
//
//  Created by alumno on 25/10/24.
//Libro: Que contiene información sobre el título, año de publicación,
//número de páginas, precio, autor y el status de lectura junto con el
//progreso.

import Foundation
import SwiftData

@Model
final class Libro {
    var id: Int
    var titulo: String
    var anoPublicacion: Date
    var nPaginas: Int
    var precio: Float
    var autor: Autor
    var status: Int
    
    init(id: Int, titulo: String, anoPublicacion: Date, nPaginas: Int, precio: Float, autor: Autor, status: Int) {
        self.id = id
        self.titulo = titulo
        self.anoPublicacion = anoPublicacion
        self.nPaginas = nPaginas
        self.precio = precio
        self.autor = autor
        self.status = status
    }
    
}
