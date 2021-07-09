import UIKit

import PokemonFoundation
import PokemonUIKit

// TODO: - Create a `PokédexMenuItemAction`. (See following)
//
// - Create a class.
// - Name it `ViewPokemonDetailsAction`.
// - Conform it to the `PokédexMenuItemAction` protocol.
// - Implement the required methods.


final class ViewPokemonDetailsAction: PokédexMenuItemAction{
    var title: String = ""
    
    var image: UIImage?
    
    func viewController(for pokémon: Pokémon) -> UIViewController {
        return PokemonDetailsViewController(pokémon: pokémon)
    }
    
    
    
    
}


//final class ViewPokémonSpritesAction: PokédexMenuItemAction {
//
//    private let service: PokémonService
//
//    let title: String = LocalizedString.title.value
//
//    var image: UIImage? { UIImage(systemName: "photo") }
//
//    init(service: PokémonService) {
//        self.service = service
//    }
//}
