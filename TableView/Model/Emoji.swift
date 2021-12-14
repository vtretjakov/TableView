//
//  Emoji.swift
//  TableView
//
//  Created by Владимир on 14.12.2021.
//

struct Emoji {
    var symbol: String
    var name: String
    var description: String  /// описание
    var usage: String  /// в каких ситуациях используется

    init(symbol: String = "", name: String = "", description: String = "", usage: String = "") {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
