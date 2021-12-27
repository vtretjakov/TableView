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
