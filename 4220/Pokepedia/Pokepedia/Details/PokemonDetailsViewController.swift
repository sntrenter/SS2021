import UIKit

import PokemonFoundation
//optional chaining,default values
//don't display entire array, display "first"

final class PokemonDetailsViewController: UIViewController {
        
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var baseEXPLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightlabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var abiltiyLabel: UILabel!
    @IBOutlet weak var moveLabel: UILabel!
    @IBOutlet weak var heldItemsLabel: UILabel!
    
    private var pokémon: Pokémon!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(pokémon?.name ?? "default")
        nameLabel.text = "name: " +  (pokémon?.name ?? "Name doesn't exist!")
        print(pokémon?.id ?? 0)
        idLabel.text = "ID: " + String(pokémon?.id ?? 0)
        print(pokémon?.baseExperience ?? 0)
        baseEXPLabel.text =  "BaseEXP: " + String(pokémon?.baseExperience ?? 0)
        print(pokémon?.height ?? 0)
        heightLabel.text = "Height: " + String(pokémon?.height ?? 0)
        print(pokémon?.weight ?? 0)
        weightlabel.text = "Weight: " + String(pokémon?.weight ?? 0)
        print(pokémon?.species?.name ?? "No Species?")
        speciesLabel.text = "Species: " + (pokémon?.species?.name ?? "No Species?")
        print(pokémon?.types?.first?.type?.name ?? "No Type?")
        typeLabel.text = "Type: " + (pokémon?.types?.first?.type?.name ?? "No Type?")
        print(pokémon.abilities?.first?.ability?.name ?? "No Abilty?")
        abiltiyLabel.text = "Ability: " + (pokémon.abilities?.first?.ability?.name ?? "No Abilty?")
        print(pokémon.moves?.first?.move?.name ?? "No Move?" )
        moveLabel.text = "Move: " + (pokémon.moves?.first?.move?.name ?? "No Move?")
        print(pokémon.heldItems?.first?.item?.name ?? "No Item?")
        heldItemsLabel.text = "Held Item: " + (pokémon.heldItems?.first?.item?.name ?? "No Item?")
        //print(pokémon.stats?.first?.stat?.name ?? "No Stat?")
        
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
