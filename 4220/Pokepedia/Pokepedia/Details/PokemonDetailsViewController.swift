import UIKit

import PokemonFoundation

// TODO: - Create a `UIViewController` subclass. (See following)
//
// - Name it `PokemonDetailsViewController`.
// - Implement the viewcontroller requirements as listed in `Project 1`.
// - Use `PokemonDetails.storyboard` to manage the UI layout.
//
// HINT: - This class will be used by `ViewPokemonDetailsAction`.
// HINT: - Make sure the view controller takes in a `Pokémon` as a parameter!

public final class PokemonDetailsViewController: UIViewController {
    
    private let pokémon: Pokémon
    //private let service: PokémonService
    
    init(pokémon: Pokémon) {
        self.pokémon = pokémon
        //self.service = service
        print(pokémon.name)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
