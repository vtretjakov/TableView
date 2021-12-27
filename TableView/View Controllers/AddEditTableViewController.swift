//
//  AddEditTableViewController.swift
//  TableView
//
//  Created by Владимир on 14.12.2021.
//

import UIKit

class AddEditTableViewController: UITableViewController {
    
    //MARK: - Outlets
    
    @IBOutlet var symbolTextField: UITextField!
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var descriptionTextField: UITextField!
    
    @IBOutlet var usageTextField: UITextField!
    
    //MARK: - Properties
    
    var emoji = Emoji()
    
    //MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    
    //MARK: - Methods
    
    func updateUI() {
        symbolTextField.text = emoji.symbol
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
        usageTextField.text = emoji.usage
    }
    
    func saveEmoji() {
        emoji.symbol = symbolTextField.text ?? ""
        emoji.name = nameTextField.text ?? ""
        emoji.description = descriptionTextField.text ?? ""
        emoji.usage = usageTextField.text ?? ""
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        saveEmoji()
    }
}
