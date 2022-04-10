//
//  HomeViewModel.swift
//  resumin
//
//  Created by Robson Novato Lobao on 10/04/22.
//

import Foundation


class HomeViewModel {
    func bookOfTheDay() -> BooksModel {
        return BooksModel(nome: "Livro1", capa: "livro1", resumo: "Lorem ipsum")
    }
}
