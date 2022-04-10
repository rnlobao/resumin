//
//  LivrosModel.swift
//  resumin
//
//  Created by Robson Novato Lobao on 25/02/22.
//

import Foundation

struct AllBooks: Codable {
    let books: [BooksModel]?
}

struct BooksModel: Codable {
    let nome: String?
    let capa: String?
    let resumo: String?
}
