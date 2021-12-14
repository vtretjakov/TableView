//
//  EmojiTableViewController.swift
//  TableView
//
//  Created by Владимир on 14.12.2021.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    var emojis = [Emoji]()
    
    
}
// MARK: - UITableViewDataSource

extension EmojiTableViewController /*: UITableViewDataSource */ {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emoji = emojis[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell")!
        return cell
    }
    
}
