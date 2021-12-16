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

extension Emoji {
    static var all: [Emoji] {
        return [
            Emoji(symbol: "💰", name: "Деньги", description: "Мешок со знаком доллара", usage: "Ответить когда речь идет о деньгах"),
            Emoji(symbol: "🐱", name: "Кошка", description: "Мордочка кошки", usage: "Что-то дружелюбное"),            Emoji(symbol: "☑️", name: "Галочка", description: "Галочка на сером фоне", usage: "Дела сделаны"),            Emoji(symbol: "⛔️", name: "Стоп", description: "Знак Стоп", usage: "Проезд запрещен"),
        ]
    }
    
    static func loadAll() -> [Emoji]? {
        return nil
    }
    
    static func loadDefaults() -> [Emoji] {
        return all
    }
    
}
