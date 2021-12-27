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
            
            //MARK: - colorBackground
            
            let color1 = UIColor(red: 14 / 15, green: 40 / 41, blue: 76 / 75 , alpha: 0.0).cgColor
            let color2 = UIColor(red: 243 / 255, green: 155 / 255, blue: 51 / 255, alpha: 1.0).cgColor
            
            
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.view.bounds
            gradientLayer.colors = [color1, color2]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
            self.view.layer.insertSublayer(gradientLayer, at: 0)

            ///
            
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "EditSegue" else {return}
        guard let selectedPath = tableView.indexPathForSelectedRow else {return}
        let emoji = emojis[selectedPath.row]
        let destination = segue.destination as! AddEditTableViewController
        destination.emoji = emoji
        
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

// MARK: - Actions

extension EmojiTableViewController {
    @IBAction func unwind (_ segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else {return}
        
        let source = segue.source as! AddEditTableViewController
        let emoji = source.emoji
        
        if let selectedPath = tableView.indexPathForSelectedRow {
            // Edited cell
            emojis[selectedPath.row] = emoji
            tableView.reloadRows(at: [selectedPath], with: .automatic)
        } else {
            // Added cell
            let indexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
}
