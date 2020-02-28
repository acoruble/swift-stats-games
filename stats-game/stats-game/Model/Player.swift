//
//  Model.swift
//  stats-game
//
//  Created by anne-lise on 26/02/2020.
//  Copyright © 2020 anne-lise. All rights reserved.
//

import Foundation

class Player {
    
    var pseudo: String?
    var battleTag: String?
    var typeOfGame: String?
    
    init(pseudo: String, battleTag: String, typeOfGame: String){
        self.pseudo = pseudo
        self.battleTag = battleTag
        self.typeOfGame = typeOfGame
    }
    
    
}
