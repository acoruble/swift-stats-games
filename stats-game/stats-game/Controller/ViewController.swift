//
//  ViewController.swift
//  stats-game
//
//  Created by onsoft on 25/02/2020.
//  Copyright © 2020 onsoft. All rights reserved.
//
import UIKit
import Foundation

class ViewController: UIViewController {
    
    var game: Player!
    var infosPlayer: APIOverwatch.InfosPlayer?
    let apiOverwatch = APIOverwatch()
    
    
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var gameTextField: UILabel!
    @IBOutlet weak var levelTextField: UILabel!
    @IBOutlet weak var rankTextField: UILabel!
    @IBOutlet var levelIcon: UIImageView!
    @IBOutlet weak var rankIcon: UIImageView!
    
    var urlKeyIcon = ""
    var urlKeyRank = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infosPlayer = apiOverwatch.connectAPI(pseudo: game.pseudo ?? "", battleTag: game.battleTag ?? "")
        setTextLabel()
        loadImageLevel()
        loadImageRank()
    }
    
    private func setTextLabel(){
        nameTextField.text = game.pseudo
        gameTextField.text = game.typeOfGame
        levelTextField.text = "\(infosPlayer!.prestige)\(infosPlayer!.level)"
        rankTextField.text = "\(infosPlayer!.rating)"
        urlKeyIcon = "\(infosPlayer!.levelIcon)"
        urlKeyRank = "\(infosPlayer!.ratingIcon)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadImageLevel()  {
        if let url = URL(string: urlKeyIcon){
            do {
                let data = try Data(contentsOf: url)
                self.levelIcon.image = UIImage(data: data)
                print("C'est ok !")
            }
            catch let err{
                print("Error : \(err.localizedDescription)")
            }
        }
    }
    
    func loadImageRank()  {
        if let url = URL(string: urlKeyRank){
            do {
                let data = try Data(contentsOf: url)
                self.rankIcon.image = UIImage(data: data)
                print("C'est ok !")
            }
            catch let err{
                print("Error : \(err.localizedDescription)")
            }
        }
    }
}
