import UIKit

import PokemonFoundation
import PokemonUIKit

final class ViewPokemonDetailsAction: PokédexMenuItemAction {
    
    let title: String = "Veiw Pokemon"
    
    var image: UIImage? { UIImage(systemName: "photo") }
}

extension ViewPokemonDetailsAction {
    
    func viewController(for pokémon: Pokémon) -> UIViewController {
        let itemsToDisplayInFirstVC: [FirstVCTableViewItem] = pokémon.abilities?.compactMap { ability in
            guard
                let name = ability.ability?.name?.capitalized,
                let slot = ability.slot,
                let url = ability.ability?.url
            else {
                return nil
            }
            
            return FirstVCTableViewItem(name: name, detail: "Slot #\(slot)", url: url)
        }
        ?? []
        return PokemonDetailsViewController.instance(items: itemsToDisplayInFirstVC)
    }
}
struct FirstVCTableViewItem { //RENAME
    let name: String
    let detail: String
    let url: URL
}
