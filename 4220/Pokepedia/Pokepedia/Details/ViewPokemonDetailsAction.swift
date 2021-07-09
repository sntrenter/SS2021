import UIKit

import PokemonFoundation
import PokemonUIKit

// TODO: - Create a `PokédexMenuItemAction`. (See following)
//
// - Create a class.
// - Name it `ViewPokemonDetailsAction`.
// - Conform it to the `PokédexMenuItemAction` protocol.
// - Implement the required methods.

final class ViewPokemonDetailsAction: PokédexMenuItemAction {
    
    //private let service: PokémonService
    
    let title: String//LocalizedString.title.value
    
    var image: UIImage? { UIImage(systemName: "photo") }
    
    init() {
        self.title = "Veiw Pokemon"
    }
}

extension ViewPokemonDetailsAction {
    
    func viewController(for pokémon: Pokémon) -> UIViewController {
        
        return PokemonDetailsViewController(pokémon: pokémon)
    }
}

//extension ViewPokemonDetailsAction {
//
//    private enum LocalizedString: String {
//        case title = "pokemon-sprites-action.title.text"
//
//        var value: String { Bundle.module.localizedString(forKey: rawValue, comment: nil)}
//    }
//}
