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
    
    //Proj 2
    @IBOutlet weak var APITableView: UITableView!
    
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
        
        //Proj 2
        //APITableView.delegate = self
        //APITableView.dataSource = self
        //let urlstring = "https://pokeapi.co/api/v2/pokemon/151"
        let urlstring = "https://pokeapi.co/api/v2/pokemon/" + String(pokémon?.id ?? 0)
        guard let url = URL(string: urlstring) else {
            exit(1)
        }
        testAPI(url: url)
        
    }
}

extension PokemonDetailsViewController {
    //call this in the didload function
    func testAPI(url: URL) {
        print(url)
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task: URLSessionDataTask = session.dataTask(with: request) {data, response, error in
            //print(data!)
            //print(response)
            //print(error)
            if error != nil {
                print("fml")
                exit(1)
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print("could not parse response")
                exit(1)
            }
            let statusCode = 200...299 ~= httpResponse.statusCode
            
            guard statusCode else {
                print(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
                exit(1)
            }
            guard let data = data else {
                print("No Data")
                exit(1)
            }
            print("the data is \(data)")
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
                print("could not parse JSON")
                exit(1)
            }
            //print(json)
            do {
            let datajson: Data = try JSONSerialization.data(withJSONObject: json, options: [])
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let abilities  = try decoder.decode(Pokemon.self, from: datajson)
            print(abilities)

            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
extension PokemonDetailsViewController {
    struct Ability: Decodable {
        let name: String
        let url: String
    }
    struct Abilities: Decodable {
        let isHidden: Bool 
        let slot: Int
        let ability: Ability
        
    }
    struct Pokemon: Decodable {
        let abilities: [Abilities]
    }
}

final class AbilityDetailsViewController: UIViewController {
    
}

//extension PokemonDetailsViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//}

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
extension PokemonDetailsViewController {
    
    static func instance(pokemon: Pokémon) -> PokemonDetailsViewController {
        // swiftlint:disable:next force_cast
        let viewController = UIStoryboard(name: "PokemonDetails", bundle: nil).instantiateInitialViewController() as! PokemonDetailsViewController
        viewController.pokémon = pokemon
        
        return viewController
    }
}
