//
//  EmojiTableViewController.swift
//  TableView
//
//  Created by Владимир on 14.12.2021.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    // MARK: - Properties
    
    let cellManager = CellManager()
    var emojis: [Emoji]!
    
    // MARK: - UIViewControllerMethods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojis = Emoji.loadAll() ?? Emoji.loadDefaults()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
}
// MARK: - UITableViewDataSource

extension EmojiTableViewController /*: UITableViewDataSource */ {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emoji = emojis[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell")! as! EmojiCell /// конвертируем
        cellManager.configure(cell, with: emoji)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    
    }
    
}

// MARK: - UITableViewDelegate

extension EmojiTableViewController /*: UITableViewDataSource */ {
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
            
        case.delete:
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        case.insert:
            break
            
        case.none:
            break
            
        @unknown default:
            break
            
        }
        
        
    }
    
}
