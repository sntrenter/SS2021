import UIKit
import PokemonFoundation
import AVFoundation
import PokemonCryKit


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
    @IBOutlet weak var cryButton: UIButton!
    
    private var pokémon: Pokémon!
    private var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "name: " +  (pokémon?.name ?? "Name doesn't exist!")
        idLabel.text = "ID: " + String(pokémon?.id ?? 0)
        baseEXPLabel.text =  "BaseEXP: " + String(pokémon?.baseExperience ?? 0)
        heightLabel.text = "Height: " + String(pokémon?.height ?? 0)
        weightlabel.text = "Weight: " + String(pokémon?.weight ?? 0)
        speciesLabel.text = "Species: " + (pokémon?.species?.name ?? "No Species?")
        typeLabel.text = "Type: " + (pokémon?.types?.first?.type?.name ?? "No Type?")
        abiltiyLabel.text = "Ability: " + (pokémon.abilities?.first?.ability?.name ?? "No Abilty?")
        moveLabel.text = "Move: " + (pokémon.moves?.first?.move?.name ?? "No Move?")
        heldItemsLabel.text = "Held Item: " + (pokémon.heldItems?.first?.item?.name ?? "No Item?")
        audioPlayer = PokemonCryProvider().audioPlayer(forPokémonWithDisplayName: pokémon?.displayName ?? "")
        
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
extension PokemonDetailsViewController {
    @IBAction func pokeCryButton(_ sender: Any) {
        if audioPlayer?.play() == nil {
            let alert = UIAlertController(title: "Error", message: "This Pokemon has No Cry", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            audioPlayer?.play()
        }
    }
}
