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
    var imageView = UIImageView()
    
    
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var gameTextField: UILabel!
    @IBOutlet weak var levelTextField: UILabel!
    @IBOutlet weak var rankTextField: UILabel!
    @IBOutlet weak var test: UIImageView!
    @IBOutlet weak var levelIcon: UIImageView!
    @IBOutlet weak var rankIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infosPlayer = apiOverwatch.connectAPI(pseudo: game.pseudo ?? "", battleTag: game.battleTag ?? "")
        setTextLabel()
        // Do any additional setup after loading the view.
    }
    
    
    private func setTextLabel(){
        nameTextField.text = game.pseudo
        gameTextField.text = game.typeOfGame
        levelTextField.text = "\(infosPlayer!.prestige)\(infosPlayer!.level)"
        rankTextField.text = "\(infosPlayer!.rating)"

        
        let urlImage = URL(string: "https://image.blockbusterbd.net/00416_main_image_04072019225805.png")!
        print(urlImage)
        let result = self.imageView.loadImages(url:urlImage)
        print(result)
        
        levelIcon.image = result
    }
    
}

extension UIImageView {
    func loadImages(url: URL!) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image=image
                    }
                }
            }
        }
    }
}
