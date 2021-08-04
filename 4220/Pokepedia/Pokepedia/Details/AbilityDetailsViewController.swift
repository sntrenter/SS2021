//
//  AbilityDetailsViewController.swift
//  Pokepedia
//
//  Created by CompSci 4220 Student on 8/4/21.
//
import UIKit
import PokemonFoundation
import AVFoundation
import PokemonCryKit

import Foundation

final class AbilityDetailsViewController: UIViewController {
        
    private var pokémon: Pokémon!
    private var url: String!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded viewController")
    }
}

extension AbilityDetailsViewController {
    
    static func instance() -> AbilityDetailsViewController {
        // swiftlint:disable:next force_cast
        let viewController = UIStoryboard(name: "AbilityDetailsViewController", bundle: nil).instantiateInitialViewController() as! AbilityDetailsViewController
        //viewController.pokémon = pokemon
        //viewController.url = url
        return viewController
    }
}
