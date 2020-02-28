//
//  Model.swift
//  stats-game
//
//  Created by onsoft on 26/02/2020.
//  Copyright © 2020 onsoft. All rights reserved.
//

import Foundation

class Player {
    
    var pseudo: String?
    var battleTag: String?
    var level: String?
    var ranking: String?
    var typeOfGame: String?
    
    init(pseudo: String, battleTag: String, level: String, ranking: String, typeOfGame: String){
        self.pseudo = pseudo
        self.battleTag = battleTag
        self.level = level
        self.ranking = ranking
        self.typeOfGame = typeOfGame
    }
    
    
}
