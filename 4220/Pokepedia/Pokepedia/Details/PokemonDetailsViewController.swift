import UIKit

import PokemonFoundation
//optional chaining,default values
//don't display entire array, display "first"

final class PokemonDetailsViewController: UIViewController {
        
    @IBOutlet weak var name: UILabel!
    
    private var pokémon: Pokémon!

    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = pokémon?.name ?? "Name doesn't exist!"

    }
}
extension PokemonDetailsViewController {
    
    static func instance(pokemon: Pokémon) -> PokemonDetailsViewController {
        // swiftlint:disable:next force_cast
        let viewController = UIStoryboard(name: "PokemonDetails", bundle: nil).instantiateInitialViewController() as! PokemonDetailsViewController
        viewController.pokémon = pokemon
        
        return viewController
    }
}
