 //
//  PokemonDetailController.swift
//  pokedex#3
//
//  Created by Jonathan Mitchell on 11/16/16.
//  Copyright © 2016 J Mitchell. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var TypeLbl: UILabel!
    @IBOutlet weak var defenceLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImage.image = img
        currentEvoImage.image = img
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetail {
            //whatever we write will only be called after the network call is complete!
            self.updateUI()
        }
    }
    
    func updateUI() {
        
        baseAttackLbl.text = pokemon.attck
        defenceLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        TypeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImage.isHidden = true
        } else {
            
            nextEvoImage.isHidden = false
            nextEvoImage.image = UIImage(named: pokemon.nextEvolutionId)
            
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LvL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
