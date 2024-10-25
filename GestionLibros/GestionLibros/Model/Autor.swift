//
//  Autor.swift
//  GestionLibros
//
//  Created by alumno on 25/10/24.
//

import Foundation
import SwiftData

@Model
final class Autor {
    var id: Int
    var name: String
    var ape_1: String
    var ape_2: String

    init(id: Int, name: String, ape_1: String, ape_2: String) {
        self.id = id
        self.name = name
        self.ape_1 = ape_1
        self.ape_2 = ape_2
    }
}
