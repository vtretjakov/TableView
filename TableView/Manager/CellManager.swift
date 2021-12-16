//
//  CellManager.swift
//  TableView
//
//  Created by Владимир on 14.12.2021.
//

import Foundation
import UIKit

class CellManager {
    
    func configure(_ cell: UITableViewCell, with emoji: Emoji) {
        
        cell.textLabel?.text = emoji.symbol
        cell.detailTextLabel?.text = emoji.name
        
    }
    
}
