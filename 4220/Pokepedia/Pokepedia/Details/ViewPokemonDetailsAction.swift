import UIKit

import PokemonFoundation
import PokemonUIKit

final class ViewPokemonDetailsAction: PokédexMenuItemAction {
    
    let title: String = "Veiw Pokemon"
    
    var image: UIImage? { UIImage(systemName: "photo") }
}

extension ViewPokemonDetailsAction {
    
    func viewController(for pokémon: Pokémon) -> UIViewController {
        
        return PokemonDetailsViewController.instance(pokemon: pokémon)
    }
}
