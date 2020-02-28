//
//  Accueil.swift
//  stats-game
//
//  Created by anne-lise on 25/02/2020.
//  Copyright © 2020 anne-lise. All rights reserved.
//

import Foundation
import UIKit

class Accueil: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var gamesPickerView: UIPickerView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var battleTagTextField: UITextField!
    
    var game: Player!
    
    // Au chargement de la view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSuccess" {
            let successVC = segue.destination as! ViewController
            successVC.game = game
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //Pour remplir le sélecteur
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return games.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return games[row]
    }
    
    @IBAction func validate() {
        createPlayerObject()
        performSegue(withIdentifier: "segueToSuccess", sender: nil)
    }
    
    private func createPlayerObject(){
        let pseudo = nameTextField.text
        let battleTag = battleTagTextField.text
        let gamesIndex = gamesPickerView.selectedRow(inComponent:0)
        let oneGame = games[gamesIndex]
        game = Player(pseudo: pseudo ?? "", battleTag: battleTag ?? "", typeOfGame: oneGame)
    }
    
    //Pour faire apparaitre et disparaitre le clavier
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBOutlet var dismissKeyboard: UITapGestureRecognizer!
    
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        battleTagTextField.resignFirstResponder()
    }    
    
}
