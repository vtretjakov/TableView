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
    
}
